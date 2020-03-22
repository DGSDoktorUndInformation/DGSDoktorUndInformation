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

}
