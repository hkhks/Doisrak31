package com.dosirak31.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.dosirak31.login.admin.vo.AdminLoginVO;
import com.dosirak31.login.client.vo.ClientLoginVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SessionCheckInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request,HttpServletResponse 
			response,Object handler)throws Exception{
	
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session =request.getSession();
		ClientLoginVO client_info=(ClientLoginVO) session.getAttribute("client_info");
		AdminLoginVO admin_info=(AdminLoginVO) session.getAttribute("admin_info");
		if(client_info==null && admin_info==null) {
			PrintWriter out = response.getWriter(); 
	        out.println("<script>alert('로그인해주세요'); location.href='/client/loginmain';</script>"); 
			out.flush();
			// out.close();
			
			return false;
		}
		return true;
	}
	
	
}
