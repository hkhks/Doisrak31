package com.dosirak31.mypage.client.controller;

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

import com.dosirak31.mypage.client.service.MypageClientService;
import com.dosirak31.mypage.client.vo.MypageClientVO;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@RequestMapping(value = "/mypage/client/*")
@Controller
public class MypageClientController {
   
   private MypageClientService mypageClientService;
  
   
   
   /********************************************************
    * 마이페이지 회원정보 
    ********************************************************/
   @RequestMapping(value ="/mypageClientList", method = RequestMethod.GET)
   public String mypageClientList(@ModelAttribute MypageClientVO mcvo, Model model) {
      log.info("mypageClientList 호출 성공");
      List<MypageClientVO> mypageClientList = mypageClientService.mypageClientList(mcvo);
      model.addAttribute("mypageClientList", mypageClientList);
      
      return "mypage/client/mypageClientList";
   }
   
   
   /********************************************************
    * 마이페이지 회원정보 상세페이지
    ********************************************************/
   @GetMapping("/mypageClientDetail")
   public String mypageClientDetail(@ModelAttribute("data") MypageClientVO mcvo, Model model) {
      log.info("mypageClientDetail 호출 성공");
      
      MypageClientVO detail = mypageClientService.mypageClientDetail(mcvo);
      model.addAttribute("detail", detail);
      
      return "mypage/client/mypageClientDetail";
   }
   
   /********************************************************
    * 마이페이지 회원정보 삭제 (탈퇴)
    ********************************************************/
   @RequestMapping(value = "/mypageClientDelete")
   public String mypageClientDelete(@ModelAttribute MypageClientVO mcvo, RedirectAttributes ras) {
      log.info("mypageClientDelete 호출 성공");
      
      int result = 0;
      String url ="";
      
      result = mypageClientService.mypageClientDelete(mcvo);
      ras.addFlashAttribute("MypageClientVO", mcvo);
      
      if(result ==1 ) {
         url ="/mypage/client/mypageClientList";
      } 
      return "redirect:"+url;
   }
   
   /********************************************************
    * 마이페이지 회원정보 수정 폼
    * @param : client_no
    * @return : MypageClientVO
    ********************************************************/
   @RequestMapping(value= "/cUpdateForm")
   public String cUpdateForm(@ModelAttribute("data") MypageClientVO mcvo, Model model, HttpSession session) {
      log.info("cUpdateForm 호출 성공");
      log.info("client_no = " + mcvo.getClient_no());
      
      int client_no = (int) session.getAttribute("client_no"); //세션에서 client_id값을 가져옴(수정 불가능한 고정값)
      mcvo.setClient_no(client_no);
      
      MypageClientVO updateData = mypageClientService.cUpdateForm(mcvo);
      
      model.addAttribute("updateData", updateData);
      return "mypage/client/cUpdateForm";
   }
   
   
   /********************************************************
    * 마이페이지 회원정보 수정
    ********************************************************/   
   @RequestMapping(value= "/mypageClientUpdate", method=RequestMethod.POST)
   public String mypageClientUpdate(@ModelAttribute MypageClientVO mcvo, RedirectAttributes ras ) {
      log.info("mypageClientUpdate 호출 성공");
      
      int result = 0;
      String url = "";
      
      result = mypageClientService.mypageClientUpdate(mcvo);
      ras.addFlashAttribute("data", mcvo);
      
      if(result == 1) {
         url ="mypageMain";
      } else {
         url ="mypage/client/cUpdateForm";
      }
      
      return "redirect:"+url;
   }
   
   /********************************************************
    * 마이페이지 비밀번호 체크 폼
    ********************************************************/ 
   @RequestMapping(value = "/mypageCheckForm")
   public String mypageCheckForm(@ModelAttribute("data") MypageClientVO mcvo, Model model)  {
      log.info("mypageCheckForm 호출 성공");
      
      MypageClientVO CheckPw = mypageClientService.mypageCheckForm(mcvo);
         
      model.addAttribute("CheckPw", CheckPw);
      
      return "mypage/client/mypageCheckForm";
   }
   
   /********************************************************
    * 마이페이지 비밀번호 체크
    ********************************************************/
    @RequestMapping(value = "/mypageCheck", method=RequestMethod.POST)
    public String mypageCheck(MypageClientVO mcvo,HttpServletRequest httpServletRequest, Model model, HttpSession session) throws Exception {
       log.info("mypageCheck 호출 성공");
        
       int client_no = (int) session.getAttribute("client_no"); //세션에서 client_id값을 가져옴(수정 불가능한 고정값)
       mcvo.setClient_no(client_no);
       MypageClientVO updateData = mypageClientService.cUpdateForm(mcvo);
       model.addAttribute("updateData", updateData);
       
       String pw = httpServletRequest.getParameter("client_pw");
        model.addAttribute("client_pw", pw);
        
        return "mypage/client/cUpdateForm";
    }
    
       
   
  
   
   
   
   
   
   
   
   
}







