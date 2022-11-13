package com.dosirak31.food.basic.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FoodBasicVO {
	private int food_no; //일련번호
	private String food_category="";//카테고리
	private String food_name="";//음식명
	private String food_img="";//음식이미지
	private MultipartFile food_file;
	private int food_price=0;//가격
	private double food_kcal=0.0;//칼로리
	private int food_volume=0;//용량
	private double food_calb=0.0;//탄수화물
	private double food_protein=0.0;//단백질
	private double food_fat=0.0;//지방
	
}
