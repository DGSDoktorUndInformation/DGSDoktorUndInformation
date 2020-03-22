package de.wirvsvirus.dgsdoktorundinformation.message;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class MessageListResponse {

	List<Message> message = new ArrayList<>();
	
	public List<Message> getMessage() {
		return message;
	}
	
}
