package com.ydeatimes.channelk.auth;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.ydeatimes.channelk.web.model.User;



public class AuthenticationPorvider implements AuthenticationProvider  {
	 private static final Logger LOG = LoggerFactory.getLogger(AuthenticationPorvider.class);

	    @Override
	    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
	        String user_id 	= (String) authentication.getPrincipal();
	        String user_pw 	= (String) authentication.getCredentials();
	        
	        User adminUser = new User("user", "pass");
	        
	        if(  true		){	//userManager.isMatchPassword(adminUser, user_pw) ) {
	            List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
	            roles.add(new SimpleGrantedAuthority("ROLE_" + adminUser.getUser_role()));
	            UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(user_id, user_pw, roles);
	            result.setDetails(new UserDetail(adminUser));
	            return result;
	        }else {
	            LOG.warn("로그인 정보 불일치 id = {}, password = {}", user_id ,user_pw);
	            throw new BadCredentialsException("Bad credentials");
	        }
	    }

	    @Override
	    public boolean supports(Class<?> authentication) {
	        return authentication.equals(UsernamePasswordAuthenticationToken.class);
	    }
}
