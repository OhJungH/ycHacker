package com.ych.pjt.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.ych.pjt.dao.UserDao;
import com.ych.pjt.dto.TempUserDto;
import com.ych.pjt.dto.UserDataDto;
import com.ych.pjt.util.Constant;

public class CustomUserDetailsService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDao uDao = Constant.uDao;
		UserDataDto udto = null;//database ROLE_USER
		TempUserDto tdto = null;//SNS user ROLE_TEMPUSER
		Boolean flag = false;
		if(username.startsWith("kakao_")||username.startsWith("naver_")||username.startsWith("google_")||username.startsWith("facebook_")) {
			tdto = uDao.tempUserLogin(username);
		}
		else {
			udto = uDao.login(username);
			flag=true;
			if(udto==null) {
				System.out.println("SPRING Security: DTO is null!!");
				throw new UsernameNotFoundException("No user found with username");
			}
		}
		System.out.println("User Data: "+udto);
		System.out.println("=========================================");
		System.out.println("TempUser Data: "+tdto);

		if(flag) { //flag == true >> user data 
			String pw = udto.getUserPw();//EzenJoinDto
			String auth = udto.getUserAuth();
			System.out.println("user pw: " + pw + "// auth: " + auth);
			Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
			roles.add(new SimpleGrantedAuthority(auth));
			UserDetails user = new User(username,pw,roles);
			return user;
		}
		else {//flag==false >> temp user data
			String pw = tdto.getUserPw();
			String auth = tdto.getUserAuth();
			//이후 과정은 같음
			System.out.println("SNS user pw: " + pw + "// auth: " + auth);
			Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
			roles.add(new SimpleGrantedAuthority(auth));
			UserDetails user = new User(username,pw,roles);
			return user;
		}
	}
}
