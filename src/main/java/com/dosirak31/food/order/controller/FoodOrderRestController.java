package com.dosirak31.food.order.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dosirak31.food.order.service.FoodOrderService;
import com.dosirak31.food.order.vo.OrderDetailVO;
import lombok.AllArgsConstructor;

@RestController
@RequestMapping(value="/order")
@AllArgsConstructor
public class FoodOrderRestController {

	FoodOrderService foodOrderService;
	//장바구니 조회
	@GetMapping(value="/bag/{client_no}",produces=MediaType.APPLICATION_JSON_VALUE)
	public List<OrderDetailVO> bagList(@PathVariable("client_no") int client_no){
		List<OrderDetailVO> bagList=foodOrderService.bagList(client_no);
		return bagList;  
	}
	
	
	//장바구니 수정 및 주문으로 변경
	@PutMapping(value="/{dosirak_no}",consumes="application/json",produces=MediaType.TEXT_PLAIN_VALUE)
	public String bagUpdate(@PathVariable("dosirak_no") int dosirak_no, @RequestBody OrderDetailVO odv) {
		odv.setDosirak_no(dosirak_no);
		int result=foodOrderService.bagUpdate(odv);
		return (result==1)?"SUCCESS":"FAILURE";
	}
	
	
	//장바구니에서 삭제
	@GetMapping(value="/{dosirak_no}/{order_no}",produces=MediaType.TEXT_PLAIN_VALUE)
	public String bagDelete(@PathVariable("dosirak_no") int dosirak_no, @PathVariable("order_no") int order_no){
		int result2=foodOrderService.bagOrderNo(order_no);//주문상세테이블에 주문번호가 몇개인지
		int result=foodOrderService.bagDelete1(dosirak_no);//도시락만 삭제
		if(result2==1) {
			foodOrderService.bagDelete2(order_no);//주문상세 1개있으면 주문테이블도 삭제
		}
		return (result==1)?"SUCCESS":"FAILURE";
	}
	
	/*주문하기에서 제 준 주문번호 반환을 위해 2번으로 입력해주기*/
	@RequestMapping(value="/orderInsert",produces=MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.GET)
	public OrderDetailVO orderInsert(OrderDetailVO odv) throws Exception{
		foodOrderService.orderInsert(odv);
		OrderDetailVO orderList=foodOrderService.orderList(odv);//객체 타입이니까/////고민해보기
		
		return orderList;
	}
	

	//주문에서 삭제_PL
	@RequestMapping(value="/delete",consumes="application/json",produces=MediaType.TEXT_PLAIN_VALUE,method=RequestMethod.POST)
		public String orderDelete(@RequestBody OrderDetailVO odv){
			int result=foodOrderService.bagDelete1(odv.getDosirak_no());//도시락만 삭제
			foodOrderService.bagDelete2(odv.getOrder_no());
			return (result==1)?"SUCCESS":"FAILURE";
		}
	//결제테이블 insert
	@RequestMapping(value="/paymentInsert",consumes="application/json",produces=MediaType.TEXT_PLAIN_VALUE,method=RequestMethod.POST)
	public String paymentInsert(@RequestBody OrderDetailVO odv){
		int result=foodOrderService.paymentInsert(odv);//도시락만 삭제
		return (result==1)?"SUCCESS":"FAILURE";
	}
}
