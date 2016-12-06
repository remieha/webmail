package fr.remie.webmail.service;

import java.util.List;

import fr.remie.webmail.model.User;

public interface UsersService {

	public User getUser(Integer id);
	public void save(User user);
	public void delete(User user);
	public List<User> findAll();
	
}
