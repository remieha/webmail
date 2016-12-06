package fr.remie.webmail.service;

import java.util.List;

import fr.remie.webmail.model.Message;

public interface MessagesService {
	
	public Message getMessage(Integer id);
	public void save(Message message, Integer senderId);
	public void delete(Message message);
	public List<Message> findAll();
	
}
