package com.dosirak31.admin.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.admin.review.service.AdminReviewService;
import com.dosirak31.admin.review.vo.AdminReviewVO;
import com.dosirak31.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/foodReview/admin/*")
@Log4j
public class AdminReviewController {
   
   @Setter(onMethod_ = @Autowired)
   private AdminReviewService adminReviewService;
   
   
   @RequestMapping(value = "/adminfoodReviewList", method= RequestMethod.GET)
   public String adminReviewList(AdminReviewVO arvo, Model model) {
      log.info("adminReviewList 호출 성공");
      
      List<AdminReviewVO> adminReviewList = adminReviewService.adminReviewList(arvo);
      model.addAttribute("adminReviewList", adminReviewList);
      
      int total = adminReviewService.adminReviewListCnt(arvo);
      model.addAttribute("pageMaker", new PageDTO(arvo, total));
      
      int count = total - (arvo.getPageNum()-1) * arvo.getAmount();
      model.addAttribute("count", count);
      
      return "foodReview/admin/adminfoodReviewList";
   }
   
   
   @RequestMapping(value = "/adminReviewDelete")
   public String adminReviewDelete(@ModelAttribute AdminReviewVO arvo, RedirectAttributes ras) {
      log.info("adminReviewDelete 호출 성공");
      
      int result = 0;
      String url ="";
      
      result = adminReviewService.adminReviewDelete(arvo);
      ras.addFlashAttribute("adminReviewVO", arvo);
      
      if(result ==1) {
         url = "adminfoodReviewList";
      }
      return "redirect:"+url;
   }
}