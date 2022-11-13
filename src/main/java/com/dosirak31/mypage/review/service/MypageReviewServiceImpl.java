package com.dosirak31.mypage.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.mypage.review.dao.MypageReviewDao;
import com.dosirak31.mypage.review.vo.MypageReviewVO;

import lombok.Setter;

@Service
public class MypageReviewServiceImpl implements MypageReviewService {

	@Setter(onMethod_ = @Autowired)
	private MypageReviewDao mypageReviewDao;

	
	@Override
	public MypageReviewVO mypageList(MypageReviewVO mrvo) {
		
		MypageReviewVO list = null;
		list = mypageReviewDao.mypageList(mrvo);
		
		return list;
	}
	
	
	@Override
	public List<MypageReviewVO> mypageReviewList(MypageReviewVO mrvo) {
		List<MypageReviewVO> reviewlist = null;
		reviewlist = mypageReviewDao.mypageReviewList(mrvo);	
		return reviewlist;
	}

	
	@Override
	public int mypageReviewDelete(MypageReviewVO mrvo) {
		int result = 0;
		result = mypageReviewDao.mypageReviewDelete(mrvo.getReview_no());
		return result;
	}
	
	
	@Override
	public MypageReviewVO mypageReviewDetail(MypageReviewVO mrvo) {
		MypageReviewVO detail = null;
		
		detail = mypageReviewDao.mypageReviewDetail(mrvo);
		if(detail != null) {
			detail.setReview_contents(detail.getReview_contents().toString().replaceAll("\n", "<br />"));
		}
		
		return detail;
	}
	
	
	@Override
	public MypageReviewVO updateForm(MypageReviewVO mrvo) {
		MypageReviewVO detail = null;
		detail = mypageReviewDao.mypageReviewDetail(mrvo);
		return detail;
	}
	
	
	@Override
	public int mypageReviewUpdate(MypageReviewVO mrvo) {
		int result = 0;
		result = mypageReviewDao.mypageReviewUpdate(mrvo);
		return result;
	}

	
	@Override
	public int mypageReviewListCnt(MypageReviewVO mrvo) {
		return mypageReviewDao.mypageReviewListCnt(mrvo);
	}

	
	
	

}
