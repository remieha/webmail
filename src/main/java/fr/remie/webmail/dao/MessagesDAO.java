package fr.remie.webmail.dao;

import java.util.List;

import fr.remie.webmail.model.Message;

public interface MessagesDAO {
	public Message getById(Integer id);
	public void save(Message message);
	public void delete(Message message);
	public List<Message> findAll();
	public List<Message> receivedMessages(Integer id);
	public List<Message> sentMessages(Integer id);
}
