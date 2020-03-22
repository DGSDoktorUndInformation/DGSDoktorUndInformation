package de.wirvsvirus.dgsdoktorundinformation.session;

import java.time.LocalDateTime;
import java.util.*;

import de.wirvsvirus.dgsdoktorundinformation.message.Message;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.web.bind.annotation.*;

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
		message.setId(UUID.randomUUID());
		message.setDate(LocalDateTime.now());

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
