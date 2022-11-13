package com.dosirak31.food.order.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.food.basic.vo.FoodBasicVO;
import com.dosirak31.food.order.service.FoodOrderService;
import com.dosirak31.food.order.vo.OrderDetailListVO;
import com.dosirak31.food.order.vo.OrderDetailVO;

import lombok.AllArgsConstructor;
@Controller
@RequestMapping("/food/*")
@AllArgsConstructor
public class FoodOrderController {

	
	FoodOrderService foodOrderService;
	
	/*��ٱ��Ͽ� ��ǰ �߰� �� ��ٱ��� �������� �̵��ϸ鼭 select*/
	@RequestMapping(value="/bagInsert",method=RequestMethod.GET)
	public String bagInsert(OrderDetailVO odv, Model model,RedirectAttributes ras){
		
		foodOrderService.bagInsert(odv);
		ras.addFlashAttribute("bag","��ٱ����̵�");
		return "redirect:/food/foodClientBasicList"; 
	}
	/*��ٱ��Ϸ� �̵�*/
	@RequestMapping(value="/bagList",method=RequestMethod.GET)
	public String bagList(){
		return "food/client/bag";  
	}
	
	/*��ǰ���� �ٷ� �����ϱ� ������ ��-------------��ٱ��Ͽ��� orderListȰ��
	@RequestMapping(value="/orderList",method=RequestMethod.POST)
	public String orderInsert(OrderDetailVO odv, Model model){
		
		foodOrderService.orderInsert(odv);
		List<OrderDetailVO> orderList=foodOrderService.orderList(odv);
		model.addAttribute("orderList2",orderList);
		return "food/order"; 
	}
	*/
	
	/*�ֹ����������� ������ ������ ��
	@RequestMapping(value="/orderDelete",method=RequestMethod.POST)
	public void orderDelete(OrderDetailVO odv, Model model){
		
		foodOrderService.bagDelete1(odv.getDosirak_no());
		foodOrderService.bagDelete2(odv.getOrder_no());
		
	}
	*/
	///*��ǰ���� �ٷ� �����ϱ� ������ ��
	@RequestMapping(value="orderList",method=RequestMethod.POST)
	public String orderRedirect(@ModelAttribute("order1")OrderDetailVO odv,Model model) throws Exception{
		//foodOrderService.orderInsert(odv);
		//List<OrderDetailVO> orderList=foodOrderService.orderList(odv);
		//model.addAttribute("order1",orderList);

		return "food/client/order";
	}
	
	/*��ٱ��Ͽ��� �ٷ� �����ϱ� ������ ��*/
	@RequestMapping(value="orderList2",method=RequestMethod.POST)
	public String orderRedirect2(@ModelAttribute("order2") OrderDetailListVO odlv, RedirectAttributes ras) throws Exception{
		
		return "food/client/order";
	}
	//���� �� ��� ������ �ֹ����� 3���� update
	@RequestMapping(value="/orderConfirmation",method=RequestMethod.GET)
	public String orderConfirmation(@ModelAttribute("order2") OrderDetailVO odv, RedirectAttributes ras) {
		foodOrderService.orderUpdate(odv);//�ֹ� ���� �� ��� ���� update
		
		return "redirect:/mypage/client/mypageOrderList?client_no="+odv.getClient_no();
	}
	

}
