package com.dosirak31.common.exception;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExceptionController {

	@GetMapping("/error")
	public String error() {
		return "error/error_page";
	}
	
	@GetMapping("/error404")
	public String error2() {
		return "error/custom404";
	}
	
}
