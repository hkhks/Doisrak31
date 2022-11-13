package com.dosirak31.loginImpl;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class loginImpl
 *
 */
@WebListener
public class loginImpl implements HttpSessionListener {
	
	String client_id;
	String client_pw;
	
	static int total_user = 0;
	
	public loginImpl() {}

	public loginImpl(String client_id, String client_pw) {
		
		this.client_id = client_id;
		this.client_pw = client_pw;
	}
	

    public void sessionCreated(HttpSessionEvent se)  { 
    	System.out.println("技记 积己");
		++total_user;
    }

    public void sessionDestroyed(HttpSessionEvent se)  { 
    	System.out.println("技记 家戈");
		total_user--;
    }
	
}
