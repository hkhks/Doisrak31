package com.dosirak31.mypage.review.dao;

import java.util.List;

import com.dosirak31.mypage.review.vo.MypageReviewVO;

public interface MypageReviewDao {
	
	public MypageReviewVO mypageList(MypageReviewVO mrvo);	
	
	public List<MypageReviewVO> mypageReviewList(MypageReviewVO mrvo); 	
	
	public int mypageReviewDelete(int review_no);			
	
	public MypageReviewVO mypageReviewDetail(MypageReviewVO mrvo);	
	
	public int mypageReviewUpdate(MypageReviewVO mrvo);		
	
	public int mypageReviewListCnt(MypageReviewVO mrvo);		
}
