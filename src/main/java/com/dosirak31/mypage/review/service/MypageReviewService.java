package com.dosirak31.mypage.review.service;

import java.util.List;

import com.dosirak31.mypage.review.vo.MypageReviewVO;


public interface MypageReviewService {
	
	public MypageReviewVO mypageList(MypageReviewVO mrvo);	
	
	public List<MypageReviewVO> mypageReviewList(MypageReviewVO mrvo); 	
	
	public int mypageReviewDelete(MypageReviewVO review_no);			
	
	public MypageReviewVO mypageReviewDetail(MypageReviewVO mrvo);	
	
	public int mypageReviewUpdate(MypageReviewVO mrvo);		
	
	public MypageReviewVO updateForm(MypageReviewVO mrvo); 
	
	public int mypageReviewListCnt(MypageReviewVO mrvo);		
	
	
}
