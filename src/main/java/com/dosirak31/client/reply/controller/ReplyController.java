package com.dosirak31.client.reply.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dosirak31.client.community.vo.CommunityVO;
import com.dosirak31.client.reply.service.ReplyService;
import com.dosirak31.client.reply.vo.ReplyVO;
import com.dosirak31.client.signup.vo.ClientVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/client")
@AllArgsConstructor
@Log4j
@RestController
public class ReplyController {
	
	
	private ReplyService replyService;
	
	
	/***************************************************************************************
	 * 댓글 글목록 구현하기
	***************************************************************************************/
	
	@GetMapping(value = "/all/{community_no}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<ReplyVO> replyList(@PathVariable("community_no") Integer community_no){
		log.info("list 호출 성공");
		
		List<ReplyVO> entity = null;
		entity = replyService.replyList(community_no);
		
		return entity;
	}
	
	
	/***************************************************************************************
	 * 댓글 입력 구현하기
	***************************************************************************************/
	 @PostMapping(value = "/replyInsert", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
		public String replyList(@RequestBody ReplyVO rvo){
			log.info("list 호출 성공");
			log.info("ReplyVO : " + rvo);
			int result = 0;
			
			result = replyService.replyInsert(rvo);
			return (result==1) ? "SUCCESS": "FAILURE";
		}
	
	
	 /***************************************************************************************
	  * 댓글 수정 구현하기
	  **************************************************************************************/
	 @PutMapping(value = "/{reply_no}", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	    public String replyUpdate(@PathVariable("reply_no") Integer reply_no, @RequestBody ReplyVO rvo) {
	    	log.info("replyUpdate 호출 성공");
	    	
	    	rvo.setReply_no(reply_no);
	    	int result = replyService.replyUpdate(rvo);
	    	return (result == 1) ? "SUCCESS" : "FAILURE";
	    }
	
	
	 /***************************************************************************************
	  * 댓글 삭제 구현하기
	  **************************************************************************************/
	 @DeleteMapping(value = "/{reply_no}", produces = MediaType.TEXT_PLAIN_VALUE)
	    public String replyDelete(@PathVariable("reply_no") int reply_no) {
	    	log.info("replyDelete 호출 성공");
	    	log.info("reply_no = " + reply_no);
	    	
	    	int result = replyService.replyDelete(reply_no);
	    	return (result == 1) ? "SUCCESS" : "FAILURE";
	    }

}
