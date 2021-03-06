package com.ydeatimes.channelk.web.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.ydeatimes.channelk.auth.Crc32;
import com.ydeatimes.channelk.auth.PhPass;
import com.ydeatimes.channelk.web.model.User;
import com.ydeatimes.channelk.web.repository.UserRepository;
import com.ydeatimes.channelk.web.status.UserStatus;

@Service
public class UserDBManager {

	@Autowired
	UserRepository userRepo;
	
	@Autowired
	Crc32 crc;
	
	@Autowired
	PhPass phPass;
	
	public boolean isExistentUser(User user) {
		String loginId = user.getUser_login_id();
		int crcCode = crc.getCode(loginId);
		User hasUser = userRepo.findByUserLoginId(crcCode, loginId);
		if(hasUser == null){
			return false;
		}
		return true;
	}

	public void createUserInAdminPage(User user) {
		String loginId = user.getUser_login_id();
		user.setUser_crc_id(crc.getCode(loginId));
		user.setUser_password(phPass.HashPassword(user.getUser_password()));
		user.setUser_join_date(new Date());
		user.setUser_status(UserStatus.OPEN);
		user.setUser_point(0);
		userRepo.saveAndFlush(user);
	}

	public Page<User> findAllUser(Pageable pageable) {
		return userRepo.findAll(pageable);
	}

	public User getUser(int userId) {
		return userRepo.findById(userId);
	}

	public User updateUserInAdminPage(User editUser) {
		User user = getUser(editUser.getId());
		if(user == null){
			return null;
		}else{
			user.setUser_name(editUser.getUser_name());
			user.setUser_email(editUser.getUser_email());
			user.setUser_role(editUser.getUser_role());
			user.setUser_status(editUser.getUser_status());
			
			return userRepo.saveAndFlush(user);
		}
	}
	
	public User updateUserPasswordInAdminPage(User editUser) {
		User user = getUser(editUser.getId());
		if(user == null){
			return null;
		}else{
			if(!user.getUser_password().equals(editUser.getUser_password())){
				user.setUser_password(phPass.HashPassword(editUser.getUser_password()));
			}
			return userRepo.saveAndFlush(user);
		}
	}
	
}
