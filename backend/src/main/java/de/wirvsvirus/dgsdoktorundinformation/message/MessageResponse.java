package de.wirvsvirus.dgsdoktorundinformation.message;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.hateoas.RepresentationModel;

public class MessageResponse extends RepresentationModel<MessageResponse> {

	private String nachrichtenText;
	
	private Collection<String> antwortOptionen = new ArrayList<>();
	
	public Collection<String> getAntwortOptionen() {
		return antwortOptionen;
	}
	public void setAntwortOptionen(Collection<String> antwortOptionen) {
		this.antwortOptionen = antwortOptionen;
	}
	public String getNachrichtenText() {
		return nachrichtenText;
	}
	public void setNachrichtenText(String nachrichtenText) {
		this.nachrichtenText = nachrichtenText;
	}
}
