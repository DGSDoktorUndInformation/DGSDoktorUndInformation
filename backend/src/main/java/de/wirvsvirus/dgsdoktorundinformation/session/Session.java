package de.wirvsvirus.dgsdoktorundinformation.session;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class Session {
	
	@Id @GeneratedValue 
	private Long id;
	
	private String patientenCode;
	
	
}
