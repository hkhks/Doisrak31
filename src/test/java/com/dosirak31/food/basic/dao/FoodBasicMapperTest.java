package com.dosirak31.food.basic.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dosirak31.food.basic.vo.FoodBasicVO;
import com.dosirak31.food.order.dao.FoodOrderDao;
import com.dosirak31.food.order.vo.OrderDetailVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FoodBasicMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private FoodBasicDao foodBasicDao;
	private FoodOrderDao foodOrderDao;
	//��ǰ��� �������� �׽�Ʈ
	/*
	@Test
	public void testFoodBasicList() {
		FoodBasicVO fbo=new FoodBasicVO();
		List<FoodBasicVO> list=foodBasicDao.foodBasicList();
		for(FoodBasicVO vo: list) {
			log.info(vo);
		}
	}
	
	@Test
	public void testFoodBasicListCategory() {
		List<FoodBasicVO> list=foodBasicDao.foodBasicListCategory("���");
		for(FoodBasicVO vo: list) {
			log.info(vo);
		}
	}
	
	@Test
	public void testFoodBasicListCategory() {
		List<FoodBasicVO> list=foodBasicDao.foodBasicListNo(1);
		for(FoodBasicVO vo: list) {
			log.info(vo);
		}
	}
	*/
	@Test
	public List<OrderDetailVO> orderhistory(OrderDetailVO odv) {
		
		List<OrderDetailVO> orderhistory=foodOrderDao.orderhistory(odv);
		return orderhistory;
	}
}
