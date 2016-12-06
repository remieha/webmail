package fr.remie.webmail.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.commons.codec.binary.Base64;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "users")
public class User {

	@Id // cad c'est une clé primaire
	@GeneratedValue(strategy = GenerationType.IDENTITY) // serial
	private Integer id;
	@Column(name = "last_name")
	private String lastName;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "photo")
	private byte[] photo;
	@Column(name = "mail")
	private String mail;
	@Column(name = "password")
	private String password;

//	@OneToMany(mappedBy = "sender", fetch = FetchType.EAGER)
//	@JsonManagedReference
//	private Set<Message> message;
	
	//@ManyToMany(mappedBy = "users", fetch = FetchType.EAGER) // receivers
	//@JsonManagedReference
	//private Set<Message> messages; // received messages
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

//	public Set<Message> getSentMessage() {
//		return message;
//	}
//
//	public void setSentMessage(Set<Message> message) {
//		this.message = message;
//	}
//
//@JsonIgnore
//	public Set<Message> getReceivedMessages() {
//		return messages;
//	}
//@JsonIgnore
//	public void setReceivedMessages(Set<Message> messages) {
//		this.messages = messages;
//	}
//@JsonIgnore
//	public String getPhotoBase64() {
//		return Base64.encodeBase64String(photo);
//	}
//@JsonIgnore
//	public static byte[] decodePhoto(String photo) {
//		return Base64.decodeBase64(photo);
//	}
	
}
