package com.dosirak31.admin.adminPage.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dosirak31.admin.adminPage.service.AdminPageService;
import com.dosirak31.admin.adminPage.vo.MemberGraphDTO;
import com.dosirak31.common.excel.ListExcelView;
import com.dosirak31.common.vo.PageDTO;
import com.dosirak31.food.order.vo.OrderDetailVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/adminPage/*")
@AllArgsConstructor
public class AdminPageController {
	
	private AdminPageService adminPageService;
	
	/*������������ ȸ�������� �̵�*/
	@RequestMapping(value="/memberList",method=RequestMethod.GET)
	public String memberList(@ModelAttribute OrderDetailVO cvo,Model model) {
		
		List<OrderDetailVO> memberList=adminPageService.memberList(cvo);
		model.addAttribute("memberList",memberList);
		
		//��ü ���ڵ� �� ����
		int total=adminPageService.memberListCnt(cvo);
		
		//����¡ ó��
		model.addAttribute("pageMaker",new PageDTO(cvo,total));
		
		return "adminPage/admin/memberManagement";
	}
	
	/*ȸ����� ���� �ٿ�ε�*/
	@RequestMapping(value="/memberListExcel",method=RequestMethod.GET)
	public ModelAndView memberListExcel(@ModelAttribute OrderDetailVO cvo) {
		
		List<OrderDetailVO> memberList = null;
		memberList = adminPageService.memberListExcel(cvo); 
        
        ModelAndView mv = new ModelAndView(new ListExcelView());
        mv.addObject("memberList",memberList); // ������ ������
        mv.addObject("template","member.xlsx"); // ���ø����� ����� ���ϸ�
        mv.addObject("file_name","member"); // �ٿ�ε�� ����� �������ϸ�
        
		return mv;
	}
	
	/*ȸ�� ���� �̵�*/
	@RequestMapping(value="/memberGraph",method=RequestMethod.GET)
	public String memberGraph(Model model,String today){
		
		 Date now = new Date();
		 SimpleDateFormat sf = new SimpleDateFormat("yyyy�� MM�� dd�� E���� a hh:mm:ss");
		 today = sf.format(now);
		
		  MemberGraphDTO ageGraph= adminPageService.ageGraph();
		  model.addAttribute("ageGraph",ageGraph); 
		  MemberGraphDTO genderGraph=adminPageService.genderGraph();
		  model.addAttribute("genderGraph",genderGraph); 
		  MemberGraphDTO countMember=adminPageService.countMember();
		  model.addAttribute("countMember",countMember);
		  
		  model.addAttribute("today",today);
		 
		return "adminPage/admin/memberGraph";  
	}
	
	
	
	
}
