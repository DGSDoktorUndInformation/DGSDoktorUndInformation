package de.wirvsvirus.dgsdoktorundinformation.session;

import java.util.ArrayList;
import java.util.Collection;

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
import de.wirvsvirus.dgsdoktorundinformation.message.MessageResponse;
import de.wirvsvirus.dgsdoktorundinformation.video.VideoController;

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
	
	@GetMapping("/session/{patientenCode}")
	@ResponseBody
	public SessionResponse loadSession( @PathVariable String patientenCode) {
		//  Load Session with SessionId
		SessionResponse sessionResponse = new SessionResponse();
		sessionResponse.setPatientenCode(patientenCode);
		sessionResponse.setPatientenName("Lemmy Kilmister");
		Person kontaktPerson = new Person();
		kontaktPerson.setVorname("James");
		kontaktPerson.setName("Hetfield");
		sessionResponse.setKontaktPerson(kontaktPerson );
		sessionResponse.add(WebMvcLinkBuilder.linkTo((WebMvcLinkBuilder.methodOn(SessionController.class)).loadSession(sessionResponse.getPatientenCode())).withSelfRel());
		return sessionResponse;
	}
	
	@PostMapping("/session/{patientenCode}/message")
	public void postMessage(@RequestBody Message message, @PathVariable String patientenCode) {
		System.out.println("Storing Message " + message.getNachrichtenText() + " to Session "+patientenCode);
	}
	
	@GetMapping("/session/{patientenCode}/message")
	public MessageResponse getLastMessage(@PathVariable String patientenCode) {
		ArrayList<String> hustenOptionen = new ArrayList<>();
		hustenOptionen.add("trocken");
		hustenOptionen.add("schmerzhaft");
		hustenOptionen.add("lange andauernd");
		Message message = createMessage("Beschreiben sie Ihren Husten","descHustenId",hustenOptionen);
		MessageResponse response = new MessageResponse();
		response.setNachrichtenText(message.getNachrichtenText());
		response.getAntwortOptionen().addAll(message.getAntwortOptionen());
		response.add(WebMvcLinkBuilder.linkTo((WebMvcLinkBuilder.methodOn(VideoController.class)).showVideo(message.getVideoPfad())).withSelfRel());
		return response;
	}
	
	private  Message  createMessage(String text, String videoId, Collection<String> jaNeinOptionen) {
		Message message = new Message();
		message.setNachrichtenText(text);
		message.setVideoPfad(videoId);
		message.getAntwortOptionen().addAll(jaNeinOptionen);
		return message;
	}

	
}
