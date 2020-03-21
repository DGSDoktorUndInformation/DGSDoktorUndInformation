package de.wirvsvirus.dgsdoktorundinformation.message;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import de.wirvsvirus.dgsdoktorundinformation.video.VideoController;

@RestController
public class MessageController  {
	
	@GetMapping("/messageRepository")
	@ResponseBody
	public MessageListResponse findMessages( @RequestParam Collection<String> tag) {
		
		System.out.println(tag);
		Collection<Message> messages= new ArrayList<>();
		ArrayList<String> hustenOptionen = new ArrayList<>();
		hustenOptionen.add("trocken");
		hustenOptionen.add("schmerzhaft");
		hustenOptionen.add("lange andauernd");
		messages.add(createMessage("Beschreiben sie Ihren Husten.","descHustenId",hustenOptionen));
		Collection<String> jaNeinOptionen = new ArrayList<>() ;
		jaNeinOptionen.add("Ja");
		jaNeinOptionen.add("Nein");
		messages.add(createMessage("Haben Sie Husten?","askHustenId",jaNeinOptionen  ));
		messages.add(createMessage("Wie oft husten Sie?","numberHustenId",new ArrayList<>()));

		MessageListResponse response = new MessageListResponse();
		for (Message message : messages) {
			MessageResponse messageResponse = new MessageResponse();
			messageResponse.setNachrichtenText(message.getNachrichtenText());
			messageResponse.getAntwortOptionen().addAll(message.getAntwortOptionen());
			messageResponse.add(WebMvcLinkBuilder.linkTo((WebMvcLinkBuilder.methodOn(VideoController.class)).showVideo(message.getVideoPfad())).withSelfRel());
			response.getMessage().add(messageResponse);
		}
		return response;
	}

	private Message createMessage(String text, String videoId, Collection<String> jaNeinOptionen) {
		Message message = new Message();
		message.setNachrichtenText(text);
		message.setVideoPfad(videoId);
		message.getAntwortOptionen().addAll(jaNeinOptionen);
		return message ;
	}

}
