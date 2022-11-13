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
	 * 관리자 헬스 댓글 신고 게시판 조회
	 ****************************************************************************/
	 @RequestMapping(value = "/hcommentReportManage") 
	 public String list(@ModelAttribute HcommentReportVO reportvo, Model model) {
		 
		 	List<HcommentReportVO> list = null;
	        list = reportService.select(reportvo); // 페이징 처리된 댓글 전체 가져오기
	        
	        model.addAttribute("list",list);
	        
	        //전체 레코드 수 구현
			int total = reportService.hcommentReportListCnt(reportvo); 
		
			//페이징 처리
			model.addAttribute("pageMaker", new PageDTO(reportvo, total));
			
			
			return "hcomment/admin/hcommentReportManage";  // 200
	        
	    }
	 	

	    /****************************************************************************
		 * 관리자 헬스 댓글 신고 게시판 - 지정된 댓글을 삭제
		****************************************************************************/
	
			@RequestMapping("/remove")  
			public String remove(@ModelAttribute HcommentReportVO reportvo,Model model) {
				
				int result1 = reportService.deleteReportAdmin1(reportvo); // 삭제해야할 댓글 고유번호를 넘겨 로직을 처리 - 헬스 신고 댓글 테이블
				int result2 = reportService.deleteReportAdmin2(reportvo);
				
				//전체 레코드 조회
		        List<HcommentReportVO> list = null;
		        list = reportService.select(reportvo); // 페이징 처리된 댓글을 다시 가져오기
		        model.addAttribute("list",list);
		        
		        //전체 레코드 수 구현
				int total = reportService.hcommentReportListCnt(reportvo); 
				
				//페이징 처리
				model.addAttribute("pageMaker", new PageDTO(reportvo, total));
		        
				return "hcomment/admin/hcommentReportManage";
			}

}
