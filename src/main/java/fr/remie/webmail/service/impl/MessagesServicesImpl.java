package fr.remie.webmail.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import fr.remie.webmail.dao.MessagesDAO;
import fr.remie.webmail.model.Message;
import fr.remie.webmail.model.User;
import fr.remie.webmail.service.MessagesService;

@Component("messagesService")
public class MessagesServicesImpl implements MessagesService {
	
	@Autowired
	public MessagesDAO messagesDao;

	public Message getMessage(Integer id) {
		return messagesDao.getById(id);
	}

	public void save(Message message) {
		Date date = new Date();
		message.setDate(date);
		messagesDao.save(message);
	}

	public void delete(Message message) {
		messagesDao.delete(message);
	}

	public List<Message> findAll() {
		return messagesDao.findAll();
	}

	public List<Message> receivedMessages(Integer id) {
		return messagesDao.receivedMessages(id);
	}

	public List<Message> sentMessages(Integer id) {
		return messagesDao.sentMessages(id);
	}

}
