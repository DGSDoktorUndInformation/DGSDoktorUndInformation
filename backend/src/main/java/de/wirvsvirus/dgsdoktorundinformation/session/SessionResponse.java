package de.wirvsvirus.dgsdoktorundinformation.session;

import org.springframework.hateoas.RepresentationModel;

public class SessionResponse extends RepresentationModel<SessionResponse>{
	
	private String patientenCode;
	
	private Person patient;

	private Person kontaktPerson;

	public Person getPatient() {
		return patient;
	}

	public void setPatient(Person patient) {
		this.patient = patient;
	}
	
	public Person getKontaktPerson() {
		return kontaktPerson;
	}

	public void setKontaktPerson(Person kontaktPerson) {
		this.kontaktPerson = kontaktPerson;
	}

	public String getPatientenCode() {
		return patientenCode;
	}

	public void setPatientenCode(String patientenCode) {
		this.patientenCode = patientenCode;
	}

}
