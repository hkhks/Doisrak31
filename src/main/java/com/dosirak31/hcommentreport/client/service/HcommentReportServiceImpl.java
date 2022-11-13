package com.dosirak31.hcommentreport.client.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.hcomment.client.vo.HCommentVO;
import com.dosirak31.hcommentreport.client.dao.HcommentReportDao;
import com.dosirak31.hcommentreport.client.vo.HcommentReportVO;

import lombok.Setter;

@Service
public class HcommentReportServiceImpl implements HcommentReportService{
	
	@Setter(onMethod_= @Autowired)
	public HcommentReportDao hcommentReportDao;

	@Override
	public int reportIn(HcommentReportVO reportvo) {

		int result = hcommentReportDao.reportIn(reportvo);
		
		return result;
	}

	
	/******************************************************
	 * 관리자페이지 댓글 목록 불러오기
	 *****************************************************/
	@Override
	public List<HcommentReportVO> select(HcommentReportVO reportvo) {
		
		List<HcommentReportVO> list = hcommentReportDao.select(reportvo);
		
		return list; //신고된 댓글 전체 가져오기
	}

	/******************************************************
	 * 관리자페이지 댓글 갯수 세기
	 *****************************************************/
	@Override
	public int hcommentReportListCnt(HcommentReportVO reportvo) {
		
		int countNum = 0;
		countNum = hcommentReportDao.hcommentReportListCnt(reportvo);
		
		return countNum;
	}

	/******************************************************
	 * 관리자페이지 댓글 삭제
	 *****************************************************/

	@Override
	public int deleteReportAdmin1(HcommentReportVO reportvo) {
		
		int result = 0;
		result = hcommentReportDao.deleteReportAdmin1(reportvo);
		
		return result;
	}


	@Override
	public int deleteReportAdmin2(HcommentReportVO reportvo) {
		
		int result = 0;
		result = hcommentReportDao.deleteReportAdmin2(reportvo);
		
		return result;
	}



	
	
	
	
	
	
	

}
