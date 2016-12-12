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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	public ResponseEntity<List<Message>> listMessages() { // A ecrire partout ou on retourne 
		List<Message> list = messagesService.findAll();
		if(list == null){
			return new ResponseEntity<List<Message>>(HttpStatus.NOT_FOUND);
		} else {
			return new ResponseEntity<List<Message>>(list, HttpStatus.OK);
		}
	}
	
	@RequestMapping(value="/{id}/sent", method = RequestMethod.GET)
	public ResponseEntity<List<Message>> listMessages(@PathVariable Integer id) {
		List<Message> list = messagesService.sentMessages(id);
		if(list == null){
			return new ResponseEntity<List<Message>>(HttpStatus.NOT_FOUND);
		} else {
			return new ResponseEntity<List<Message>>(list, HttpStatus.OK);
		}
	}
	
	@RequestMapping(value="/{id}/inbox", method = RequestMethod.GET)
	public ResponseEntity<List<Message>> listInMessages(@PathVariable Integer id) {
		List<Message> list = messagesService.receivedMessages(id);
		if(list == null){
			return new ResponseEntity<List<Message>>(HttpStatus.NOT_FOUND);
		} else {
			return new ResponseEntity<List<Message>>(list, HttpStatus.OK);
		}		
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<Message> retrieveMessage(@PathVariable Integer id) {
		Message message = messagesService.getMessage(id);
		if(message == null){
			return new ResponseEntity<Message>(HttpStatus.NOT_FOUND);
		} else {
			return new ResponseEntity<Message>(message, HttpStatus.OK);
		}			
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
