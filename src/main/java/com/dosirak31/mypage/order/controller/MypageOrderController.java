package com.dosirak31.mypage.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.common.vo.PageDTO;
import com.dosirak31.food.order.vo.OrderDetailVO;
import com.dosirak31.login.client.vo.ClientLoginVO;
import com.dosirak31.mypage.order.service.MypageOrderService;
import com.dosirak31.mypage.order.vo.MypageOrderVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@RequestMapping("/mypage/client/*")
@Controller
public class MypageOrderController {
   
   private MypageOrderService mypageOrderService;
   
   /***********************************************
    * 주문 내역 조회
    ***********************************************/
   @GetMapping("/mypageOrderList")
   public String mypageOrderList(@ModelAttribute("data") OrderDetailVO odv, Model model,HttpServletRequest request) {
      log.info("mypageOrderList 호출 성공");
      
      List<OrderDetailVO> mypageOrderList = mypageOrderService.mypageOrderList(odv);
      model.addAttribute("mypageOrderList", mypageOrderList);
      
      //전체 레코드 수 구현
      int total=mypageOrderService.mypageOrderListCnt(odv);
      //페이징 처리
      model.addAttribute("pageMaker",new PageDTO(odv,total));
      
      return "mypage/client/mypageOrderList";
   }
   
   /***********************************************
    * 주문 취소
    ***********************************************/
   @RequestMapping(value = "/mypageOrderDelete",method=RequestMethod.GET)
   public String mypageOrderDelete(@ModelAttribute OrderDetailVO odv, RedirectAttributes ras) {
      log.info("mypageOrderDelete 호출 성공");
      
      int result = 0;
      String url ="";
      
      result = mypageOrderService.mypageOrderDelete(odv);
      ras.addFlashAttribute("OrderDetailVO", odv);
      
      if(result ==1) {
         url ="/mypage/client/mypageOrderList";
      }
      return "redirect:"+url;
   }
}