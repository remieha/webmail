package fr.remie.webmail.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import fr.remie.webmail.dao.MessagesDAO;
import fr.remie.webmail.dao.UsersDAO;
import fr.remie.webmail.model.Message;
import fr.remie.webmail.model.User;
import fr.remie.webmail.service.MessagesService;

@Component("messagesService")
public class MessagesServicesImpl implements MessagesService {
	
	@Autowired
	public MessagesDAO messagesDao;

	@Autowired
	private UsersDAO usersDao;

	public Message getMessage(Integer id) {
		return messagesDao.getById(id);
	}

	public void save(Message message, Integer senderId) {
		User user = usersDao.getById(senderId);
		message.setSender(user);
		messagesDao.save(message);
	}

	public void delete(Message message) {
		messagesDao.delete(message);
	}

	public List<Message> findAll() {
		return messagesDao.findAll();
	}

}
