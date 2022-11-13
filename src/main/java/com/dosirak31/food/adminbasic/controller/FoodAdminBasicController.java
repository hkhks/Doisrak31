package com.dosirak31.food.adminbasic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dosirak31.food.basic.service.FoodBasicService;
import com.dosirak31.food.basic.vo.FoodBasicVO;

import lombok.Setter;
@Controller
@RequestMapping("/food/*")
public class FoodAdminBasicController {
	@Setter(onMethod_ = @Autowired)
	private FoodBasicService foodBasicService;
	
	/*식품 관리자 페이지로 이동 */
	@RequestMapping(value="/admin/foodAdminBasicList")
	public String foodBasicList() {
		
		return "food/admin/foodAdminBasicList";//foodList로 조회하면됨
	}
	
	/*번호로 가져올 수정 목록 구현하기*/
	@RequestMapping(value="/foodAdminBasicListNo",method=RequestMethod.GET)
	public String foodBasicListNo(FoodBasicVO fvo,Model model) {
		List<FoodBasicVO> foodBasicList=foodBasicService.foodBasicList(fvo.getFood_no());
		model.addAttribute("foodList",foodBasicList);
		
		return "food/admin/foodAdminBasicList";//foodList로 조회하면됨
		
	}

	
	/*식품입력*/
	@RequestMapping(value="/foodBasicInsert",method=RequestMethod.POST)
	//@PostMapping("/boardInsert")
	
	public String boardInsert(FoodBasicVO fbo, Model model) throws Exception{
		
		String url="/food/admin/foodAdminBasicList";
		
		foodBasicService.foodBasicInsert(fbo);
		
		return "redirect:"+url; //redirect에서 띄어쓰기 하지 않기
		//return "redirect:/board/boardList";로 바로 하면됨, 개발 과정에서만 위에서 확인하고 
	}
	
	/*식품 삭제*/
	@RequestMapping(value="/foodAdminBasicDelete",method=RequestMethod.GET)
	public String foodBasicDelete(FoodBasicVO fbo,Model model)throws Exception {
		foodBasicService.foodBasicDelete(fbo);
		
		return "food/admin/foodAdminBasicList";//foodList로 조회하면됨
	}
	
	/*식품 수정*/
	@RequestMapping(value="/foodAdminBasicUpdate",method=RequestMethod.POST)
	public String foodBasicUpdate(FoodBasicVO fbo,Model model)throws Exception {
		foodBasicService.foodBasicUpdate(fbo);
		
		return "food/admin/foodAdminBasicList";//foodList로 조회하면됨
	}
}
