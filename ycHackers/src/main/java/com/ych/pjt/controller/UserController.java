package com.ych.pjt.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Collection;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ych.pjt.command.IYchCommand;
import com.ych.pjt.command.UserJoinCommand;
import com.ych.pjt.command.UserMainDataCommand;
import com.ych.pjt.dao.UserDao;
import com.ych.pjt.util.Constant;

@Controller
public class UserController {
	private IYchCommand com;
	
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder=passwordEncoder;
		Constant.passwordEncoder=passwordEncoder;
	}
	private UserDao uDao;
	@Autowired
	public void setuDao(UserDao uDao) {
		this.uDao=uDao;
		Constant.uDao=uDao;
	}
	private static String KAKAO_CLIENT__ID = "kakao developer 개인고유번호";
	@RequestMapping("/join")
	@ResponseBody
	public String join (HttpServletRequest req, HttpServletResponse res, Model model) {
		System.out.println("join request");
		com = new UserJoinCommand();
		com.execute(req, model);
		
		String result = (String)req.getAttribute("result");
		if(result.equals("success")) {
			return "join-success";
		}else {
			return "join-failed";
		}
	}
	/*
	@RequestMapping("/jusoPopup")
	public String jusoPopup(HttpServletRequest req, Model model) {
		System.out.println("jusoPopup request");
		return "jusoPopup";
	}*/
	@RequestMapping("/loginView")
	public String loginView(
			HttpServletRequest req, 
			Model model,
			HttpServletResponse res,
			HttpSession session) {
		System.out.println("loginView request at home");
		socialURL(model,session);
		return "loginView";
	}
	@RequestMapping("/main")
	public String main(HttpServletRequest req, Model model, Authentication authentication) {
		System.out.println("main page request:"+authentication);
		getUsername(authentication, req);
		
		//username, auth 확인
		String userName = (String)req.getAttribute("username");
		String auth = (String)req.getAttribute("auth");
		System.out.println("user data: "+userName+"//"+auth);
		//user data load
		com= new UserMainDataCommand();
		com.execute(req, model);
		//board관련 load
		
		return "main";
	}
	private void getUsername(Authentication authentication,HttpServletRequest req) {
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String username = userDetails.getUsername();
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		String auth = authorities.toString();
		req.setAttribute("username", username);
		req.setAttribute("auth", auth);
	}
	@RequestMapping("/processLogin")
	public String processLogin(
			@RequestParam(value="log", required=false) String log,
			@RequestParam(value="logout", required=false) String logout,
			@RequestParam(value="error", required=false) String error,
			HttpSession session, Model model) {
		System.out.println("log process controller(log,logout,error): "+log+"/"+logout+"/"+error);
		if(log!=null&&log!="") model.addAttribute("log", "before login");
		if(logout!=null&&logout!="") model.addAttribute("logout", "You've been logged out successfully");
		if(error!=null&&error!="") model.addAttribute("error", "Invalid username or password");
		return "loginView";
	}
	@RequestMapping("/logoutView")
	public String logoutView(HttpServletRequest req, Model model) {
		System.out.println("log out request");
		return "logoutView";
	}
	private void socialURL(Model model, HttpSession session) {
		String kakao_url = "https://kauth.kakao.com/oauth/authorize"
				+ "?client_id="+KAKAO_CLIENT__ID
				+ "&redirect_uri=https://localhost:8443/pjt/kredirect"
				+ "&response_type=code";
		model.addAttribute("kakao_url",kakao_url);
		
	}
	//kakao login redirect
	@RequestMapping(value="/kredirect", produces="application/json;charset=UTF8")
	public String kredirect(
			@RequestParam String authorize_code,
			HttpServletResponse res,
			Model model) throws Exception {
		System.out.println("#####kakaoCode#####"+authorize_code);
		String access_Token=getKakaoAccessToken(authorize_code,res);
		System.out.println("###kakao access_token###"+access_Token);
		HashMap<String, Object> userInfo = getKakaoUserInfo(access_Token);
		model.addAttribute("kakaoUser", userInfo);
		return "socialLogin";
	}
	public String getKakaoAccessToken (
			String code, 
			HttpServletResponse res) {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		String access_Token="";
		String refresh_Token="";
		String reqURL="https://kauth.kakao.com/oauth/token";
		try {
			URL url= new URL(reqURL);
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("POST");
			connection.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(connection.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id="+KAKAO_CLIENT__ID);
			sb.append("&redirect_uri=https://localhost:8443/pjt/kredirect");
			sb.append("&code="+code);
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = connection.getResponseCode();
			System.out.println("resoponse code: "+responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(),"UTF-8"));
			String line="";
			String result="";
			while((line=br.readLine())!=null) {
				result+=line;
			}
			System.out.println("response body: "+result);
			JSONParser parser = new JSONParser();
			Object object = parser.parse(result);
			JSONObject jsonObj = (JSONObject)object;
			access_Token = (String)jsonObj.get("access_token");
			refresh_Token = (String)jsonObj.get("refresh_Token");
			System.out.println("access_token: "+access_Token+"// refresh_token: "+refresh_Token);
			br.close();
			bw.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	public HashMap<String, Object> getKakaoUserInfo(String access_Token){
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL="https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Authorization", "Bearer "+access_Token);
			int responseCode = connection.getResponseCode();
			System.out.println("response code: "+responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(),"UTF-8"));
			String line="";
			String result="";
			while((line=br.readLine())!=null) result+=line;
			System.out.println("response body: "+result);
			
			JSONParser parser = new JSONParser();
			Object object = parser.parse(result);
			JSONObject jsonObj = (JSONObject)object;
			
			String id = jsonObj.get("id").toString();
			JSONObject properties = (JSONObject)jsonObj.get("properties");
			JSONObject kakao_account = (JSONObject)jsonObj.get("kakao_account");
			String accessToken = (String)properties.get("access_token");
			String email = (String)kakao_account.get("email");
			String gender = (String)kakao_account.get("gender");
			String birthday = (String)kakao_account.get("birthday");
			
			userInfo.put("accessToken", accessToken);
			userInfo.put("email", email);
			userInfo.put("gender", gender);
			userInfo.put("birthday", birthday);
			userInfo.put("id", id);
			System.out.println("accessToken: "+accessToken+" \n id: "+id+"\n email: "+email+"\n gender: "+gender+"\n birthday: "+birthday);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return userInfo;
	}
}