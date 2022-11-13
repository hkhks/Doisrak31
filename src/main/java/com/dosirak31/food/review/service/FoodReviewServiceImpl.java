package com.dosirak31.food.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.food.review.dao.FoodReviewDao;
import com.dosirak31.food.review.vo.FoodReviewVO;

import lombok.Setter;

@Service
public class FoodReviewServiceImpl implements FoodReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private FoodReviewDao foodReviewDao;

	
	@Override
	public List<FoodReviewVO> foodReviewList(FoodReviewVO rvo) {
		List<FoodReviewVO> list= null;
		list = foodReviewDao.foodReviewList(rvo);
		
		return list;
	}
	
	
	@Override
	public int foodReviewListCnt(FoodReviewVO rvo) {
		return foodReviewDao.foodReviewListCnt(rvo);
	}
	
	
	
	@Override 
	public int foodReviewInsert (FoodReviewVO rvo) {
		int result = 0;
		result = foodReviewDao.foodReviewInsert(rvo);
		return result;
	}
	
	@Override
	public int foodReviewUpdate(FoodReviewVO rvo) {
		int result = 0;
		result = foodReviewDao.foodReviewUpdate(rvo);
		return result;
	}
	
	
	@Override
	public int foodReviewDelete(FoodReviewVO rvo) {
		int result = 0;
		result = foodReviewDao.foodReviewDelete(rvo.getReview_no());
		return result;
	}

	
	@Override
	public FoodReviewVO updateForm(FoodReviewVO rvo) {
		FoodReviewVO detail = null;
		detail = foodReviewDao.foodReviewDetail(rvo);
		return detail;
	}

	
	@Override
	public FoodReviewVO foodReviewDetail(FoodReviewVO rvo) {
		FoodReviewVO detail = null;
		
		detail = foodReviewDao.foodReviewDetail(rvo);
		if(detail !=null) {
			detail.setReview_contents(detail.getReview_contents().toString().replaceAll("\n", "<br />"));
		}
		return detail;
	}


	

	
	


}
