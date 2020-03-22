package de.wirvsvirus.dgsdoktorundinformation.session;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.websocket.server.PathParam;

import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import de.wirvsvirus.dgsdoktorundinformation.message.Message;
import de.wirvsvirus.dgsdoktorundinformation.video.VideoController;

@RestController
public class SessionController {
	
	private Map<String,Session> sessionStore = new HashMap<>();

	@PostMapping("/session")
	@ResponseBody
	public SessionResponse createSession(@RequestBody SessionRequest sessionRequest) {
		Random random = new Random();
		String patientenCode = Integer.toHexString(random.nextInt(100000));

		Session session = new Session();
		Person kontaktPerson = new Person();
		kontaktPerson.setVorname("James");
		kontaktPerson.setName("Hetfield");
		session.setKontaktPerson(kontaktPerson);

		sessionStore.put(patientenCode,session);
		//Session persistieren
		SessionResponse sessionResponse = new SessionResponse();
		sessionResponse.setPatientenCode(patientenCode);
		sessionResponse.add(WebMvcLinkBuilder.linkTo((WebMvcLinkBuilder.methodOn(SessionController.class)).loadSession(sessionResponse.getPatientenCode())).withSelfRel());
		return sessionResponse;
	}
	
	@GetMapping("/session/{patientenCode}")
	@ResponseBody
	public SessionResponse loadSession( @PathVariable String patientenCode) {
		Session session = sessionStore.get(patientenCode);
		
		//  Load Session with SessionId
		SessionResponse sessionResponse = new SessionResponse();
		sessionResponse.setPatientenCode(patientenCode);
		sessionResponse.setPatientenName("Lemmy Kilmister");
		Person kontaktPerson = session.getKontaktPerson();
		sessionResponse.setKontaktPerson(kontaktPerson );
		sessionResponse.add(WebMvcLinkBuilder.linkTo((WebMvcLinkBuilder.methodOn(SessionController.class)).loadSession(sessionResponse.getPatientenCode())).withSelfRel());
		return sessionResponse;
	}
	
	@PostMapping("/session/{patientenCode}/message")
	public void postMessage(@RequestBody Message message, @PathVariable String patientenCode) {
		sessionStore.get(patientenCode).getMessages().add(message);
		System.out.println(message.getVideoPfad());
		System.out.println("Storing Message " + message.getNachrichtenText() + " to Session "+patientenCode);
	}
	
	@GetMapping("/session/{patientenCode}/message")
	public List<Message> getLastMessage(@PathVariable String patientenCode) {
		List<Message> response = new ArrayList<>();
		return sessionStore.get(patientenCode).getMessages();
	}
	
}
