package fr.remie.webmail.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import fr.remie.webmail.dao.UsersDAO;
import fr.remie.webmail.model.User;
import fr.remie.webmail.service.UsersService;

@Component("usersService")
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersDAO usersDao;
	
	public User getUser(Integer id) {
		return usersDao.getById(id);
	}

	public void save(User user) {
		usersDao.save(user);
	}

	public void delete(User user) {
		usersDao.delete(user);
	}

	public List<User> findAll() {
		return usersDao.findAll();
	}

}
