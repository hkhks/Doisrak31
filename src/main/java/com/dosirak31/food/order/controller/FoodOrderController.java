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
	
	/*장바구니에 식품 추가 후 장바구니 페이지로 이동하면서 select*/
	@RequestMapping(value="/bagInsert",method=RequestMethod.GET)
	public String bagInsert(OrderDetailVO odv, Model model,RedirectAttributes ras){
		
		foodOrderService.bagInsert(odv);
		ras.addFlashAttribute("bag","장바구니이동");
		return "redirect:/food/foodClientBasicList"; 
	}
	/*장바구니로 이동*/
	@RequestMapping(value="/bagList",method=RequestMethod.GET)
	public String bagList(){
		return "food/client/bag";  
	}
	
	/*식품에서 바로 구매하기 눌렀을 때-------------장바구니에서 orderList활용
	@RequestMapping(value="/orderList",method=RequestMethod.POST)
	public String orderInsert(OrderDetailVO odv, Model model){
		
		foodOrderService.orderInsert(odv);
		List<OrderDetailVO> orderList=foodOrderService.orderList(odv);
		model.addAttribute("orderList2",orderList);
		return "food/order"; 
	}
	*/
	
	/*주문페이지에서 나가기 눌렀을 때
	@RequestMapping(value="/orderDelete",method=RequestMethod.POST)
	public void orderDelete(OrderDetailVO odv, Model model){
		
		foodOrderService.bagDelete1(odv.getDosirak_no());
		foodOrderService.bagDelete2(odv.getOrder_no());
		
	}
	*/
	///*식품에서 바로 구매하기 눌렀을 때
	@RequestMapping(value="orderList",method=RequestMethod.POST)
	public String orderRedirect(@ModelAttribute("order1")OrderDetailVO odv,Model model) throws Exception{
		//foodOrderService.orderInsert(odv);
		//List<OrderDetailVO> orderList=foodOrderService.orderList(odv);
		//model.addAttribute("order1",orderList);

		return "food/client/order";
	}
	
	/*장바구니에서 바로 구매하기 눌렀을 때*/
	@RequestMapping(value="orderList2",method=RequestMethod.POST)
	public String orderRedirect2(@ModelAttribute("order2") OrderDetailListVO odlv, RedirectAttributes ras) throws Exception{
		
		return "food/client/order";
	}
	//결제 후 배달 정보와 주문상태 3으로 update
	@RequestMapping(value="/orderConfirmation",method=RequestMethod.GET)
	public String orderConfirmation(@ModelAttribute("order2") OrderDetailVO odv, RedirectAttributes ras) {
		foodOrderService.orderUpdate(odv);//주문 상태 및 배달 정보 update
		
		return "redirect:/mypage/client/mypageOrderList?client_no="+odv.getClient_no();
	}
	

}
