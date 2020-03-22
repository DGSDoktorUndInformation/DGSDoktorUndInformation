package de.wirvsvirus.dgsdoktorundinformation.message;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.UUID;

import lombok.Data;

@Data
public class Message {

<<<<<<< HEAD
	private boolean patient;
	
=======
	private UUID id;
>>>>>>> branch 'master' of https://github.com/DGSDoktorUndInformation/DGSDoktorUndInformation.git
	private String nachrichtenText;
	private String videoPfad;
	private boolean fromPatient;
	private LocalDateTime date;
	private Collection<String> antwortOptionen = new ArrayList<>();
<<<<<<< HEAD
	
	public boolean isPatient() {
		return patient;
	}
	public void setPatient(boolean patient) {
		this.patient = patient;
	}

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
	
=======

>>>>>>> branch 'master' of https://github.com/DGSDoktorUndInformation/DGSDoktorUndInformation.git
}
