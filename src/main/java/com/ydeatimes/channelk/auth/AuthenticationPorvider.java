package com.ydeatimes.channelk.auth;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.ydeatimes.channelk.web.model.User;
import com.ydeatimes.channelk.web.repository.UserRepository;

public class AuthenticationPorvider implements AuthenticationProvider {
	private static final Logger LOG = LoggerFactory
			.getLogger(AuthenticationPorvider.class);

	@Autowired
	UserRepository userRepo;
	
	@Autowired
	Crc32 crc;
	
	@Autowired
	PhPass PhPass;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String user_id = (String) authentication.getPrincipal();
		String user_pw = (String) authentication.getCredentials();
		
		int crcCode = crc.getCode(user_id);
		User user = userRepo.findByUserLoginId(crcCode, user_id);
		System.out.println(user);
		if (user !=null && PhPass.CheckPassword(user_pw, user.getUser_password())) {
			List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
			if(user.getUser_role() != null){
				for (String role : Arrays.asList(user.getUser_role().split(","))) {
					roles.add(new SimpleGrantedAuthority(role.toUpperCase()));
				}
			}
			UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(user_id, user_pw, roles);
			result.setDetails(new UserDetail(user));
			return result;
		} else {
			LOG.warn("로그인 정보 불일치 id = {}, password = {}", user_id, user_pw);
			throw new BadCredentialsException("Bad credentials");
		}
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
}
