package de.wirvsvirus.dgsdoktorundinformation.session;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import de.wirvsvirus.dgsdoktorundinformation.message.Message;
import lombok.Data;

public class Session {
	
	private Long id;
	
	private String patientenCode;
	
	private Person kontaktPerson;
	
	private Person patient;

	public Person getPatient() {
		return patient;
	}

	public void setPatient(Person patient) {
		this.patient = patient;
	}


	private List<Message> messages = new ArrayList<>();

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPatientenCode() {
		return patientenCode;
	}

	public void setPatientenCode(String patientenCode) {
		this.patientenCode = patientenCode;
	}

	public Person getKontaktPerson() {
		return kontaktPerson;
	}


	public void setKontaktPerson(Person kontaktPerson) {
		this.kontaktPerson = kontaktPerson;
	}
	
	
}
