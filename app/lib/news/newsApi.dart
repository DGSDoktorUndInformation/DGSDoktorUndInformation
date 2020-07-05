

import 'dart:convert';

import 'package:DGSDocInfo/config.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'news.dart';

class NewsApi {
  var pagesize = 10;
  Map<String, String> headers = {"Content-type": "application/json"};

  Future<List<News>> getNews(int page) async {
    await doLogin();
    var baseUrl = Config.couchdb;
    var response = await http.get("$baseUrl/dgsinfo/_design/flutter/_view/new-view?include_docs=true&skip=" + (pagesize * (page -1)).toString() + "&limit=" +  (pagesize * page).toString(),
        headers: headers);

    List result = jsonDecode(response.body)["rows"];
    return (await Future.wait(result.map((x) async => await createNews(x["value"])))).toList();
  }

  Future<http.Response> doLogin() async {
    Map<String, dynamic> loginJson = {
      "name": Config.user,
      "password": Config.password
    };

    var baseUrl = Config.couchdb;
    var response = await http.post("$baseUrl/_session",
        headers: headers,
    body: jsonEncode(loginJson));
    updateCookie(response);
    return response;
  }

  void updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
      (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }

  Future<News> createNews(newsElement) async {

    var result = await http.Client()
        .get("https://noembed.com/embed?url=" + newsElement["link"]);
    var noembded = json.decode(result.body);

    var news = new News();
    news.url = newsElement["link"];
    news.isEmbeddedVideo = false;
    news.isVideo = newsElement["gebaerdensprachVideo"];
    news.timestamp = DateTime.parse(newsElement["erfassungsZeit"]);
    news.text = noembded["html"] == null ? null : noembded["html"];
    news.title = noembded["title"] == null ? newsElement["link"] : noembded["title"];
    news.thumbnail = noembded["thumbnail_url"] == null ? null : Image.network(noembded["thumbnail_url"]);
    return news;
  }
}
