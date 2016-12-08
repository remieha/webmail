package fr.remie.webmail.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Set;

import java.util.HashMap;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import fr.remie.webmail.model.Message;
import fr.remie.webmail.model.User;
import fr.remie.webmail.service.MessagesService;
import fr.remie.webmail.service.UsersService;

@RestController
@RequestMapping("/rest/messages")
public class MessagesRestController {

	@Autowired
	private MessagesService messagesService;
	
	@Autowired
	private UsersService usersService;

	@PersistenceContext
	private EntityManager em;

	@RequestMapping(method = RequestMethod.GET)
	public List<Message> listMessages() {
		return messagesService.findAll();
	}
	
	@RequestMapping(value="/{id}/sent", method = RequestMethod.GET)
	public List<Message> listMessages(@PathVariable Integer id) {
		return messagesService.sentMessages(id);
	}
	
	@RequestMapping(value="/{id}/inbox", method = RequestMethod.GET)
	public List<Message> listInMessages(@PathVariable Integer id) {
		return messagesService.receivedMessages(id);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Message retrieveMessage(@PathVariable Integer id) {
		return messagesService.getMessage(id);
	}

	@RequestMapping(value = "/sendMail", method = RequestMethod.POST)
	public void createMessage(@RequestBody Message m) {
		messagesService.save(m);
	}

//	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
//	public void updateAvenger(@RequestBody Avenger a, @PathVariable Integer id) {
//		a.setId(id);
//		avengerService.save(a);
//	}

	@RequestMapping(value = "/uploadFile1", method = RequestMethod.POST)
	public Message uploadFile1(MultipartFile file) {
		try {
			byte[] bytes = file.getBytes();
			Message m = new Message();
			m.setFile1(bytes);
			return m;
		} catch (IOException e) {
			e.printStackTrace();
		}
		// return "redirect:/app/messages/";
		return null;
	}

	@RequestMapping(value = "/uploadFile2", method = RequestMethod.POST)
	public Message uploadFile2(MultipartFile file) {
		try {
			byte[] bytes = file.getBytes();
			Message m = new Message();
			m.setFile2(bytes);
			return m;
		} catch (IOException e) {
			e.printStackTrace();
		}
		// return "redirect:/app/messages/";
		return null;
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public void deleteMessage(@PathVariable Integer id) {
		messagesService.delete(messagesService.getMessage(id));
	}

}
