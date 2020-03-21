package de.wirvsvirus.dgsdoktorundinformation.message;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class MessageListResponse {

	List<MessageResponse> message = new ArrayList<>();
	
	public List<MessageResponse> getMessage() {
		return message;
	}
	
}
