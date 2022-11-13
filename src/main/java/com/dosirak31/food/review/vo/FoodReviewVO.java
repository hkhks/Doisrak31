package com.dosirak31.food.review.vo;

import com.dosirak31.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class FoodReviewVO extends CommonVO {
	
	private int review_no				=0;		
	private String review_contents		="";	
	private int review_score			=0;		
	private String review_date			="";	
	private int client_no				=0;		
	private int order_no				=0;		
	private String review_name			="";	
	private String dosirak_name			="";
	private int dosirak_no				=0;
	private String food_img1;
	private String food_img2;
	private String food_img3;
	private String food_img4;
	private String food_img5;
	
	
	
}
