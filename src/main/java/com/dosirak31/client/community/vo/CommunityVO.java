package com.dosirak31.client.community.vo;

import org.springframework.web.multipart.MultipartFile;

import com.dosirak31.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class CommunityVO extends CommonVO{
	
	private int community_no;	//게시글일련번호 not null 시퀀스 처리
	private String client_id;		//회원일련번호 	null
	private String admin_id;		//관리자 아이디 null
	private String community_title;	//게시글제목  not null
	private String community_pw;	//게시글비밀번호 null
	private String community_date;	//작성일시 
	private int community_notify = 0;	//공지여부
	private int community_hits = 0;		//조회수
	private int community_closed = 0;	//비공개여부
	private String community_contents;	//게시글내용
	private int community_category_no=0;	//게시판카테고리일련번호
	private String community_update;	//게시판 수정일시
	private int reply_cnt = 0;		//댓글개수
	
	private MultipartFile file; // 파일 업로드를 위한 필드
	private String file_name = "";			//실제서버에 저장할 파일명
	private String file_thumb = ""; // 실제서버에 저장할 썸네일 이미지 파일명
	
}
