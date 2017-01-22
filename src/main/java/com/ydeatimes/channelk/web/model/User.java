package com.ydeatimes.channelk.web.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.NoArgsConstructor;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Data
@NoArgsConstructor
@Entity(name="users")
public class User implements Serializable {
	private static final long serialVersionUID = -8457124667660723632L;
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@NotEmpty
	@Size(min = 4, max = 20)
	@Pattern(regexp = "^[A-Za-z]{1}[A-Za-z0_-]{3,20}$")
	@Column(unique=true)
	private String user_login_id;
	
	@Column(nullable=false)
	private int user_crc_id;

	@NotEmpty
	@Size(min = 6, max = 40)
	@Pattern(regexp = "^[A-Za-z0-9!@#$%^&+=*(),.//;]{6,40}$")
	@Column(length = 40)
	private String user_password;

	@NotEmpty
	private String user_name;

	@Email
	private String user_email;

	private Date user_join_date;
	
	@Column(nullable=true)
	private Date user_exit_date;
	private int user_status;
	private int user_point;

	@NotNull
	@NotEmpty
	private String user_role;

	public User(String user_login_id, int crc) {
		this.user_login_id = user_login_id;
		this.user_crc_id = crc;
	}

	public User(String user_login_id, String user_password, String user_name,
			String user_email) {
		this.user_login_id = user_login_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_email = user_email;
	}

	public User(String user_login_id, String user_password) {
		super();
		this.user_login_id = user_login_id;
		this.user_password = user_password;
	}

	public String getUser_login_id() {
		if (this.user_login_id == null) {
			return this.user_login_id;
		} else {
			return this.user_login_id.toLowerCase();
		}
	}
}
