package de.wirvsvirus.dgsdoktorundinformation.session;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import de.wirvsvirus.dgsdoktorundinformation.message.Message;

@RestController
public class SessionController {

	private Map<String,Session> sessionStore = new HashMap<>();

	@PostMapping("/session")
	@ResponseBody
	@ResponseStatus(code = HttpStatus.CREATED)
	public SessionResponse createSession(@RequestBody SessionRequest sessionRequest) {
		Random random = new Random();
		String patientenCode = Integer.toHexString(random.nextInt(100000));
		
		Session session = new Session();
		session.setKontaktPerson(sessionRequest.getKontaktPerson());
		session.setPatient(sessionRequest.getPatient());
		session.setSelbstTest(sessionRequest.getSelbstTest());
		

		sessionStore.put(patientenCode,session);
		//Session persistieren
		SessionResponse sessionResponse = new SessionResponse();
		sessionResponse.setPatientenCode(patientenCode);
		sessionResponse.add(WebMvcLinkBuilder.linkTo((WebMvcLinkBuilder.methodOn(SessionController.class)).loadSession(sessionResponse.getPatientenCode())).withSelfRel());
		sessionResponse.setKontaktPerson(session.getKontaktPerson());
		sessionResponse.setPatient(session.getPatient());
		sessionResponse.setSelbstTest(session.getSelbstTest());
		return sessionResponse;
	}

	@GetMapping("/session/{patientenCode}")
	@ResponseBody
	public SessionResponse loadSession( @PathVariable String patientenCode) {
		Session session = sessionStore.get(patientenCode);

		//  Load Session with SessionId
		SessionResponse sessionResponse = new SessionResponse();
		sessionResponse.setPatientenCode(patientenCode);
		sessionResponse.setPatient(session.getPatient());
		Person kontaktPerson = session.getKontaktPerson();
		sessionResponse.setKontaktPerson(kontaktPerson );
		sessionResponse.setSelbstTest(session.getSelbstTest());
		sessionResponse.add(WebMvcLinkBuilder.linkTo((WebMvcLinkBuilder.methodOn(SessionController.class)).loadSession(sessionResponse.getPatientenCode())).withSelfRel());
		return sessionResponse;
	}

	@PostMapping("/session/{patientenCode}/message")
	@ResponseStatus(code = HttpStatus.CREATED)
	public void postMessage(@RequestBody Message message, @PathVariable String patientenCode) {
		message.setId(UUID.randomUUID());
		message.setDate(LocalDateTime.now());

		sessionStore.get(patientenCode).getMessages().add(message);
		System.out.println(message.getVideoPfad());
		System.out.println("Storing Message " + message.getNachrichtenText() + " to Session "+patientenCode);
	}

	@GetMapping("/session/{patientenCode}/message")
	public List<Message> getMessages(@PathVariable String patientenCode) {
		return sessionStore.get(patientenCode).getMessages();
	}

}
