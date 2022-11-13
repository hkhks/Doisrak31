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
	 * ������������ ��� ��� �ҷ�����
	 *****************************************************/
	@Override
	public List<HcommentReportVO> select(HcommentReportVO reportvo) {
		
		List<HcommentReportVO> list = hcommentReportDao.select(reportvo);
		
		return list; //�Ű�� ��� ��ü ��������
	}

	/******************************************************
	 * ������������ ��� ���� ����
	 *****************************************************/
	@Override
	public int hcommentReportListCnt(HcommentReportVO reportvo) {
		
		int countNum = 0;
		countNum = hcommentReportDao.hcommentReportListCnt(reportvo);
		
		return countNum;
	}

	/******************************************************
	 * ������������ ��� ����
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
