package com.ych.pjt.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

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
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.ych.pjt.command.IYchCommand;
import com.ych.pjt.command.ResCommand;
import com.ych.pjt.command.TempUserCommand;
import com.ych.pjt.command.UserJoinCommand;
import com.ych.pjt.command.UserMainDataCommand;
import com.ych.pjt.dao.UserDao;
import com.ych.pjt.dto.TempUserDto;
import com.ych.pjt.dto.UserDataDto;
import com.ych.pjt.naver.NaverLoginBO;
import com.ych.pjt.util.Constant;

@Controller
public class UserController {
	private IYchCommand com;
	private static String KAKAO_CLIENT_ID = "kakao developer 개인고유번호";
	
	//Dependency Injection
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
		//social login(naver, google)
	private NaverLoginBO naverLoginBO;
	@Autowired
	public void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

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
	@RequestMapping("/userInfoView")
	public String userInfoView(HttpServletRequest req, Model model) {
		System.out.println("userInfoView request");
		return "userInfoView";
	}
	
	//social login method
	private void socialURL(Model model, HttpSession session) {
		String kakao_url = "https://kauth.kakao.com/oauth/authorize"
				+ "?client_id="+KAKAO_CLIENT_ID
				+ "&redirect_uri=https://localhost:8443/pjt/kredirect"
				+ "&response_type=code";
		System.out.println("socialURL###kakao: "+kakao_url+"\n");
		model.addAttribute("kakao_url",kakao_url);
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("socialURL###naver: "+naverAuthUrl+"\n");
		model.addAttribute("naver_url", naverAuthUrl);
		
		OAuth2Operations oAuthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oAuthOperations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE,googleOAuth2Parameters);
		System.out.println("google OAuth2.0 url: "+url);
		model.addAttribute("google_url", url);
		
	}
	//Authority when social log in
	private String social_Auth = "ROLE_TEMPUSER";
	//method Saving temporary user data
	private void tempDB(HttpServletRequest req, Model model, TempUserDto dto) {
		com = new TempUserCommand();
		req.setAttribute("dto", dto);
		com.execute(req, model);
	}
	
	//kakao login redirect
	@RequestMapping(value="/kredirect", produces="application/json;charset=UTF8")
	public String kredirect(
			@RequestParam String authorize_code,
			HttpServletRequest req,
			HttpServletResponse res,
			Model model) throws Exception {
		System.out.println("kakao redirect request");
		System.out.println("#####kakaoCode#####"+authorize_code);
		String access_Token=getKakaoAccessToken(authorize_code,res);
		System.out.println("###kakao access_token###"+access_Token);
		HashMap<String, Object> userInfo = getKakaoUserInfo(access_Token);
		
		String email = (String)userInfo.get("email");
		String authUserName="kakao_"+email;
		String authPw = (String)userInfo.get("name");
		String cryptPw = passwordEncoder.encode(authPw);
		
		TempUserDto dto = new TempUserDto(authUserName, cryptPw, social_Auth);
		tempDB(req,model,dto);
		
		model.addAttribute("tempUserInfo", userInfo);
		model.addAttribute("tempUser", authUserName);
		model.addAttribute("tempPw", authPw);
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
			sb.append("&client_id="+KAKAO_CLIENT_ID);
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
	
	//naver login redirect
	@RequestMapping(value="/nredirect", produces="application/json;charset=UTF8")
	public String nredirect(
			@RequestParam String code,
			@RequestParam String state,
			HttpServletRequest req,
			HttpSession session, Model model) throws Exception {
		System.out.println("naver redirect request");
		OAuth2AccessToken oAuthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oAuthToken);
		System.out.println("###naver code###: "+code);
		System.out.println("state: "+state);
		System.out.println("apiResult: "+apiResult);
		
		JSONParser parser = new JSONParser();
		Object object = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject)object;
		JSONObject responseObj = (JSONObject)jsonObj.get("response");
		System.out.println("user data: "+responseObj);
	
		@SuppressWarnings("unchecked")
		HashMap<String, Object> userInfo = new ObjectMapper().readValue(responseObj.toString(), HashMap.class);
		
		String id =(String)responseObj.get("id");
		String email = (String)responseObj.get("email");
		String authUserName="naver_"+email;
		String genderSt = (String)responseObj.get("gender");
		int gender = 0;
		if(genderSt.equals("M")) gender=1;
		if(genderSt.equals("W")) gender=2;
		String birthDay =(String)responseObj.get("birthday");
		String birthyear = (String)responseObj.get("birthyear");
		String birthday = birthyear+"-"+birthDay;
		String name=(String)responseObj.get("name");
		String cryptPw = passwordEncoder.encode(name);
		String phone=(String)responseObj.get("mobile");
		System.out.println("email: "+email+"/id: "+id+"/gender(M1/W2): "+gender
				+"/birthday: "+birthday+"/name: "+name+"/phone: "+phone);
		
		TempUserDto dto = new TempUserDto(authUserName,cryptPw,social_Auth);
		tempDB(req,model,dto);
		
		model.addAttribute("tempUserInfo", userInfo);
		model.addAttribute("tempUser", authUserName);
		model.addAttribute("tempPw", name);
		return "socialLogin";
	}
	//google login redirect
	@RequestMapping(value="/gredirect",produces="application/text;charset=UTF8")
	public String googleCallback(
			@RequestParam String code,
			HttpServletRequest req,
			HttpServletResponse res,
			Model model) throws IOException {
		System.out.println("google redirect request");
		OAuth2Operations oAuthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oAuthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(), null);
		String accessToken = accessGrant.getAccessToken();
		System.out.println("###google_access_token###: "+accessToken);
		
		HashMap<String, Object> map = getGoogleUserInfo(accessToken, res);
		String email = (String)map.get("email");
		String authUserName = "google_"+email;
		String name = (String)map.get("name");
		String cryptPw = passwordEncoder.encode(name);
		String id = (String)map.get("id");
		System.out.println("user data(email: "+email+"/id: "+id+"/name: "+name+")");
		
		TempUserDto dto = new TempUserDto(authUserName,cryptPw,social_Auth);
		tempDB(req,model,dto);
		
		model.addAttribute("tempUser", authUserName);
		model.addAttribute("tempPw", name);
		model.addAttribute("tempUserInfo", map);
		
		return "socialLogin";
	}
	private HashMap<String, Object> getGoogleUserInfo(String accessToken,HttpServletResponse res){
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		HashMap<String, Object> googleUserInfo = new HashMap<String, Object>();
		
		String reqURL="https://www.googleapis.com/userinfo/v2/me?access_token="+accessToken;
		try {
			URL url = new URL(reqURL);
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestProperty("Authorization", "Bearer"+accessToken);
			int responseCode = connection.getResponseCode();
			if(responseCode==200) {//connect success code: 200
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(),"UTF-8"));
				String line="";
				String result="";
				while((line=br.readLine())!=null)result+=line;
				JSONParser parser = new JSONParser();
				Object object = parser.parse(result);
				JSONObject jsonObj = (JSONObject)object;
				String name_obj=(String)jsonObj.get("name");
				String email_obj=(String)jsonObj.get("email");
				String id_obj="GOOGLE_"+(String)jsonObj.get("id");
				
				googleUserInfo.put("name", name_obj);
				googleUserInfo.put("email", email_obj);
				googleUserInfo.put("id", id_obj);
				System.out.println("googleUserInfo: "+googleUserInfo);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return googleUserInfo;
	}
	
	//facebook redirect
	@RequestMapping(value="/fredirect",produces="application/text;charset=UTF8")
	public String facebookRedirect(HttpServletRequest req, Model model) {
		/*javascript의 data를 가져와야함. 
		HashMap<String, Object> userInfo = 
		String email = 
		String authUserName="facebook_"+email;
		String name = 
		String cryptPw = passwordEncoder.encode(name);
		
		TempUserDto dto = new TempUserDto(authUserName,cryptPw,social_Auth);
		tempDB(req,model,dto);
		
		model.addAttribute("tempUserInfo", userInfo);
		model.addAttribute("tempUser", authUserName);
		model.addAttribute("tempPw", name);
		*/
		return "socialLogin";
	}

}