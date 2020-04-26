package de.wirvsvirus.dgsdoktorundinformation.news;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("/news")
public class NewsController {

	public static List<News> newsFeed = new ArrayList<>();
	
	@GetMapping("/v1.0")
	public List<News> getNews(int pageSize, Date offset) {
		return newsFeed.stream().sorted((n1,n2) -> n2.getErfassungsZeit().compareTo(n1.getErfassungsZeit())).filter(n -> n.getErfassungsZeit().compareTo(offset)<0).limit(pageSize).collect(Collectors.toList());
	}
}
