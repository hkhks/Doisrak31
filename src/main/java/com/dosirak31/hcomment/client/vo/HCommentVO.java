package com.dosirak31.hcomment.client.vo;

import com.dosirak31.common.vo.CommonVO;

import lombok.Data;

@Data
public class HCommentVO extends CommonVO{
	
	private Integer health_comment_no; // 댓글번호
	private Integer health_no;	//	헬스 게시물 번호
	private Integer parent_health_comment_no;	// 대댓글 번호
	private String health_comment_contents;	//	내용
	private String client_id;	//	작성자
	private String reg_date; // 등록날짜
	private String up_date; // 수정날짜
	
	private String health_title = "";
	
}
