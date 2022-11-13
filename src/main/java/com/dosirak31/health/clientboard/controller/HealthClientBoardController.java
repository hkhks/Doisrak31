package com.dosirak31.health.clientboard.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dosirak31.common.vo.PageDTO;
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
public class HealthClientBoardController {

	private HealthBoardService healthBoardService;

	/****************************************************************************
	 * Workout �Խ��� ��ȸ
	 ***************************************************************************/
	@RequestMapping(value = "/hBoardList", method = RequestMethod.GET)
	public String boardList() {

		return "health/client/hBoardList"; // /WEB-INF/views/health/hBoardList.jsp <- Servlet-context.xml���� ������.
	}

	/****************************************************************************
	 * ����Ʈ �Խ��� ����
	 ***************************************************************************/
	@RequestMapping(value = "/weightList", method = RequestMethod.GET)
	public String weightList(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {

		log.info("weightList ȣ�� ����");

		List<HealthBoardVO> weightList = healthBoardService.healthList(hbvo);
		model.addAttribute("weightList", weightList);
		
		//��ü ���ڵ� �� ����
		int total=healthBoardService.boardListCnt(hbvo);
		//����¡ ó��
		model.addAttribute("pageMaker",new PageHealthDTO(hbvo,total));
		
		return "health/client/weightList";
	}

	/****************************************************************************
	 * ����Ʈ � �̹��� �󼼺��� ����
	 ***************************************************************************/
	@RequestMapping(value = "/weightDetail", method = RequestMethod.GET)
	public String weightDetail(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {
		log.info("weightDetail ȣ�� ����");
		// ��ȸ�� ��ȸ
		healthBoardService.healthHit(hbvo);

		HealthBoardVO weightDetail = (HealthBoardVO) healthBoardService.healthDetail(hbvo);
		model.addAttribute("weightDetail", weightDetail);

		return "health/client/weightDetail";
	}
	
	/****************************************************************************
	 * ����� �Խ��� ����
	 ***************************************************************************/
	@RequestMapping(value = "/cardioList", method = RequestMethod.GET)
	public String cardioList(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {

		log.info("cardioList ȣ�� ����");

		List<HealthBoardVO> cardioList = healthBoardService.healthList(hbvo);
		model.addAttribute("cardioList", cardioList);
		
		//��ü ���ڵ� �� ����
	    int total=healthBoardService.boardListCnt(hbvo);
	    //����¡ ó��
	    model.addAttribute("pageMaker",new PageHealthDTO(hbvo,total));
		
		return "health/client/cardioList";
	}
	
	/****************************************************************************
	 * ����� � �̹��� �󼼺��� ����
	 ***************************************************************************/
	@RequestMapping(value = "/cardioDetail", method = RequestMethod.GET)
	public String cardioDetail(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {
		log.info("cardioDetail ȣ�� ����");
		// ��ȸ�� ��ȸ
		healthBoardService.healthHit(hbvo); 
		
		HealthBoardVO cardioDetail = (HealthBoardVO) healthBoardService.healthDetail(hbvo);
		model.addAttribute("cardioDetail", cardioDetail);

		return "health/client/cardioDetail";
	}
}
