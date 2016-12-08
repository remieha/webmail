package fr.remie.webmail.model;


import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
	@Column(name = "date")
	private Date date;
	@Column(name = "subject")
	private String subject;
	@Column(name = "text")
	private String text;
	@Column(name = "file1")
	private byte[] file1;
	@Column(name = "file2")
	private byte[] file2;

	@ManyToOne
	private User sender;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name="messages_users", joinColumns=@JoinColumn(name="messages_id",referencedColumnName="id"), inverseJoinColumns=@JoinColumn(name="users_id", referencedColumnName="id"))
	private Set<User> recipients; 

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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

	public Set<User> getRecipients() {
		return recipients;
	}

	public void setRecipients(Set<User> recipients) {
		this.recipients = recipients;
	}

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
