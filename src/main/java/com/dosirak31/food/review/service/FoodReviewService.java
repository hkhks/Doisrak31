package com.dosirak31.food.review.service;

import java.util.List;

import com.dosirak31.food.review.vo.FoodReviewVO;

public interface FoodReviewService {
	
	public List<FoodReviewVO> foodReviewList(FoodReviewVO rvo); 
	
	public int foodReviewInsert(FoodReviewVO rvo);		
	
	public int foodReviewUpdate(FoodReviewVO rvo);		
	
	public int foodReviewDelete(FoodReviewVO rvo);			
	
	public FoodReviewVO updateForm(FoodReviewVO rvo);	
	
	public FoodReviewVO foodReviewDetail (FoodReviewVO rvo);  
	
	public int foodReviewListCnt(FoodReviewVO rvo);			
}
