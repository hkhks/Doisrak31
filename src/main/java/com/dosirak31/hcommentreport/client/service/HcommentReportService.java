package com.dosirak31.hcommentreport.client.service;

import java.util.List;

import com.dosirak31.hcommentreport.client.vo.HcommentReportVO;

public interface HcommentReportService {

	public int reportIn(HcommentReportVO reportvo);
	
	public List<HcommentReportVO> select(HcommentReportVO reportvo);// 관리자 페이지 댓글 전체 조회
	
	public int hcommentReportListCnt(HcommentReportVO reportvo);// 관리자페이지 신고 댓글 갯수 세기

	public int deleteReportAdmin1(HcommentReportVO reportvo); //관리자페이지 신고 댓글 삭제 - 헬스 신고 댓글 테이블

	public int deleteReportAdmin2(HcommentReportVO reportvo);

}
