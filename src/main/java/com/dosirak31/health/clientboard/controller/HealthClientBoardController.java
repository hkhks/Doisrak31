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
@Controller // HealthBoardController 인스턴스 만들어주기.
@RequestMapping("/health/*")
/*
 * 요청 URL을 어떤 method가 처리할지 mapping해주는 Annotation이다. 요청을 받는 형식인 GET, POST, PATCH,
 * PUT, DELETE 를 정의하기도 한다. 디폴트는 GET으로 설정된다.
 */ 
@AllArgsConstructor /* 모든 필드 값을 파라미터로 받는 생성자를 추가한다. */
public class HealthClientBoardController {

	private HealthBoardService healthBoardService;

	/****************************************************************************
	 * Workout 게시판 조회
	 ***************************************************************************/
	@RequestMapping(value = "/hBoardList", method = RequestMethod.GET)
	public String boardList() {

		return "health/client/hBoardList"; // /WEB-INF/views/health/hBoardList.jsp <- Servlet-context.xml에서 설정함.
	}

	/****************************************************************************
	 * 웨이트 게시판 구현
	 ***************************************************************************/
	@RequestMapping(value = "/weightList", method = RequestMethod.GET)
	public String weightList(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {

		log.info("weightList 호출 성공");

		List<HealthBoardVO> weightList = healthBoardService.healthList(hbvo);
		model.addAttribute("weightList", weightList);
		
		//전체 레코드 수 구현
		int total=healthBoardService.boardListCnt(hbvo);
		//페이징 처리
		model.addAttribute("pageMaker",new PageHealthDTO(hbvo,total));
		
		return "health/client/weightList";
	}

	/****************************************************************************
	 * 웨이트 운동 이미지 상세보기 구현
	 ***************************************************************************/
	@RequestMapping(value = "/weightDetail", method = RequestMethod.GET)
	public String weightDetail(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {
		log.info("weightDetail 호출 성공");
		// 조회수 조회
		healthBoardService.healthHit(hbvo);

		HealthBoardVO weightDetail = (HealthBoardVO) healthBoardService.healthDetail(hbvo);
		model.addAttribute("weightDetail", weightDetail);

		return "health/client/weightDetail";
	}
	
	/****************************************************************************
	 * 유산소 게시판 구현
	 ***************************************************************************/
	@RequestMapping(value = "/cardioList", method = RequestMethod.GET)
	public String cardioList(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {

		log.info("cardioList 호출 성공");

		List<HealthBoardVO> cardioList = healthBoardService.healthList(hbvo);
		model.addAttribute("cardioList", cardioList);
		
		//전체 레코드 수 구현
	    int total=healthBoardService.boardListCnt(hbvo);
	    //페이징 처리
	    model.addAttribute("pageMaker",new PageHealthDTO(hbvo,total));
		
		return "health/client/cardioList";
	}
	
	/****************************************************************************
	 * 유산소 운동 이미지 상세보기 구현
	 ***************************************************************************/
	@RequestMapping(value = "/cardioDetail", method = RequestMethod.GET)
	public String cardioDetail(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {
		log.info("cardioDetail 호출 성공");
		// 조회수 조회
		healthBoardService.healthHit(hbvo); 
		
		HealthBoardVO cardioDetail = (HealthBoardVO) healthBoardService.healthDetail(hbvo);
		model.addAttribute("cardioDetail", cardioDetail);

		return "health/client/cardioDetail";
	}
}
