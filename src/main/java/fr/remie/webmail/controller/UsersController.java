package fr.remie.webmail.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import fr.remie.webmail.model.User;
import fr.remie.webmail.service.UsersService;

@Controller
@RequestMapping("/users")
public class UsersController {
	
	@Autowired
	private UsersService usersService;

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView("index");
		// Recuperer la liste des avengers de la base de donnees
		List<User> list = usersService.findAll();
		int size = list.size();
		mv.addObject("myListSize", size);
		mv.addObject("myList", list);
		return mv;
	}	

}
