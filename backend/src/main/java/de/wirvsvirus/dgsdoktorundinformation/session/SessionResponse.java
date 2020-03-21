package de.wirvsvirus.dgsdoktorundinformation.session;

import org.springframework.hateoas.RepresentationModel;

public class SessionResponse extends RepresentationModel<SessionResponse>{
	
	private String patientenCode;
	
	private String patientenName;
	
	private Person kontaktPerson;

	public Person getKontaktPerson() {
		return kontaktPerson;
	}

	public void setKontaktPerson(Person kontaktPerson) {
		this.kontaktPerson = kontaktPerson;
	}

	public String getPatientenName() {
		return patientenName;
	}

	public void setPatientenName(String patientenName) {
		this.patientenName = patientenName;
	}

	public String getPatientenCode() {
		return patientenCode;
	}

	public void setPatientenCode(String patientenCode) {
		this.patientenCode = patientenCode;
	}

}
