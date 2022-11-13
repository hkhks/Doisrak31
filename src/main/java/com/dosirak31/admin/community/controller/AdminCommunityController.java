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
    * �� ��� �����ϱ�
    *************************************/
   
   @RequestMapping(value = "/communityList", method = RequestMethod.GET)
   public String communityList(CommunityVO cvo, Model model) {
      log.info("admin communityList ȣ�� ����");
      
      List<CommunityVO> communityList = adminCommunityService.communityList(cvo);
      model.addAttribute("communityList", communityList);
      
      //��ü ���ڵ� �� ����
      int total = adminCommunityService.communityListCnt(cvo);
      model.addAttribute("pageMaker", new PageDTO(cvo, total));
      
      int count = total - (cvo.getPageNum()-1) * cvo.getAmount();
      model.addAttribute("count", count);
      
      return "community/admin/communityList";
   }
   
   /*************************************************
    * �۾��� �� ����ϱ�
    *************************************************/
   
   @RequestMapping(value = "/writeForm")
   public String writeForm() {
      log.info("writeForm ȣ�� ����");
      
      return "community/admin/writeForm";
   }
   
   /*************************************************
    * �۾��� �����ϱ�
    *************************************************/
   @PostMapping("/communityInsert")
   public String communityInsert(CommunityVO cvo, Model model) throws Exception{
      log.info("communityInsert ȣ�� ����");
      
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
    * �� �󼼺��� ����
    *************************************************/
   
   @GetMapping("/communityDetail")
   public String communityDetail(@ModelAttribute("data") CommunityVO cvo, Model model) {
      log.info("communityDetail ȣ�� ����");
      
      CommunityVO detail = adminCommunityService.communityDetail(cvo);
      model.addAttribute("detail", detail);
      
      return "community/admin/communityDetail";
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
      int result = adminCommunityService.pwdConfirm(cvo);
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
      
      CommunityVO updateData = adminCommunityService.updateForm(cvo);
      
      model.addAttribute("updateData", updateData);
      return "community/admin/updateForm"; // /WEB-INF/views/board/updateForm.jsp�� �ǹ�
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
    * �ۻ��� �����ϱ�
    *************************************************/
   @RequestMapping(value = "/communityDelete")
   public String boardDelete(@ModelAttribute CommunityVO cvo, RedirectAttributes ras) throws Exception{
      log.info("communityDelete ȣ�� ����");
      
      // �Ʒ� �������� �Է� ������ ���� ���°� ����ϴ�(1 or 0)
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
    * �� ���� �� ��� ���� �����ϱ�
    * @param int
    *************************************************/
   @ResponseBody
   @RequestMapping(value = "/replyCnt")
   public String replyCnt(@RequestParam("community_no") int community_no) {
      log.info("replyCnt ȣ�� ����");
      
      int result = 0;
      result = adminCommunityService.replyCnt(community_no);
      
      //return result+"";
      return String.valueOf(result);
   }

}