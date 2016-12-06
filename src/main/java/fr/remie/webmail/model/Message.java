package fr.remie.webmail.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.codec.binary.Base64;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "messages")
public class Message {
	
	@Id // cad c'est une clé primaire
	@GeneratedValue(strategy = GenerationType.IDENTITY) // serial
	private Integer id;
	@Column(name = "subject")
	private String subject;
	@Column(name = "text")
	private String text;
	@Column(name = "file1")
	private byte[] file1;
	@Column(name = "file2")
	private byte[] file2;

	@ManyToOne
	@JsonBackReference
	private User sender;

//	@ManyToMany
//	@JsonManagedReference
//	private Set<User> users; //receivers

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public byte[] getFile1() {
		return file1;
	}

	public void setFile1(byte[] file1) {
		this.file1 = file1;
	}

	public byte[] getFile2() {
		return file2;
	}

	public void setFile2(byte[] file2) {
		this.file2 = file2;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

//	public Set<User> getUsers() { // Recipients
//		return users;
//	}
//
//	public void setUsers(Set<User> users) {
//		this.users = users;
//	}

	public String getFile1Base64() {
		return Base64.encodeBase64String(file1);
	}
	
	public String getFile2Base64() {
		return Base64.encodeBase64String(file2);
	}

	public static byte[] decodeFile(String file) {
		return Base64.decodeBase64(file);
	}

}
