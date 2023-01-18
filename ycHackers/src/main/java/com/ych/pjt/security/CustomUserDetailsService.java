package com.ych.pjt.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.ych.pjt.dao.UserDao;
import com.ych.pjt.dto.UserDataDto;
import com.ych.pjt.util.Constant;

public class CustomUserDetailsService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDao uDao = Constant.uDao;
		UserDataDto dto = uDao.login(username);
		System.out.println("login ID: "+dto.getUserId()+"// user name: "+username);
		if(dto==null) {
			System.out.println("security: DTO is null!!");
			throw new UsernameNotFoundException("No user found with username");
		}

		String pw = dto.getUserPw();
		String auth = dto.getUserAuth();
		
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		roles.add(new SimpleGrantedAuthority(auth));
		UserDetails user = new User(username,pw,roles);
		return user;
	}

}
