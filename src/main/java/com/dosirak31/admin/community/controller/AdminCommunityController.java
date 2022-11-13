package com.dosirak31.admin.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.admin.community.service.AdminCommunityService;
import com.dosirak31.client.community.vo.CommunityVO;
import com.dosirak31.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/community/admin/*")
@Log4j
public class AdminCommunityController {
   
   @Setter(onMethod_ = @Autowired)
   private AdminCommunityService adminCommunityService;
   
   /************************************
    * 글 목록 구현하기
    *************************************/
   
   @RequestMapping(value = "/communityList", method = RequestMethod.GET)
   public String communityList(CommunityVO cvo, Model model) {
      log.info("admin communityList 호출 성공");
      
      List<CommunityVO> communityList = adminCommunityService.communityList(cvo);
      model.addAttribute("communityList", communityList);
      
      //전체 레코드 수 구현
      int total = adminCommunityService.communityListCnt(cvo);
      model.addAttribute("pageMaker", new PageDTO(cvo, total));
      
      int count = total - (cvo.getPageNum()-1) * cvo.getAmount();
      model.addAttribute("count", count);
      
      return "community/admin/communityList";
   }
   
   /*************************************************
    * 글쓰기 폼 출력하기
    *************************************************/
   
   @RequestMapping(value = "/writeForm")
   public String writeForm() {
      log.info("writeForm 호출 성공");
      
      return "community/admin/writeForm";
   }
   
   /*************************************************
    * 글쓰기 구현하기
    *************************************************/
   @PostMapping("/communityInsert")
   public String communityInsert(CommunityVO cvo, Model model) throws Exception{
      log.info("communityInsert 호출 성공");
      
      int result = 0;
      String url = "";
      
      result = adminCommunityService.communityInsert(cvo);
      if(result == 1 && cvo.getCommunity_category_no() == 0) {
         url = "/community/admin/communityList?community_category_no=0"; 
      } else if(result == 1 && cvo.getCommunity_category_no() == 1) {
         url = "/community/admin/communityList?community_category_no=1"; 
      } else { 
          url = "/community/admin/writeForm"; }
      
      return "redirect:"+url;
   }
   
   
   /*************************************************
    * 글 상세보기 구현
    *************************************************/
   
   @GetMapping("/communityDetail")
   public String communityDetail(@ModelAttribute("data") CommunityVO cvo, Model model) {
      log.info("communityDetail 호출 성공");
      
      CommunityVO detail = adminCommunityService.communityDetail(cvo);
      model.addAttribute("detail", detail);
      
      return "community/admin/communityDetail";
   }
   
   /*************************************************
    * 비밀번호 확인
    * @param b_num
    * @param b_pwd
    * @return int로 result를 0또는 1를 리턴할 수도 있고,
    *          String로 result 값을 "성공 or 실패, 일치 or 불일치"를 리턴할 수도 있다.(현재 문자열 리턴)
    * 참고 : @ResponseBody 는 전달된 뷰를 통해서 출력하는 것이 아니라 HTTP Response Body에 직접 출력하는 방식(ajax 요청시 사용)
    *       produces 속성은 지정한 미디어 타입과 관련된 응답을 생성하는데 사용한 실제 컨텐트 타입을 보장.
    *************************************************/
   
   @ResponseBody
   @RequestMapping(value = "/pwdConfirm", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
   public String pwdConfirm(CommunityVO cvo) {
      log.info("pwdConfirm 호출 성공");
      String value = "";
      
      // 아래 변수에는 입력 성공에 대한 상태값 저장(1 or 0)
      int result = adminCommunityService.pwdConfirm(cvo);
      if(result == 1) {
         value="일치";
      } else {
         value="불일치";
      }
      log.info("result = " + result);
      
      return value;
   }
   
   /*************************************************
    * 글수정 폼 출력하기
    * @param : community_no
    * @return : CommunityVO
    *************************************************/
   @RequestMapping(value="/updateForm")
   public String updateForm(@ModelAttribute("data") CommunityVO cvo, Model model) {
      log.info("updateForm 호출 성공");
      log.info("community_no = " + cvo.getCommunity_no());
      
      CommunityVO updateData = adminCommunityService.updateForm(cvo);
      
      model.addAttribute("updateData", updateData);
      return "community/admin/updateForm"; // /WEB-INF/views/board/updateForm.jsp를 의미
   }
   
   /*************************************************
    * 글수정 구현하기
    * @param : CommunityVO
    * 참고 : RedirectAttributes 객체는 리다티렉트 시점(return "redirect:/경로")에
    * 한번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다.
    * addFlashAttribute() 메서드는 브라우저까지 전송되기는 하지만, URI상에는 보이지 않는 숨겨진 데이터의 형태로 전달된다.
    *************************************************/
   
   @RequestMapping(value="/communityUpdate", method=RequestMethod.POST)
   public String communityUpdate(@ModelAttribute CommunityVO cvo, RedirectAttributes ras) throws Exception{
      log.info("communityUpdate 호출 성공");
      
      int result = 0;
      String url ="";
      
      result = adminCommunityService.communityUpdate(cvo);
      ras.addFlashAttribute("data", cvo);
      
      if(result == 1 && cvo.getCommunity_category_no() == 0) {
         url = "/community/admin/communityDetail?community_category_no=0"; 
      } else if(result == 1 && cvo.getCommunity_category_no() == 1) {
         url = "/community/admin/communityDetail?community_category_no=1"; 
      } else { 
          url = "/community/admin/updateForm"; }
      
      return "redirect:"+url; 
   }
   
   
   /*************************************************
    * 글삭제 구현하기
    *************************************************/
   @RequestMapping(value = "/communityDelete")
   public String boardDelete(@ModelAttribute CommunityVO cvo, RedirectAttributes ras) throws Exception{
      log.info("communityDelete 호출 성공");
      
      // 아래 변수에는 입력 성공에 대한 상태값 담습니다(1 or 0)
      int result = 0;
      String url = "";
      
      // result = boardService.boardDelete(bvo.getB_num());
      result = adminCommunityService.communityDelete(cvo);
      ras.addFlashAttribute("CommunityVO", cvo);
      
      if(result ==1) {
         url="/community/admin/communityList";
      } else {
         //url="/board/boardDetail?b_num="+bvo.getB_num();
         url="/community/admin/communityDetail";
      }
      return "redirect:"+url;
      
   }
   
   /*************************************************
    * 글 삭제 전 댓글 개수 구현하기
    * @param int
    *************************************************/
   @ResponseBody
   @RequestMapping(value = "/replyCnt")
   public String replyCnt(@RequestParam("community_no") int community_no) {
      log.info("replyCnt 호출 성공");
      
      int result = 0;
      result = adminCommunityService.replyCnt(community_no);
      
      //return result+"";
      return String.valueOf(result);
   }

}