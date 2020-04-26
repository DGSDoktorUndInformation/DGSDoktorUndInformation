package de.wirvsvirus.dgsdoktorundinformation;

import java.util.Date;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import de.wirvsvirus.dgsdoktorundinformation.news.News;
import de.wirvsvirus.dgsdoktorundinformation.news.NewsController;

@SpringBootTest
class DgsDoktorUndInformationApplicationTests {

	@Test
	void contextLoads() {
	}

	@Test
	void testGetNews() {
		System.out.println("kasdgjgkslafaksdfh");
		new NewsController().newsFeed.add(createNewsDummy(27));
		new NewsController().newsFeed.add(createNewsDummy(15));		
		new NewsController().newsFeed.add(createNewsDummy(12));
		new NewsController().newsFeed.add(createNewsDummy(13));
		new NewsController().newsFeed.add(createNewsDummy(22));
		new NewsController().newsFeed.add(createNewsDummy(25));
		new NewsController().newsFeed.add(createNewsDummy(12));
		new NewsController().newsFeed.add(createNewsDummy(12));
		new NewsController().newsFeed.add(createNewsDummy(24));
		new NewsController().newsFeed.add(createNewsDummy(21));
		new NewsController().newsFeed.add(createNewsDummy(23));
		new NewsController().newsFeed.add(createNewsDummy(20));
		new NewsController().newsFeed.add(createNewsDummy(2));
		new NewsController().getNews(5, new Date(28)).stream().forEach(n -> System.out.println(n));
	}

	private News createNewsDummy(long i) {
		News news = new News();
		news.setErfassungsZeit(new Date(i));
		return news;
	}

}
