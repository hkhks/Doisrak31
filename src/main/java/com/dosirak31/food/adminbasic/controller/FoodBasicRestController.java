package com.dosirak31.food.adminbasic.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dosirak31.food.basic.service.FoodBasicService;
import com.dosirak31.food.basic.vo.FoodBasicVO;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping(value="/food")
@AllArgsConstructor
public class FoodBasicRestController {
	private FoodBasicService foodBasicService;
	//ī�װ����� ������ ������ ��ȸ�ϱ� ���� ������
	@GetMapping(value="/all/{food_category}",produces=MediaType.APPLICATION_JSON_VALUE)
	public List<FoodBasicVO> foodBasicListCategory(@PathVariable("food_category") String food_category){
		List<FoodBasicVO> list=null;
		list=foodBasicService.foodBasicListCategory(food_category);
		return list;
	}
	//��ȣ�� ���� ��ȸ�ϱ� ���� ������
	@GetMapping(value="/all2/{food_no}",produces=MediaType.APPLICATION_JSON_VALUE)
	public List<FoodBasicVO> foodBasicListNo(@PathVariable("food_no") int food_no){
		List<FoodBasicVO> list=null;
		list=foodBasicService.foodBasicListNo(food_no);
		return list;
	}
	
	
	
	
}
