package com.dosirak31.food.clientbasic.controller;

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
public class FoodClientBasicController {
	@Setter(onMethod_ = @Autowired)
	private FoodBasicService foodBasicService;
	
	/*��ü��ǰ ��� �����ϱ�*/
	@RequestMapping(value="/foodClientBasicList",method=RequestMethod.GET)
	public String foodBasicList() {
		
		return "food/client/foodClientBasicList";//foodList�� ��ȸ�ϸ��
	}
	
	/*�α��� ��*/
	/*��ü��ǰ ��� �����ϱ�*/
	@RequestMapping(value="/foodNoClientBasicList",method=RequestMethod.GET)
	public String foodBasicList2() {
		
		return "food/noclient/foodNoClientBasicList";//foodList�� ��ȸ�ϸ��
	}
}
