package com.dosirak31.client.reply.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
   private int reply_no = 0;         //댓글번호
   private int community_no = 0;      //게시판 글번호
   private String client_id ="";      //댓글 작성자
   private String admin_id ="";      //댓글 작성자
   private String reply_contents ="";   //댓글 내용
   private String reply_date;         //댓글 작성일 ( 클라이언트로부터 날짜 받아오려면 타입 date)
   private String reply_pw = "";      //댓글 비밀번호
   private String reply_update = "";   //댓글 수정일
}