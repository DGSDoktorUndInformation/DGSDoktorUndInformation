package de.wirvsvirus.dgsdoktorundinformation.session;

public class Person {

	private String name;
	
	private String vorname;
	
	private String telefonNummer;
	
	private String eMailAdresse;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getVorname() {
		return vorname;
	}
	public void setVorname(String vorname) {
		this.vorname = vorname;
	}
	public String getTelefonNummer() {
		return telefonNummer;
	}
	public void setTelefonNummer(String telefonNummer) {
		this.telefonNummer = telefonNummer;
	}
	public String geteMailAdresse() {
		return eMailAdresse;
	}
	public void seteMailAdresse(String eMailAdresse) {
		this.eMailAdresse = eMailAdresse;
	}
}
