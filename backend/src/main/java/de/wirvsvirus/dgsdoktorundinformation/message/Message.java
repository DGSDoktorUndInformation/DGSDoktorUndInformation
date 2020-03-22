package de.wirvsvirus.dgsdoktorundinformation.message;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.UUID;

import lombok.Data;

@Data
public class Message {
	
	private UUID id;
	private String nachrichtenText;
	private String videoPfad;
	private boolean fromPatient;
	private LocalDateTime date;
	private Collection<String> antwortOptionen = new ArrayList<>();
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public String getNachrichtenText() {
		return nachrichtenText;
	}
	public void setNachrichtenText(String nachrichtenText) {
		this.nachrichtenText = nachrichtenText;
	}
	public String getVideoPfad() {
		return videoPfad;
	}
	public void setVideoPfad(String videoPfad) {
		this.videoPfad = videoPfad;
	}
	public boolean isFromPatient() {
		return fromPatient;
	}
	public void setFromPatient(boolean fromPatient) {
		this.fromPatient = fromPatient;
	}
	public LocalDateTime getDate() {
		return date;
	}
	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	public Collection<String> getAntwortOptionen() {
		return antwortOptionen;
	}
	public void setAntwortOptionen(Collection<String> antwortOptionen) {
		this.antwortOptionen = antwortOptionen;
	}

}
