package de.wirvsvirus.dgsdoktorundinformation.session;

import javax.websocket.server.PathParam;

import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SessionController {

	@PostMapping("/session")
	@ResponseBody
	public SessionResponse createSession(@RequestBody SessionRequest sessionRequest) {
		Session session = new Session();
		//Session persistieren
		SessionResponse sessionResponse = new SessionResponse();
		sessionResponse.setPatientenCode("ABCDE");
		sessionResponse.add(WebMvcLinkBuilder.linkTo((WebMvcLinkBuilder.methodOn(SessionController.class)).loadSession(sessionResponse.getPatientenCode())).withSelfRel());
		return sessionResponse;
	}
	
	@GetMapping("/session/{partientenCode}")
	@ResponseBody
	public SessionResponse loadSession( @PathVariable String partientenCode) {
		//  Load Session with SessionId
		SessionResponse sessionResponse = new SessionResponse();
		sessionResponse.setPatientenCode(partientenCode);
		sessionResponse.setPatientenName("Lemmy Kilmister");
		Person kontaktPerson = new Person();
		kontaktPerson.setVorname("James");
		kontaktPerson.setName("Hetfield");
		sessionResponse.setKontaktPerson(kontaktPerson );
		sessionResponse.add(WebMvcLinkBuilder.linkTo((WebMvcLinkBuilder.methodOn(SessionController.class)).loadSession(sessionResponse.getPatientenCode())).withSelfRel());
		return sessionResponse;
	}
	
}
