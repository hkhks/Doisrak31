package com.dosirak31.hcomment.client.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dosirak31.common.vo.CommonVO;
import com.dosirak31.food.basic.dao.FoodBasicDao;
import com.dosirak31.food.review.vo.FoodReviewVO;
import com.dosirak31.hcomment.client.vo.HCommentVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class test {
	
	@Setter(onMethod_ = @Autowired)
	private HCommentDao hcommentDao;
	
	
	@Test
	public void test() {
		
		HCommentVO hvo = new HCommentVO();
		hvo.setPageNum(1);
		hvo.setAmount(20); 
		
		List<HCommentVO> list = null;
		list = hcommentDao.select(hvo);
		
		for(HCommentVO vo : list) { 
			log.info(vo); 
		}
		
		log.info("레코드 수 : " +hcommentDao.hcommentListCnt(hvo));
		
	}
	

}
