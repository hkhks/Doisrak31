package com.dosirak31.health.adminboard.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.common.vo.PageHealthDTO;
import com.dosirak31.health.board.service.HealthBoardService;
import com.dosirak31.health.board.vo.HealthBoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Log4j
@Controller // HealthBoardController �ν��Ͻ� ������ֱ�.
@RequestMapping("/health/*")
/*
 * ��û URL�� � method�� ó������ mapping���ִ� Annotation�̴�. ��û�� �޴� ������ GET, POST, PATCH,
 * PUT, DELETE �� �����ϱ⵵ �Ѵ�. ����Ʈ�� GET���� �����ȴ�.
 */
@AllArgsConstructor /* ��� �ʵ� ���� �Ķ���ͷ� �޴� �����ڸ� �߰��Ѵ�. */
public class HealthAdminBoardController {

	private HealthBoardService healthBoardService;

	/****************************************************************************
	 * Workout �Խ��� ��ȸ
	 ***************************************************************************/
	@RequestMapping(value = "/admin/hBoardList", method = RequestMethod.GET)
	public String boardList() {

		return "health/admin/hBoardList"; // /WEB-INF/views/health/hBoardList.jsp <- Servlet-context.xml���� ������.
	}

	/****************************************************************************
	 * ����Ʈ �Խ��� ����
	 ***************************************************************************/
	@RequestMapping(value = "/admin/weightList", method = RequestMethod.GET)
	public String weightList(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {

		log.info("weightList ȣ�� ����");

		List<HealthBoardVO> weightList = healthBoardService.healthList(hbvo);
		model.addAttribute("weightList", weightList);
		
		//��ü ���ڵ� �� ����
	    int total=healthBoardService.boardListCnt(hbvo);
	    //����¡ ó��
	    model.addAttribute("pageMaker",new PageHealthDTO(hbvo,total));
		
		return "health/admin/weightList";
	}

	/****************************************************************************
	 * ����Ʈ � �̹��� �󼼺��� ����
	 ***************************************************************************/
	@RequestMapping(value = "/admin/weightDetail", method = RequestMethod.GET)
	public String weightDetail(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {
		log.info("weightDetail ȣ�� ����");
		// ��ȸ�� ��ȸ
		healthBoardService.healthHit(hbvo);

		HealthBoardVO weightDetail = (HealthBoardVO) healthBoardService.healthDetail(hbvo);
		model.addAttribute("weightDetail", weightDetail);

		return "health/admin/weightDetail";
	}
	/****************************************************************************
	 * ����� �Խ��� ����
	 ***************************************************************************/
	@RequestMapping(value = "/admin/cardioList", method = RequestMethod.GET)
	public String cardioList(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {

		log.info("cardioList ȣ�� ����");

		List<HealthBoardVO> cardioList = healthBoardService.healthList(hbvo);
		model.addAttribute("cardioList", cardioList);

		//��ü ���ڵ� �� ����
	    int total=healthBoardService.boardListCnt(hbvo);
	    //����¡ ó��
	    model.addAttribute("pageMaker",new PageHealthDTO(hbvo,total));
		
		return "health/admin/cardioList";
	}
	
	/****************************************************************************
	 * ����� � �̹��� �󼼺��� ����
	 ***************************************************************************/
	@RequestMapping(value = "/admin/cardioDetail", method = RequestMethod.GET)
	public String cardioDetail(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {
		log.info("cardioDetail ȣ�� ����");
		// ��ȸ�� ��ȸ
		healthBoardService.healthHit(hbvo);

		HealthBoardVO cardioDetail = (HealthBoardVO) healthBoardService.healthDetail(hbvo);
		model.addAttribute("cardioDetail", cardioDetail);

		return "health/admin/cardioDetail";
	}
	
	/****************************************************************************	
	 *	�۾��� �� ����ϱ�
	 ***************************************************************************/
	@RequestMapping(value="/admin/healthWriteForm")
	  	public String healthWriteForm() {
	      log.info("healthWriteForm");
	      
	      return "health/admin/healthWriteForm";
	   }
	
	/****************************************************************************	
	 *	�۾��� ����
	 ***************************************************************************/
	   @RequestMapping(value="/admin/healthBoardInsert",method=RequestMethod.POST)
	   
	   public String healthBoardInsert(HealthBoardVO hbvo, Model model) throws Exception{
	      log.info("healthBoardInsert ȣ�� ����");
	      
	      int result=0;
	      String url="";
	      
	      result=healthBoardService.healthBoardInsert(hbvo);
	      if(result==1) {
	    	  if(hbvo.getHealth_category_no()==1) {
	    		  url="/health/admin/weightList?health_category_no="+hbvo.getHealth_category_no();
	    	  } else {
	    		  url="/health/admin/cardioList?health_category_no="+hbvo.getHealth_category_no();
	    	  }	  
	      }else {
	         url="/health/admin/healthWriteForm";
	      }
	      return "redirect:"+url; 
	   }
	   
	   /****************************************************************************	
		 *	������Ʈ �� ȭ������ �̵�
		 ***************************************************************************/
	   @RequestMapping(value="/admin/healthUpdateForm")
	  	public String healthUpdateForm(@ModelAttribute("data") HealthBoardVO hbvo, Model model)  {
	      log.info("healthUpdateForm");
	      
	      HealthBoardVO healthUpdateForm = (HealthBoardVO) healthBoardService.healthDetail(hbvo);
		
	      model.addAttribute("healthUpdate", healthUpdateForm);

			return "health/admin/healthUpdateForm";
	}
	   /****************************************************************************	
		 *	������Ʈ�� ����
		 ***************************************************************************/
		   @RequestMapping(value="/admin/healthUpdate",method=RequestMethod.POST)
		   
		   public String healthUpdate(HealthBoardVO hbvo, Model model) throws Exception{
		      log.info("healthUpdate ȣ�� ����");
		      
		      int result=0;
		      String url="";
		      
		      result=healthBoardService.healthBoardUpdate(hbvo);

		      if(result==1) {
		    	  if(hbvo.getHealth_category_no()==1) {
		    		  if(hbvo.getHealth_category_no()==1) {
			    		  url="/health/admin/weightDetail?health_no="+hbvo.getHealth_no();
			    	  } else {
			    		  url="/health/admin/cardioDetail?health_no="+hbvo.getHealth_no();
			    	  }	 

		    	  } else {
		    		  url="/health/admin/cardioDetail?health_no="+hbvo.getHealth_no();
		    	  }	         
		      }else {
		         url="/health/admin/healthWriteForm";
		      }
		      return "redirect:"+url; 
		   }
		    
	   /****************************************************************************	
		 *	�� ���� �����ϱ�
		 ***************************************************************************/
	   @RequestMapping(value="/admin/healthBoardDelete")
	   public String weightBoardDelete(@ModelAttribute HealthBoardVO hbvo, RedirectAttributes ras) throws Exception{
	      log.info("weightBoardDelete ȣ�� ����");

	      int result=0;
	      String url="";
	      
	      result=healthBoardService.healthBoardDelete(hbvo);
	      ras.addFlashAttribute("healthBoardVO",hbvo);
	      
	      if(result==1) {
	    	  if(hbvo.getHealth_category_no()==1) {
	    		  url="/health/admin/weightList?health_category_no="+hbvo.getHealth_category_no();
	    	  } else {
	    		  url="/health/admin/cardioList?health_category_no="+hbvo.getHealth_category_no();
	    	  }	         
	      }else {
	    	  if(hbvo.getHealth_category_no()==1) {
	    		  url="/health/admin/weightDetail?health_no="+hbvo.getHealth_no();
	    	  } else {
	    		  url="/health/admin/cardioDetail?health_no="+hbvo.getHealth_no();
	    	  }	 
	      }
	      return "redirect:"+url; 
	   }
}
