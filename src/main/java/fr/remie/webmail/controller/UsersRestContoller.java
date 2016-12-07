package fr.remie.webmail.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import fr.remie.webmail.model.User;
import fr.remie.webmail.service.UsersService;

@RestController
@RequestMapping("/rest/users")
public class UsersRestContoller {

	@Autowired
	private UsersService usersService;
	
    @PersistenceContext
    private EntityManager em;
    
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
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public User authenticate(@RequestBody User u){
		User user = usersService.login(u.getMail(), u.getPassword());
		return user;
	}
	
//	@RequestMapping(value = "/uploadPhoto", method = RequestMethod.POST)
//	public User uploadPhoto(MultipartFile file){
//		try {
//			byte[] bytes = file.getBytes();
//			User user = new User();
//			user.setPhoto(bytes);
//		    return user;
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		//return "redirect:/app/avenger/";
//		return null;
//	}

}
