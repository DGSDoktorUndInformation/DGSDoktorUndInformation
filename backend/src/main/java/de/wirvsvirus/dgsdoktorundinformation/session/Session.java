package de.wirvsvirus.dgsdoktorundinformation.session;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import de.wirvsvirus.dgsdoktorundinformation.message.Message;
import lombok.Data;

@Data
public class Session {
	
	private Long id;
	
	private String patientenCode;
	
	private Person kontaktPerson;
	
	private Person patient;
	
	private Map<String, String> selbstTest;

	private List<Message> messages = new ArrayList<>();

}
