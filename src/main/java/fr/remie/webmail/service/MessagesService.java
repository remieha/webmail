package fr.remie.webmail.service;

import java.util.List;
import java.util.Set;

import fr.remie.webmail.model.Message;
import fr.remie.webmail.model.User;

public interface MessagesService {
	
	public Message getMessage(Integer id);
	public void save(Message message);
	public void delete(Message message);
	public List<Message> findAll();
	public List<Message> receivedMessages(Integer id);
	public List<Message> sentMessages(Integer id);

	
}
