package com.dosirak31.food.review.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.common.vo.PageDTO;
import com.dosirak31.food.review.service.FoodReviewService;
import com.dosirak31.food.review.vo.FoodReviewVO;
import com.dosirak31.mypage.review.vo.MypageReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@RequestMapping(value="/foodReview/client/*")
@Controller
public class FoodReviewController {
	
	private FoodReviewService foodReviewService;
	

	
	
	@RequestMapping(value = "/foodReviewList", method = RequestMethod.GET)
	public String foodReviewList(@ModelAttribute FoodReviewVO rvo, Model model) {
		log.info("foodReviewList �샇異� �꽦怨�");
		
		List<FoodReviewVO> foodReviewList = foodReviewService.foodReviewList(rvo);
		model.addAttribute("foodReviewList", foodReviewList);
		
		
		int total = foodReviewService.foodReviewListCnt(rvo);
		
		model.addAttribute("pageMaker", new PageDTO(rvo, total));
		
		return "foodReview/client/foodReviewList";
	}
	
	@RequestMapping(value = "/foodNoClientReviewList", method = RequestMethod.GET)
	public String foodNoClientReviewList(@ModelAttribute FoodReviewVO rvo, Model model) {
		log.info("foodReviewList �샇異� �꽦怨�");
		
		List<FoodReviewVO> foodReviewList = foodReviewService.foodReviewList(rvo);
		model.addAttribute("foodReviewList", foodReviewList);
		
		
		int total = foodReviewService.foodReviewListCnt(rvo);
		
		model.addAttribute("pageMaker", new PageDTO(rvo, total));
		
		return "foodReview/noclient/foodReviewList";
	}
	
	
	
	@RequestMapping(value = "/writeForm",method=RequestMethod.GET)
	public String writeForm(@ModelAttribute("data") MypageReviewVO mrvo) {
		log.info("writeForm ");
		return "foodReview/client/writeForm";
	}
	
	
	@RequestMapping(value = "/foodReviewInsert", method=RequestMethod.POST)
	public String foodReviewInsert(FoodReviewVO rvo, Model model) throws Exception {
		log.info("foodReviewInsert ");
		int result=0;
		String url ="";
		
		result = foodReviewService.foodReviewInsert(rvo);
		if(result == 1) {
			url = "/foodReview/client/foodReviewList";
		} else {
			url = "/foodReview/client/foodReviewInsert";
		}
		return "redirect:"+url;
	}
	
	
	@RequestMapping(value="/updateForm")
	public String updateForm(@ModelAttribute("data") FoodReviewVO rvo, Model model) {
		log.info("updateForm �샇異� �꽦怨�");
		log.info("review_no = " + rvo.getReview_no());
		
		FoodReviewVO updateData = foodReviewService.updateForm(rvo);
		model.addAttribute("updateData", updateData);
		return "foodReview/client/updateForm";
	}
	
	
	@RequestMapping(value="/foodReviewUpdate", method=RequestMethod.POST)
	public String foodReviewUpdate(@ModelAttribute FoodReviewVO rvo, RedirectAttributes ras) {
		log.info("foodReviewUpdate �샇異� �꽦怨�");
		int result = 0;
		String url ="";
		
		result = foodReviewService.foodReviewUpdate(rvo);
		ras.addFlashAttribute("data", rvo);
		
		if(result ==1) {
			url = "/foodReview/client/foodReviewList";
		} else {
			url = "/foodReview/client/updateForm"; 
		}
		return "redirect:"+url;
	}
	
	
	@RequestMapping(value = "/foodReviewDelete")
	public String foodReviewDelete(@ModelAttribute FoodReviewVO rvo, RedirectAttributes ras) {
		log.info("foodReviewDelete ");
		int result = 0;
		String url = "";
		
		result = foodReviewService.foodReviewDelete(rvo);
		ras.addFlashAttribute("foodReviewVO", rvo);
		
		if(result ==1) {
			url="/foodReview/client/foodReviewList";
		} else {
			url ="/foodReview/client/foodReviewList";
		}
		return "redirect:"+url;
	}
	
	
	@RequestMapping(value = "/foodReviewDetail", method=RequestMethod.GET)
	public String foodReviewDetail(@ModelAttribute("data") FoodReviewVO rvo, Model model) {
		log.info("foodReviewDetail");
		
		FoodReviewVO detail = foodReviewService.foodReviewDetail(rvo);
		model.addAttribute("detail", detail);
		return "foodReview/client/foodReviewDetail";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
