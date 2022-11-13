package com.dosirak31.hcommentreport.admin.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dosirak31.common.vo.PageDTO;
import com.dosirak31.hcomment.client.service.HCommentService;
import com.dosirak31.hcomment.client.vo.HCommentVO;
import com.dosirak31.hcommentreport.client.service.HcommentReportService;
import com.dosirak31.hcommentreport.client.vo.HcommentReportVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/adminreporthreplies/*")
@AllArgsConstructor
@Log4j
public class HcommentReportAdminController {
	
	private HcommentReportService reportService;
	
	/****************************************************************************
	 * ������ �ｺ ��� �Ű� �Խ��� ��ȸ
	 ****************************************************************************/
	 @RequestMapping(value = "/hcommentReportManage") 
	 public String list(@ModelAttribute HcommentReportVO reportvo, Model model) {
		 
		 	List<HcommentReportVO> list = null;
	        list = reportService.select(reportvo); // ����¡ ó���� ��� ��ü ��������
	        
	        model.addAttribute("list",list);
	        
	        //��ü ���ڵ� �� ����
			int total = reportService.hcommentReportListCnt(reportvo); 
		
			//����¡ ó��
			model.addAttribute("pageMaker", new PageDTO(reportvo, total));
			
			
			return "hcomment/admin/hcommentReportManage";  // 200
	        
	    }
	 	

	    /****************************************************************************
		 * ������ �ｺ ��� �Ű� �Խ��� - ������ ����� ����
		****************************************************************************/
	
			@RequestMapping("/remove")  
			public String remove(@ModelAttribute HcommentReportVO reportvo,Model model) {
				
				int result1 = reportService.deleteReportAdmin1(reportvo); // �����ؾ��� ��� ������ȣ�� �Ѱ� ������ ó�� - �ｺ �Ű� ��� ���̺�
				int result2 = reportService.deleteReportAdmin2(reportvo);
				
				//��ü ���ڵ� ��ȸ
		        List<HcommentReportVO> list = null;
		        list = reportService.select(reportvo); // ����¡ ó���� ����� �ٽ� ��������
		        model.addAttribute("list",list);
		        
		        //��ü ���ڵ� �� ����
				int total = reportService.hcommentReportListCnt(reportvo); 
				
				//����¡ ó��
				model.addAttribute("pageMaker", new PageDTO(reportvo, total));
		        
				return "hcomment/admin/hcommentReportManage";
			}

}
