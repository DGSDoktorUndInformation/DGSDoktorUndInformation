package de.wirvsvirus.dgsdoktorundinformation.session;

public class SessionRequest {

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
}
