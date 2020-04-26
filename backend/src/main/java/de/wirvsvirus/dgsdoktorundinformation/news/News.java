package de.wirvsvirus.dgsdoktorundinformation.news;

import java.net.URL;
import java.util.Date;

import lombok.Data;

/**
 * Link - Gebärdensprachvideo(true/false) - Untertitel(true/false) - leichte Sprache(true/false) - (Erfassungs-)Datum/Timestamps 
 *
 */
@Data
public class News {

	private URL link;
	
	private boolean gebaerdensprachVideo;
	
	private boolean untertitel;
	
	private boolean leichteSprache;
	
	private Date erfassungsZeit;
	
}
