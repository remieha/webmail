package fr.remie.webmail.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import fr.remie.webmail.dao.MessagesDAO;
import fr.remie.webmail.model.Message;

@Component("messagesDao")
@Transactional
public class MessagesDAOImpl implements MessagesDAO {

	@PersistenceContext
	private EntityManager entityManager;
	
	public Message getById(Integer id) {
		Message message = entityManager.find(Message.class, id);
		return message;
	}

	public void save(Message message) {
		entityManager.merge(message);
	}

	public void delete(Message message) {
		Message attached = entityManager.find(Message.class, message.getId());
		entityManager.remove(attached);
	}

	public List<Message> findAll() {
		String query = "select m from Message m";
		List<Message> list = (List<Message>) entityManager.createQuery(query, Message.class).getResultList();
		return list;
	}

	public List<Message> sentMessages(Integer id) {
		String query = "select m from Message m where sender_id="+id;
		List<Message> list = entityManager.createQuery(query, Message.class).getResultList();
		return list;
	}

	public List<Message> receivedMessages(Integer id) {
		String query = "select m from Message m join m.recipients r where r.id=:id";
		List<Message> list = entityManager.createQuery(query, Message.class).setParameter("id", id).getResultList();
		return list;
	}

}
