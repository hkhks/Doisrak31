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
	 * �����ڰԽ��� left.jsp���� � ��� ���� ������ Ŭ���� � ��� ���� �������� �Ѿ����
	
	@RequestMapping("/hcommentManage")
	public String hcommentManage() {
		
		return  "hcomment/admin/hcommentManage"; 
	}
	
	 ****************************************************************************/
	
	
	
	/****************************************************************************
	 * ������ �ｺ ��� �Խ��� ��ȸ
	 ****************************************************************************/
	 @RequestMapping(value = "/hcommentManage") 
	 public String list(@ModelAttribute HCommentVO hvo, Model model) {
		 
		 //��ü ���ڵ� ��ȸ
	        List<HCommentVO> list = null;
	        list = hcommentService.select(hvo); // ����¡ ó���� ��� ��ü ��������
	        model.addAttribute("list",list);
	        
	        //��ü ���ڵ� �� ����
			int total = hcommentService.hcommentListCnt(hvo); 
		
			//����¡ ó��
			model.addAttribute("pageMaker", new PageDTO(hvo, total));
			
			return "hcomment/admin/hcommentManage";  // 200
	        
	    }
	 

	    /****************************************************************************
		 * ������ �ｺ ��� �Խ��� ������ ����� ����
		****************************************************************************/
	
			@RequestMapping("/remove")  
			public String remove(HCommentVO hvo,Model model) {
				
				int rowCnt = hcommentService.deleteadmin(hvo); // �����ؾ��� ��� ������ȣ�� �Ѱ� ������ ó��
				
				//��ü ���ڵ� ��ȸ
		        List<HCommentVO> list = null;
		        list = hcommentService.select(hvo); // ����¡ ó���� ��� ��ü ��������
		        model.addAttribute("list",list);
		        
		        //��ü ���ڵ� �� ����
				int total = hcommentService.hcommentListCnt(hvo); 
				
				//����¡ ó��
				model.addAttribute("pageMaker", new PageDTO(hvo, total));
				
				return "hcomment/admin/hcommentManage";
			}
			

		    /****************************************************************************
			 * ������ �ｺ ��� ���� �ٿ�ε�
			****************************************************************************/
		
			@RequestMapping(value="/hcommentExcel", method=RequestMethod.GET)
			public ModelAndView hcommentListExcel(@ModelAttribute HCommentVO hvo) {
				
				log.info("Excel ȣ�� ����");
				
				List<HCommentVO> list = null;
		        list = hcommentService.hcommentListExcel(hvo); // �ｺ ��� ����Ʈ ��ȸ
		        
		        ModelAndView mv = new ModelAndView(new ListExcelView());
		        mv.addObject("list",list); // ������ ������
		        mv.addObject("template","hcomment.xlsx"); // ���ø����� ����� ���ϸ�
		        mv.addObject("file_name","hcomment"); // �ٿ�ε�� ����� �������ϸ�
		        
				return mv;
			}

}
