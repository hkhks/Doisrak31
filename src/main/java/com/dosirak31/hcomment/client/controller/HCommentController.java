package com.dosirak31.hcomment.client.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dosirak31.hcomment.client.service.HCommentService;
import com.dosirak31.hcomment.client.vo.HCommentVO;
import com.dosirak31.login.client.vo.ClientLoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/hreplies/*")
@Log4j
@AllArgsConstructor
public class HCommentController {

	private HCommentService hcommentService;
	
	@GetMapping("/hcomment")
	public String go() {
		
		return "hcomment/hcomment";
	}
	
	//지정된 게시물의 모든 댓글을 가져오는 메서드
	 @ResponseBody
	 @GetMapping(value = "/comments/{health_no}", produces = MediaType.APPLICATION_JSON_VALUE)  // /comments/health_no=1 GET방식 <- 쿼리스트링으로 오는 것은 PathVariable생략 가능
	    public ResponseEntity<List<HCommentVO>> list(@PathVariable Integer health_no) {
		 
	        List<HCommentVO> list = null;
	        
	        try {
	        	
	            list = hcommentService.selectAll(health_no);
	            
	            return new ResponseEntity<List<HCommentVO>>(list, HttpStatus.OK);  // 200
	        
	        } catch (Exception e) {
	        	
	            e.printStackTrace();
	            
	            return new ResponseEntity<List<HCommentVO>>(HttpStatus.BAD_REQUEST); // 400,값을 안보내면 null이 감
	        }
	    }
	

		// 지정된 댓글을 삭제하는 메서드
		@DeleteMapping("/comments/{health_comment_no}")   
		public ResponseEntity<String> remove(@PathVariable Integer health_comment_no, Integer health_no, HttpSession session) {
			
			ClientLoginVO client_info = (ClientLoginVO)session.getAttribute("client_info"); 
		    
		
			HCommentVO hvo = new HCommentVO();
			
			hvo.setHealth_comment_no(health_comment_no);
			hvo.setClient_id(client_info.getClient_id()); 
			
				try {	
						int rowCnt = hcommentService.delete(hvo);

						if(rowCnt!=1)
							
							throw new Exception("Delete Failed");

						return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
						
				} catch (Exception e) {
					
						e.printStackTrace();
						
						return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
				}
		}
		

		 // 댓글을 등록하는 메서드
		    @PostMapping(value ="/comments", consumes="application/json")  
		    public ResponseEntity<String> write(@RequestBody HCommentVO hvo, HttpSession session) {
		    	
		    	ClientLoginVO client_info = (ClientLoginVO)session.getAttribute("client_info"); 
		        hvo.setClient_id(client_info.getClient_id());
		        
		        System.out.println("hvo = " + hvo); // 내용+헬스게시글 번호, 부모댓글 번호는 null
		        									// 내용+헬스게시글 번호, 부모댓글 번호 

		        try {
		            if(hcommentService.insert(hvo)!=1)
		                throw new Exception("댓글 등록을 실패하였습니다.");
		           
		            return new ResponseEntity<>("WRT_OK", HttpStatus.OK);
		        
		        } catch (Exception e) {
		            e.printStackTrace();
		            
		            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
		        }
		    }
		    
		    // 댓글을 수정하는 메서드
		    @PatchMapping(value= "/comments/{health_comment_no}", consumes = "application/json") 
		    public ResponseEntity<String> modify(@PathVariable int health_comment_no, @RequestBody HCommentVO hvo,HttpSession session) {
		    
		    	ClientLoginVO client_info = (ClientLoginVO)session.getAttribute("client_info"); 
		       
		    	
		        hvo.setClient_id(client_info.getClient_id());
		        hvo.setHealth_comment_no(health_comment_no);
		        
		        System.out.println("hvo = " + hvo);

		        try {
		            if(hcommentService.update(hvo)!=1)
		                throw new Exception("Write failed.");

		            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
		        }
		    }
		    
		    
		    
}

