package com.dosirak31.hcommentreport.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.dosirak31.hcommentreport.client.service.HcommentReportService;
import com.dosirak31.hcommentreport.client.vo.HcommentReportVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/report/")
@Log4j
@AllArgsConstructor
public class HcommentReportController {
	
	private HcommentReportService reportService;
	
	@ResponseBody
	@RequestMapping(value="/reportIn")
	public String reportIn(@ModelAttribute HcommentReportVO reportvo,String report_client_id,int report_health_hcomment_no,int current_health_no) {
		
		reportvo.setClient_id(report_client_id);
		reportvo.setHealth_comment_no(report_health_hcomment_no);
		
		log.info(reportvo);
		
		int result = 0;
		
		result = reportService.reportIn(reportvo);
		
		log.info(result);
		
		return (result == 1) ? "SUCCESS": "FAILURE";
		
	}
	
	

}
