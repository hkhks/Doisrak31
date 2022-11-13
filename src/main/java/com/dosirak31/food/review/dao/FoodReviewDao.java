package com.dosirak31.food.review.dao;

import java.util.List;

import com.dosirak31.food.review.vo.FoodReviewVO;

public interface FoodReviewDao {
	public List<FoodReviewVO> foodReviewList(FoodReviewVO rvo); 
		
	public int foodReviewInsert(FoodReviewVO rvo);		
	
	public FoodReviewVO foodReviewDetail(FoodReviewVO rvo);	
	
	public int foodReviewUpdate(FoodReviewVO rvo);		
	
	public int foodReviewDelete(int review_no);			
	
	public int foodReviewListCnt(FoodReviewVO rvo);		
	
}
