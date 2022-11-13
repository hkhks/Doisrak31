package com.dosirak31.hcommentreport.client.dao;

import java.util.List;

import com.dosirak31.hcommentreport.client.vo.HcommentReportVO;

public interface HcommentReportDao {

	public int reportIn(HcommentReportVO reportvo);

	public List<HcommentReportVO> select(HcommentReportVO reportvo);

	public int hcommentReportListCnt(HcommentReportVO reportvo);

	public int deleteReportAdmin1(HcommentReportVO reportvo);

	public int deleteReportAdmin2(HcommentReportVO reportvo);

}
