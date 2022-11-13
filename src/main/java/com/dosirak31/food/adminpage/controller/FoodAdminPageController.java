package com.dosirak31.food.adminpage.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.dosirak31.common.vo.PageDTO;
import com.dosirak31.food.order.service.FoodOrderService;
import com.dosirak31.food.order.vo.OrderDetailVO;
import com.dosirak31.food.order.vo.OrderGraphDTO;

import lombok.AllArgsConstructor;
@Controller
@RequestMapping("/food/admin/*")
@AllArgsConstructor
public class FoodAdminPageController {
	
	FoodOrderService foodOrderService;
	/*�ֹ����� select*/
	@RequestMapping(value="/orderhistory",method=RequestMethod.GET)
	public String orderhistory(@ModelAttribute("data") OrderDetailVO odv, Model model){
		List<OrderDetailVO> orderhistory=foodOrderService.orderhistory(odv);
		model.addAttribute("orderhistory",orderhistory);
		
		//��ü ���ڵ� �� ����
		int total=foodOrderService.orderListCnt(odv);
		//����¡ ó��
		model.addAttribute("pageMaker",new PageDTO(odv,total));
				
		
		return "food/admin/orderhistory"; 
	}
	
	//��޹߼۹�ư
	@RequestMapping(value="/delivery",method=RequestMethod.GET)
	public String orderDelivery(@ModelAttribute("data") OrderDetailVO odv, Model model){
		foodOrderService.orderDelivery(odv);
		return "redirect:/food/admin/orderhistory?pageNum=1&amount=10&order_status_no=5"; 
	}
	
	//������ҹ�ư
	//��޹߼۹�ư
		@RequestMapping(value="/paymentDelete",method=RequestMethod.GET)
		public String paymentDelete(@ModelAttribute("data") OrderDetailVO odv, Model model){
			foodOrderService.paymentDelete(odv);
			return "redirect:/food/admin/orderhistory?pageNum=1&amount=10&order_status_no=4"; 
		}
		
	/*�ֹ������ �̵�*/
	@RequestMapping(value="/orderGraph",method=RequestMethod.GET)
	public String bagList(Model model){
		OrderGraphDTO orderBeforeWeek= foodOrderService.orderBeforeWeek();
		model.addAttribute("orderBeforeWeek",orderBeforeWeek);
		OrderGraphDTO orderCurrentWeek=foodOrderService.orderCurrentWeek();
		model.addAttribute("orderCurrentWeek",orderCurrentWeek);
		OrderGraphDTO orderMonth=foodOrderService.orderMonth();
		model.addAttribute("orderMonth",orderMonth);
		return "food/admin/orderGraph";  
	}
			
}
