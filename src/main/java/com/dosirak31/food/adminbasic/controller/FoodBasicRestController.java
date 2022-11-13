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
	//카테고리별로 음식을 나누어 조회하기 위한 쿼리문
	@GetMapping(value="/all/{food_category}",produces=MediaType.APPLICATION_JSON_VALUE)
	public List<FoodBasicVO> foodBasicListCategory(@PathVariable("food_category") String food_category){
		List<FoodBasicVO> list=null;
		list=foodBasicService.foodBasicListCategory(food_category);
		return list;
	}
	//번호로 음식 조회하기 위한 쿼리문
	@GetMapping(value="/all2/{food_no}",produces=MediaType.APPLICATION_JSON_VALUE)
	public List<FoodBasicVO> foodBasicListNo(@PathVariable("food_no") int food_no){
		List<FoodBasicVO> list=null;
		list=foodBasicService.foodBasicListNo(food_no);
		return list;
	}
	
	
	
	
}
