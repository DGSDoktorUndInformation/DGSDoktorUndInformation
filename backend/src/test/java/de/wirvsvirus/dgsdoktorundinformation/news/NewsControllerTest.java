package de.wirvsvirus.dgsdoktorundinformation.news;


import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.junit.jupiter.api.Test;



class NewsControllerTest {

	@Test
	void testGetNews() {
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
		new NewsController().getNews(5, new GregorianCalendar(2014, Calendar.FEBRUARY, 28).getTime()).stream().forEach(n -> System.out.println(n));
	}

	private News createNewsDummy(long i) {
		News news = new News();
		news.setErfassungsZeit(new Date(i));
		return news;
	}

}
