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
	
	/*관리자페이지 회원관리로 이동*/
	@RequestMapping(value="/memberList",method=RequestMethod.GET)
	public String memberList(@ModelAttribute OrderDetailVO cvo,Model model) {
		
		List<OrderDetailVO> memberList=adminPageService.memberList(cvo);
		model.addAttribute("memberList",memberList);
		
		//전체 레코드 수 구현
		int total=adminPageService.memberListCnt(cvo);
		
		//페이징 처리
		model.addAttribute("pageMaker",new PageDTO(cvo,total));
		
		return "adminPage/admin/memberManagement";
	}
	
	/*회원목록 엑셀 다운로드*/
	@RequestMapping(value="/memberListExcel",method=RequestMethod.GET)
	public ModelAndView memberListExcel(@ModelAttribute OrderDetailVO cvo) {
		
		List<OrderDetailVO> memberList = null;
		memberList = adminPageService.memberListExcel(cvo); 
        
        ModelAndView mv = new ModelAndView(new ListExcelView());
        mv.addObject("memberList",memberList); // 보여줄 데이터
        mv.addObject("template","member.xlsx"); // 템플릿으로 사용할 파일명
        mv.addObject("file_name","member"); // 다운로드시 사용할 엑셀파일명
        
		return mv;
	}
	
	/*회원 통계로 이동*/
	@RequestMapping(value="/memberGraph",method=RequestMethod.GET)
	public String memberGraph(Model model,String today){
		
		 Date now = new Date();
		 SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 a hh:mm:ss");
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
