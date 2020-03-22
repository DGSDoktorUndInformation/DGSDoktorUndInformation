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
		if (tag.contains("Husten")) {
			ArrayList<String> hustenOptionen = new ArrayList<>();
			hustenOptionen.add("trocken");
			hustenOptionen.add("schmerzhaft");
			hustenOptionen.add("lange andauernd");
			messages.add(createMessage("Beschreiben sie Ihren Husten.","https://cdn.jwplayer.com/videos/EKqICJKt-cqrEIsCv.mp4",hustenOptionen));
			Collection<String> jaNeinOptionen = new ArrayList<>() ;
			jaNeinOptionen.add("Ja");
			jaNeinOptionen.add("Nein");
			messages.add(createMessage("Haben Sie Husten?","https://cdn.jwplayer.com/videos/bQXjSCvU-3uRaWXX3.mp4",jaNeinOptionen  ));
			messages.add(createMessage("Wie oft husten Sie?","https://cdn.jwplayer.com/videos/1MMzOy95-cqrEIsCv.mp4",new ArrayList<>()));
		}
		if (tag.contains("Fieber")) {
			messages.add(createMessage("Wie hoch war das Fieber?","https://cdn.jwplayer.com/videos/ZHj6MOWJ-3uRaWXX3.mp4",new ArrayList<>()));
			Collection<String> jaNeinOptionen = new ArrayList<>() ;
			jaNeinOptionen.add("Ja");
			jaNeinOptionen.add("Nein");

			messages.add(createMessage("Haben Sie Fieber gemessen?","https://cdn.jwplayer.com/videos/8VGLDEUN-cqrEIsCv.mp",jaNeinOptionen));
		}

		MessageListResponse response = new MessageListResponse();
		for (Message message : messages) {
			response.getMessage().add(message);
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
