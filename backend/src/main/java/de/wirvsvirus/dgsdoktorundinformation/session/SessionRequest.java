package de.wirvsvirus.dgsdoktorundinformation.session;

import java.util.HashMap;
import java.util.Map;

public class SessionRequest {

	private Person patient;
	
	private Person kontaktPerson;

	private Map<String, String> selbstTest;

	public Map<String, String> getSelbstTest() {
		return selbstTest;
	}

	public void setSelbstTest(Map<String, String> selbstTest) {
		this.selbstTest = selbstTest;
	}

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
}
