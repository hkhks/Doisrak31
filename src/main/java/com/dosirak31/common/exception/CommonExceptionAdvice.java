package com.dosirak31.common.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class CommonExceptionAdvice {
	/* @ExceptionHandler�� �ش� �޼��尡 () ���� ���� Ÿ���� ó�� */
	   @ExceptionHandler(Exception.class)
	   public String exceptionMethod(Exception ex, Model model) {
	     
	      model.addAttribute("exception", ex);
	     
	      return "error/error_page";
	   }
	   
	   /* ���� ������ ������ ã�� ������ ��쿡 ���� ���� ó�� */
	   @ExceptionHandler(NoHandlerFoundException.class)
	   @ResponseStatus(HttpStatus.NOT_FOUND)
	   public String handle404(NoHandlerFoundException ex) {
	      return "error/custom404";
	   }
}
