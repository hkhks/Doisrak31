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
	
	/*��ǰ ������ �������� �̵� */
	@RequestMapping(value="/admin/foodAdminBasicList")
	public String foodBasicList() {
		
		return "food/admin/foodAdminBasicList";//foodList�� ��ȸ�ϸ��
	}
	
	/*��ȣ�� ������ ���� ��� �����ϱ�*/
	@RequestMapping(value="/foodAdminBasicListNo",method=RequestMethod.GET)
	public String foodBasicListNo(FoodBasicVO fvo,Model model) {
		List<FoodBasicVO> foodBasicList=foodBasicService.foodBasicList(fvo.getFood_no());
		model.addAttribute("foodList",foodBasicList);
		
		return "food/admin/foodAdminBasicList";//foodList�� ��ȸ�ϸ��
		
	}

	
	/*��ǰ�Է�*/
	@RequestMapping(value="/foodBasicInsert",method=RequestMethod.POST)
	//@PostMapping("/boardInsert")
	
	public String boardInsert(FoodBasicVO fbo, Model model) throws Exception{
		
		String url="/food/admin/foodAdminBasicList";
		
		foodBasicService.foodBasicInsert(fbo);
		
		return "redirect:"+url; //redirect���� ���� ���� �ʱ�
		//return "redirect:/board/boardList";�� �ٷ� �ϸ��, ���� ���������� ������ Ȯ���ϰ� 
	}
	
	/*��ǰ ����*/
	@RequestMapping(value="/foodAdminBasicDelete",method=RequestMethod.GET)
	public String foodBasicDelete(FoodBasicVO fbo,Model model)throws Exception {
		foodBasicService.foodBasicDelete(fbo);
		
		return "food/admin/foodAdminBasicList";//foodList�� ��ȸ�ϸ��
	}
	
	/*��ǰ ����*/
	@RequestMapping(value="/foodAdminBasicUpdate",method=RequestMethod.POST)
	public String foodBasicUpdate(FoodBasicVO fbo,Model model)throws Exception {
		foodBasicService.foodBasicUpdate(fbo);
		
		return "food/admin/foodAdminBasicList";//foodList�� ��ȸ�ϸ��
	}
}
