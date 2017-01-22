package com.ydeatimes.channelk.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ydeatimes.channelk.web.model.User;

@Repository
public interface UserRepository extends JpaRepository<User,  Integer>{

	@Query("select u from users as u where u.user_crc_id = :crc and u.user_login_id = :login_id")
	User findByUserLoginId(@Param("crc") int crcCode, @Param("login_id")String login_id);

	User findById(int userDbId);
	
}
