package com.dosirak31.hcommentreport.client.service;

import java.util.List;

import com.dosirak31.hcommentreport.client.vo.HcommentReportVO;

public interface HcommentReportService {

	public int reportIn(HcommentReportVO reportvo);
	
	public List<HcommentReportVO> select(HcommentReportVO reportvo);// ������ ������ ��� ��ü ��ȸ
	
	public int hcommentReportListCnt(HcommentReportVO reportvo);// ������������ �Ű� ��� ���� ����

	public int deleteReportAdmin1(HcommentReportVO reportvo); //������������ �Ű� ��� ���� - �ｺ �Ű� ��� ���̺�

	public int deleteReportAdmin2(HcommentReportVO reportvo);

}
