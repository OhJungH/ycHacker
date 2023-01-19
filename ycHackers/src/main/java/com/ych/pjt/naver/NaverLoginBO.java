package com.ych.pjt.naver;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginBO {
	private final static String CLIENT_ID="naver developer 개인고유번호";
	private final static String CLIENT_SECRET="naver developer 비밀번호";
	private final static String REDIRECT_URI="https://localhost:8443/pjt/nredirect";
	private final static String SESSION_STATE="oauth_state";
	private final static String PROFILE_API_URL="https://openapi.naver.com/v1/nid/me";
	
	//random string
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	//save session state
	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}
	
	public String getAuthorizationUrl(HttpSession session) {
		String state=generateRandomString();
		setSession(session,state);
		OAuth20Service oAuthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.state(state)
				.build(NaverLoginApi.instance());
		return oAuthService.getAuthorizationUrl();
	}
	
	private String getSession(HttpSession session) {
		return (String)session.getAttribute(SESSION_STATE);
	}
	public OAuth2AccessToken getAccessToken(HttpSession session,String code,String state) throws IOException{
		String sessionState=getSession(session);
		if(StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oAuthService= new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI)
					.state(state)
					.build(NaverLoginApi.instance());
			OAuth2AccessToken accessToken = oAuthService.getAccessToken(code);
			System.out.println("###naver_access_token###: "+accessToken);
			return accessToken; 
		}
		else {
			return null;
		}
	}
	public String getUserProfile(OAuth2AccessToken oAuthToken) throws IOException{
		OAuth20Service oAuthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.build(NaverLoginApi.instance());
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oAuthService);
		oAuthService.signRequest(oAuthToken, request);
		Response response = request.send();
		return response.getBody();
	}
}
