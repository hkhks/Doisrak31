package com.dosirak31.hcomment.admin.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dosirak31.common.excel.ListExcelView;
import com.dosirak31.common.vo.PageDTO;
import com.dosirak31.hcomment.client.service.HCommentService;
import com.dosirak31.hcomment.client.vo.HCommentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/adminhreplies/*")
@Log4j
@AllArgsConstructor
public class HCommentAdminController {
	
	private HCommentService hcommentService; 
	
	/****************************************************************************
	 * 관리자게시판 left.jsp에서 운동 댓글 관리 페이지 클릭시 운동 댓글 관리 페이지로 넘어가게함
	
	@RequestMapping("/hcommentManage")
	public String hcommentManage() {
		
		return  "hcomment/admin/hcommentManage"; 
	}
	
	 ****************************************************************************/
	
	
	
	/****************************************************************************
	 * 관리자 헬스 댓글 게시판 조회
	 ****************************************************************************/
	 @RequestMapping(value = "/hcommentManage") 
	 public String list(@ModelAttribute HCommentVO hvo, Model model) {
		 
		 //전체 레코드 조회
	        List<HCommentVO> list = null;
	        list = hcommentService.select(hvo); // 페이징 처리된 댓글 전체 가져오기
	        model.addAttribute("list",list);
	        
	        //전체 레코드 수 구현
			int total = hcommentService.hcommentListCnt(hvo); 
		
			//페이징 처리
			model.addAttribute("pageMaker", new PageDTO(hvo, total));
			
			return "hcomment/admin/hcommentManage";  // 200
	        
	    }
	 

	    /****************************************************************************
		 * 관리자 헬스 댓글 게시판 지정된 댓글을 삭제
		****************************************************************************/
	
			@RequestMapping("/remove")  
			public String remove(HCommentVO hvo,Model model) {
				
				int rowCnt = hcommentService.deleteadmin(hvo); // 삭제해야할 댓글 고유번호를 넘겨 로직을 처리
				
				//전체 레코드 조회
		        List<HCommentVO> list = null;
		        list = hcommentService.select(hvo); // 페이징 처리된 댓글 전체 가져오기
		        model.addAttribute("list",list);
		        
		        //전체 레코드 수 구현
				int total = hcommentService.hcommentListCnt(hvo); 
				
				//페이징 처리
				model.addAttribute("pageMaker", new PageDTO(hvo, total));
				
				return "hcomment/admin/hcommentManage";
			}
			

		    /****************************************************************************
			 * 관리자 헬스 댓글 엑셀 다운로드
			****************************************************************************/
		
			@RequestMapping(value="/hcommentExcel", method=RequestMethod.GET)
			public ModelAndView hcommentListExcel(@ModelAttribute HCommentVO hvo) {
				
				log.info("Excel 호출 성공");
				
				List<HCommentVO> list = null;
		        list = hcommentService.hcommentListExcel(hvo); // 헬스 댓글 리스트 조회
		        
		        ModelAndView mv = new ModelAndView(new ListExcelView());
		        mv.addObject("list",list); // 보여줄 데이터
		        mv.addObject("template","hcomment.xlsx"); // 템플릿으로 사용할 파일명
		        mv.addObject("file_name","hcomment"); // 다운로드시 사용할 엑셀파일명
		        
				return mv;
			}

}
