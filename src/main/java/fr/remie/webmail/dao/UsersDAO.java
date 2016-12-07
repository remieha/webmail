package fr.remie.webmail.dao;

import java.util.List;

import fr.remie.webmail.model.User;

public interface UsersDAO {

	public User getById(Integer id);
	public void save(User user);
	public void delete(User user);
	public List<User> findAll();
	public User getByMail(String mail);
	
}
