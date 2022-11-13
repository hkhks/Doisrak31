package com.dosirak31.mypage.review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.common.vo.PageDTO;
import com.dosirak31.login.client.vo.ClientLoginVO;
import com.dosirak31.mypage.review.service.MypageReviewService;
import com.dosirak31.mypage.review.vo.MypageReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@RequestMapping(value="/mypage/client/*")
@Controller
public class MypageReviewController {
   
   private MypageReviewService mypageReviewService;
   
   
   @RequestMapping(value = "/mypageMain", method = RequestMethod.GET)
   public String mypageList(@ModelAttribute MypageReviewVO mrvo, Model model,HttpSession session) {
      log.info("mypageList");
      
      ClientLoginVO client_info = (ClientLoginVO)session.getAttribute("client_info"); 
      mrvo.setClient_id(client_info.getClient_id()); 

      MypageReviewVO mypageList = mypageReviewService.mypageList(mrvo);
      
      model.addAttribute("mypageList", mypageList);
      
      return "mypage/client/mypageMain";
   }
   
   
   @RequestMapping(value = "/mypageReviewList", method = RequestMethod.GET)
   public String mypageReviewList(@ModelAttribute MypageReviewVO mrvo, Model model, HttpSession session) {
      log.info("mypageReviewList ");
      
      ClientLoginVO client_info = (ClientLoginVO)session.getAttribute("client_info"); 
      
      mrvo.setClient_no(client_info.getClient_no());
      
      List<MypageReviewVO> mypageReviewList = mypageReviewService.mypageReviewList(mrvo);
      
      model.addAttribute("mypageReviewList", mypageReviewList);
      
      //占쎌읈筌ｏ옙 占쎌쟿 굜遺얜굡占쎈땾  뤃 뗭겱
      int total = mypageReviewService.mypageReviewListCnt(mrvo);
      //占쎈읂占쎌뵠筌욑옙 筌ｌ꼶 봺
      model.addAttribute("pageMaker", new PageDTO(mrvo, total));
      
      return "mypage/client/mypageReviewList";
   }
   
   
   
   @RequestMapping(value = "/mypageReviewDelete")
   public String mypageReviewDelete(@ModelAttribute MypageReviewVO mrvo, RedirectAttributes ras) {
      log.info("mypageReviewDelete ");
      
      int result = 0;
      String url ="";
      
      result = mypageReviewService.mypageReviewDelete(mrvo);
      ras.addFlashAttribute("MypageReviewVO", mrvo);
      
      if(result ==1 ) {
         url ="mypage/client/mypageReviewList";
      } 
      return "redirect:"+url;
   }
   
   
   @GetMapping("/mypageReviewDetail")
   public String mypageReviewDetail(@ModelAttribute("data") MypageReviewVO mrvo, Model model) {
      log.info("mypageReviewDetail ");
      
      MypageReviewVO detail = mypageReviewService.mypageReviewDetail(mrvo);
      model.addAttribute("detail", detail);
      
      return "mypage/client/mypageReviewDetail";
   }
   
   
   @RequestMapping(value= "/updateForm")
   public String updateForm(@ModelAttribute("data") MypageReviewVO mrvo, Model model) {
      log.info("updateForm ");
      log.info("review_no = " + mrvo.getReview_no());
      MypageReviewVO updateData = mypageReviewService.updateForm(mrvo);
      
      model.addAttribute("updateData", updateData);
      return "mypage/client/updateForm";
   }
   
   
   @RequestMapping(value= "/mypageReviewUpdate", method=RequestMethod.POST)
   public String mypageReviewUpdate(@ModelAttribute MypageReviewVO mrvo, RedirectAttributes ras ) {
      log.info("mypageReviewUpdate ");
      
      int result = 0;
      String url = "";
      
      result = mypageReviewService.mypageReviewUpdate(mrvo);
      ras.addFlashAttribute("data", mrvo);
      
      if(result == 1) {
         url ="mypageReviewDetail";
      } else {
         url ="mypage/client/updateForm";
      }
      
      return "redirect:"+url;
   }
}