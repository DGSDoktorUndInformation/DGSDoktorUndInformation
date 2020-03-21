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
	
	@PostMapping("/session/{partientenCode}/message")
	public void postMessage(@RequestBody Message message, @PathVariable String partientenCode) {
		System.out.println("Storing Message " + message.getNachrichtenText() + " to Session "+partientenCode);
	}
	
	@GetMapping("/session/{partientenCode}/message")
	public MessageResponse getLastMessage(@PathVariable String partientenCode) {
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
