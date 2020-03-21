import 'Frage.dart';

class CorvidSelbsttestFragen {
  List<Frage> getAll() {
    return [
      new Frage("Wie alt?", "https://cdn.jwplayer.com/videos/2fWIXvhA-cqrEIsCv.mp4", ["jünger 40", "40-50", "51-60", "71-80", "über 80"]),
      new Frage("Wo wohnen Sie?", "https://cdn.jwplayer.com/videos/nZ4locA5-xgdDoosc.mp4",["alleine", "nicht alleine"])
    ];
  }
}
