package com.dosirak31.common.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class CommonExceptionAdvice {
	/* @ExceptionHandler는 해당 메서드가 () 들어가는 예외 타입을 처리 */
	   @ExceptionHandler(Exception.class)
	   public String exceptionMethod(Exception ex, Model model) {
	     
	      model.addAttribute("exception", ex);
	     
	      return "error/error_page";
	   }
	   
	   /* 매핑 정보나 파일을 찾이 못했을 경우에 대한 예외 처리 */
	   @ExceptionHandler(NoHandlerFoundException.class)
	   @ResponseStatus(HttpStatus.NOT_FOUND)
	   public String handle404(NoHandlerFoundException ex) {
	      return "error/custom404";
	   }
}
