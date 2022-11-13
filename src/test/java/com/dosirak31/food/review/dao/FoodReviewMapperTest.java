package com.dosirak31.food.review.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//import com.dosirak31.food.basic.dao.FoodBasicDao;
//import com.dosirak31.food.basic.dao.FoodBasicMapperTest;
import com.dosirak31.food.review.vo.FoodReviewVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FoodReviewMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private FoodReviewDao foodReviewDao;
	
	/*
	 * @Test public void testFoodReviewList() { FoodReviewVO rvo = new
	 * FoodReviewVO(); List<FoodReviewVO> list = foodReviewDao.foodReviewList(rvo);
	 * for(FoodReviewVO vo : list) { log.info(vo); } }
	 */
	
	@Test
	public void testFoodReviewList() {
		FoodReviewVO rvo = new FoodReviewVO();
		rvo.setPageNum(1);
		rvo.setAmount(10);
		
		List<FoodReviewVO> list= foodReviewDao.foodReviewList(rvo);
		for(FoodReviewVO vo : list) { 
			log.info(vo); 
			}
			log.info("레코드 수 : " + foodReviewDao.foodReviewListCnt(rvo));
	}
}

