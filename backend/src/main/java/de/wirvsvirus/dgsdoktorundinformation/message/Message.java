package de.wirvsvirus.dgsdoktorundinformation.message;

import java.util.ArrayList;
import java.util.Collection;

public class Message {

	private String nachrichtenText;
	private String videoPfad;
	private Collection<String> antwortOptionen = new ArrayList<>();
	
	public Collection<String> getAntwortOptionen() {
		return antwortOptionen;
	}
	public String getVideoPfad() {
		return videoPfad;
	}
	public void setVideoPfad(String videoPfad) {
		this.videoPfad = videoPfad;
	}
	public String getNachrichtenText() {
		return nachrichtenText;
	}
	public void setNachrichtenText(String nachrichtenText) {
		this.nachrichtenText = nachrichtenText;
	}
	
}
