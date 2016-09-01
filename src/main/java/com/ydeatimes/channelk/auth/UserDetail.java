package com.ydeatimes.channelk.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.ydeatimes.channelk.web.model.User;

public class UserDetail implements org.springframework.security.core.userdetails.UserDetails{

	private static final long serialVersionUID = -4450269958885980297L;
	private String userLoginId;
	private String password;
	private String userEmail;
	private int userDBId;
	private String userName;
	private String userPhone;
	private int userPoint;
	private boolean userReadPromotion;
	
	public UserDetail(User user) {
		this.userLoginId = user.getUser_login_id();
		this.password = user.getUser_password();
		this.userEmail = user.getUser_email();
		this.userDBId = user.getUser_id();
		this.userName = user.getUser_name();
		this.userPhone = user.getUser_phone();
		this.userPoint = user.getUser_point();
		//this.userReadPromotion = user.isRead_promotion();
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));

		return authorities;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return userLoginId;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public int getUserDBId() {
		return userDBId;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserLoginId() {
		return userLoginId;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public int getUserPoint() {
		return userPoint;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	public boolean getUserReadPromotion(){
		return this.userReadPromotion;
	}
	
	public void setUserReadPromotion(boolean userReadPromotion) {
		this.userReadPromotion = userReadPromotion;
	}	
	
}
