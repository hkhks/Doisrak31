package com.dosirak31.client.community.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.client.community.service.CommunityService;
import com.dosirak31.client.community.vo.CommunityVO;
import com.dosirak31.client.signup.vo.ClientVO;
import com.dosirak31.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@AllArgsConstructor
@Log4j
@RequestMapping("/community/client/*")
@Controller // Controller ������ �ν��Ͻ� ���� �ȵȴ�.
public class CommunityController {
   
   // service�� ����
   private CommunityService communityService;
   
   
   
   /*************************************************
    * �� ��� �����ϱ� 
    * ��û URL: http://localhost:8080/community/communityList
    ************************************************
   @GetMapping("/communityList")
   public String communityList(@ModelAttribute CommunityVO cvo, Model model) {
      log.info("communityList ȣ�� ����");
      // ��ü ���ڵ� ��ȸ
      List<CommunityVO> communityList = communityService.communityList(cvo);
      model.addAttribute("communityList", communityList);
      
      return "community/client/communityList";  // /WEB-INF/views/community/communityList.jsp
   } */
   
   
   /*************************************************
    * �� ��� �����ϱ�(����¡ ó�� ��� ��ȸ) 
    * ��û URL: http://localhost:8080/community/communityList
    ************************************************/
   @GetMapping("/communityList")
   public String communityList(@ModelAttribute CommunityVO cvo, Model model) {
      log.info("communityList ȣ�� ����");
      // ��ü ���ڵ� ��ȸ
      List<CommunityVO> communityList = communityService.communityList(cvo);
      model.addAttribute("communityList", communityList);
      
      // ��ü ���ڵ� �� ��ȯ
      int total = communityService.communityListCnt(cvo);
      //����¡ ó��
      model.addAttribute("pageMaker", new PageDTO(cvo, total)); //new PageDTO(CommonVO �Ǵ� CommonVO ���� Ŭ������ �ν��Ͻ�(BoardVO), �� ���ڵ��)
      
      return "community/client/communityList";  // /WEB-INF/views/community/communityList.jsp
   }
   
   
   
   /*************************************************
    * �۾��� �� ����ϱ�
    *************************************************/
   
   @RequestMapping(value = "/writeForm")
   public String writeForm() {
      log.info("writeForm ȣ�� ����");
      
      return "community/client/writeForm";
   }
   
   /*************************************************
    * �۾��� �����ϱ�
    *************************************************/
   @PostMapping("/communityInsert")
   public String communityInsert(CommunityVO cvo, Model model) throws Exception{
      log.info("communityInsert ȣ�� ����");
      
      int result = 0;
      String url = "";
      
      result = communityService.communityInsert(cvo);
      if(result == 1 && cvo.getCommunity_category_no() == 0) {
         url = "/community/client/communityList?community_category_no=0"; 
      } else if(result == 1 && cvo.getCommunity_category_no() == 1) {
         url = "/community/client/communityList?community_category_no=1"; 
      } else { 
          url = "/community/client/writeForm"; }
      
      return "redirect:"+url;
   }
   
   
   /*************************************************
    * �� �󼼺��� ����
    *************************************************/
   
   @GetMapping("/communityDetail")
   public String communityDetail(@ModelAttribute("data") CommunityVO cvo, Model model) {
      log.info("communityDetail ȣ�� ����");
      
      CommunityVO detail = communityService.communityDetail(cvo);
      model.addAttribute("detail", detail);
      
      return "community/client/communityDetail";
   }
   
   /*************************************************
    * ��й�ȣ Ȯ��
    * @param b_num
    * @param b_pwd
    * @return int�� result�� 0�Ǵ� 1�� ������ ���� �ְ�,
    *          String�� result ���� "���� or ����, ��ġ or ����ġ"�� ������ ���� �ִ�.(���� ���ڿ� ����)
    * ���� : @ResponseBody �� ���޵� �並 ���ؼ� ����ϴ� ���� �ƴ϶� HTTP Response Body�� ���� ����ϴ� ���(ajax ��û�� ���)
    *       produces �Ӽ��� ������ �̵�� Ÿ�԰� ���õ� ������ �����ϴµ� ����� ���� ����Ʈ Ÿ���� ����.
    *************************************************/
   
