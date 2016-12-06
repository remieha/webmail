package fr.remie.webmail.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import fr.remie.webmail.model.User;
import fr.remie.webmail.service.UsersService;

@RestController
@RequestMapping("/rest/users")
public class UsersRestContoller {

	@Autowired
	private UsersService usersService;
	
	@RequestMapping(method = RequestMethod.GET)
	public List<User> listUsers() {
		return usersService.findAll();
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public User retrieveUser(@PathVariable Integer id) {
		return usersService.getUser(id);
	}

	@RequestMapping(method = RequestMethod.POST)
	public void createUser(@RequestBody User u) {
		usersService.save(u);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public void updateUser(@RequestBody User u, @PathVariable Integer id) {
		u.setId(id);
		usersService.save(u);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public void deleteUser(@PathVariable Integer id) {
		usersService.delete(usersService.getUser(id));
	}

}
