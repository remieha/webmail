package fr.remie.webmail.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import fr.remie.webmail.dao.UsersDAO;
import fr.remie.webmail.model.User;

@Component("usersDao")
@Transactional
public class UsersDAOImpl implements UsersDAO {
	
	@PersistenceContext
	private EntityManager entityManager;

	public User getById(Integer id) {
		User user = entityManager.find(User.class, id);
		return user;
	}

	public void save(User user) {
		entityManager.merge(user);		
	}

	public void delete(User user) {
		User attached = entityManager.find(User.class, user.getId());
		entityManager.remove(attached);
	}

	public List<User> findAll() {
		String query = "select u from User u";
		List<User> list = (List<User>) entityManager.createQuery(query).getResultList();
		return list;
	}

	public User getByMail(String mail) {
		Integer id = (Integer) entityManager.createNativeQuery("select id from users where mail='"+mail+"'").getSingleResult();// find(User.class, mail);
		User user = this.getById(id);
		return user;
	}

}
