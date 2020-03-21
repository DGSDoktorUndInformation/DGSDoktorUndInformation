package de.wirvsvirus.dgsdoktorundinformation.video;

import java.io.OutputStream;

import javax.websocket.server.PathParam;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class VideoController {
	
	@GetMapping("/video/{videoId}")
	@ResponseBody
	public OutputStream showVideo(@PathVariable String videoId) {
		return null;
	}

}
