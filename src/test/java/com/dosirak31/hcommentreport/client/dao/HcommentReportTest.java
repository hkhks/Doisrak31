package com.dosirak31.hcommentreport.client.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dosirak31.hcommentreport.client.vo.HcommentReportVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class HcommentReportTest {
	
	@Setter(onMethod_ = @Autowired)
	private HcommentReportDao hcommentReportDao;
	
	@Test
	public void testFoodBasicList() {
		HcommentReportVO hrvo = new HcommentReportVO();
		hrvo.setHealth_comment_no(618);
		int result = hcommentReportDao.deleteReportAdmin1(hrvo);
		
		log.info(result);
	}
	
	

}
