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
	//��ٱ��� ��ȸ
	@GetMapping(value="/bag/{client_no}",produces=MediaType.APPLICATION_JSON_VALUE)
	public List<OrderDetailVO> bagList(@PathVariable("client_no") int client_no){
		List<OrderDetailVO> bagList=foodOrderService.bagList(client_no);
		return bagList;  
	}
	
	
	//��ٱ��� ���� �� �ֹ����� ����
	@PutMapping(value="/{dosirak_no}",consumes="application/json",produces=MediaType.TEXT_PLAIN_VALUE)
	public String bagUpdate(@PathVariable("dosirak_no") int dosirak_no, @RequestBody OrderDetailVO odv) {
		odv.setDosirak_no(dosirak_no);
		int result=foodOrderService.bagUpdate(odv);
		return (result==1)?"SUCCESS":"FAILURE";
	}
	
	
	//��ٱ��Ͽ��� ����
	@GetMapping(value="/{dosirak_no}/{order_no}",produces=MediaType.TEXT_PLAIN_VALUE)
	public String bagDelete(@PathVariable("dosirak_no") int dosirak_no, @PathVariable("order_no") int order_no){
		int result2=foodOrderService.bagOrderNo(order_no);//�ֹ������̺� �ֹ���ȣ�� �����
		int result=foodOrderService.bagDelete1(dosirak_no);//���ö��� ����
		if(result2==1) {
			foodOrderService.bagDelete2(order_no);//�ֹ��� 1�������� �ֹ����̺� ����
		}
		return (result==1)?"SUCCESS":"FAILURE";
	}
	
	/*�ֹ��ϱ⿡�� �� �� �ֹ���ȣ ��ȯ�� ���� 2������ �Է����ֱ�*/
	@RequestMapping(value="/orderInsert",produces=MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.GET)
	public OrderDetailVO orderInsert(OrderDetailVO odv) throws Exception{
		foodOrderService.orderInsert(odv);
		OrderDetailVO orderList=foodOrderService.orderList(odv);//��ü Ÿ���̴ϱ�/////����غ���
		
		return orderList;
	}
	

	//�ֹ����� ����_PL
	@RequestMapping(value="/delete",consumes="application/json",produces=MediaType.TEXT_PLAIN_VALUE,method=RequestMethod.POST)
		public String orderDelete(@RequestBody OrderDetailVO odv){
			int result=foodOrderService.bagDelete1(odv.getDosirak_no());//���ö��� ����
			foodOrderService.bagDelete2(odv.getOrder_no());
			return (result==1)?"SUCCESS":"FAILURE";
		}
	//�������̺� insert
	@RequestMapping(value="/paymentInsert",consumes="application/json",produces=MediaType.TEXT_PLAIN_VALUE,method=RequestMethod.POST)
	public String paymentInsert(@RequestBody OrderDetailVO odv){
		int result=foodOrderService.paymentInsert(odv);//���ö��� ����
		return (result==1)?"SUCCESS":"FAILURE";
	}
}
