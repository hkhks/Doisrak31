package com.dosirak31.food.adminpage.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dosirak31.food.order.service.FoodOrderService;
import com.dosirak31.food.order.vo.OrderDetailVO;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping(value="/food/admin/*")
@AllArgsConstructor
public class FoodAdminPageRestController {
	
	FoodOrderService foodOrderService;
	//주문내역 상세페이지
		@GetMapping(value="/order/{order_no}",produces=MediaType.APPLICATION_JSON_VALUE)
		public List<OrderDetailVO> bagList(@PathVariable("order_no") int order_no){
			List<OrderDetailVO> orderDetailHistory=foodOrderService.orderDetailHistory(order_no);
			return orderDetailHistory;  
		}
}