   @ResponseBody
   @RequestMapping(value = "/pwdConfirm", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
   public String pwdConfirm(CommunityVO cvo) {
      log.info("pwdConfirm ȣ�� ����");
      String value = "";
      
      // �Ʒ� �������� �Է� ������ ���� ���°� ����(1 or 0)
      int result = communityService.pwdConfirm(cvo);
      if(result == 1) {
         value="��ġ";
      } else {
         value="����ġ";
      }
      log.info("result = " + result);
      
      return value;
   }
   
   /*************************************************
    * �ۼ��� �� ����ϱ�
    * @param : community_no
    * @return : CommunityVO
    *************************************************/
   @RequestMapping(value="/updateForm")
   public String updateForm(@ModelAttribute("data") CommunityVO cvo, Model model) {
      log.info("updateForm ȣ�� ����");
      log.info("community_no = " + cvo.getCommunity_no());
      
      CommunityVO updateData = communityService.updateForm(cvo);
      
      model.addAttribute("updateData", updateData);
      
      return "community/client/updateForm"; // /WEB-INF/views/board/updateForm.jsp�� �ǹ�
   }
   
   /*************************************************
    * �ۼ��� �����ϱ�
    * @param : CommunityVO
    * ���� : RedirectAttributes ��ü�� ����Ƽ��Ʈ ����(return "redirect:/���")��
    * �ѹ��� ���Ǵ� �����͸� ������ �� �ִ� addFlashAttribute()��� ����� �����Ѵ�.
    * addFlashAttribute() �޼���� ���������� ���۵Ǳ�� ������, URI�󿡴� ������ �ʴ� ������ �������� ���·� ���޵ȴ�.
    *************************************************/
   
   @RequestMapping(value="/communityUpdate", method=RequestMethod.POST)
   public String communityUpdate(@ModelAttribute CommunityVO cvo, RedirectAttributes ras) throws Exception{
      log.info("communityUpdate ȣ�� ����");
      
      int result = 0;
      String url ="";
      
      result = communityService.communityUpdate(cvo);
      ras.addFlashAttribute("data", cvo);
      
      if(result == 1 && cvo.getCommunity_category_no() == 0) {
         url = "/community/client/communityDetail?community_category_no=0"; 
      } else if(result == 1 && cvo.getCommunity_category_no() == 1) {
         url = "/community/client/communityDetail?community_category_no=1"; 
      } else { 
          url = "/community/client/updateForm"; }
      
         /*
          * if(result == 1) { // �Ʒ� url�� ���� �� �� �������� �̵� // url =
          * "/board/boardDetail?b_num="+bvo.getB_num();
          * url="/community/client/communityDetail"; }else { // url =
          * "/board/updateForm?b_num="+bvo.getB_num();
          * url="/community/client/updateForm"; }
          */
      return "redirect:"+url; 
   }
   
   
   /*************************************************
    * �ۻ��� �����ϱ�
    *************************************************/
   @RequestMapping(value = "/communityDelete")
   public String boardDelete(@ModelAttribute CommunityVO cvo, RedirectAttributes ras) throws Exception{
      log.info("communityDelete ȣ�� ����");
      
      // �Ʒ� �������� �Է� ������ ���� ���°� ����ϴ�(1 or 0)
      int result = 0;
      String url = "";
      
      // result = boardService.boardDelete(bvo.getB_num());
      result = communityService.communityDelete(cvo);
      ras.addFlashAttribute("CommunityVO", cvo);
      
      if(result ==1) {
         url="/community/client/communityList";
      } else {
         //url="/board/boardDetail?b_num="+bvo.getB_num();
         url="/community/client/communityDetail";
      }
      return "redirect:"+url;
      
   }
   
   /*************************************************
    * �� ���� �� ��� ���� �����ϱ�
    * @param int
    *************************************************/
   @ResponseBody
   @RequestMapping(value = "/replyCnt")
   public String replyCnt(@RequestParam("community_no") int community_no) {
      log.info("replyCnt ȣ�� ����");
      
      int result = 0;
      result = communityService.replyCnt(community_no);
      
      //return result+"";
      return String.valueOf(result);
   }
   
   
   
   
   
}