package com.dosirak31.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/common/*")
@AllArgsConstructor
@Log4j
public class CommonController {
	
	@RequestMapping("/popUp")
	public void popUp() {
		
		log.info("popUpGET...........");
		
		
	}
	
	
	

}
