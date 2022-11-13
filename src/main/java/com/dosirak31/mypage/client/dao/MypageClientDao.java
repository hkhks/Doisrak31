package com.dosirak31.mypage.client.dao;

import java.util.List;

import com.dosirak31.mypage.client.vo.MypageClientVO;

public interface MypageClientDao {
      
   public List<MypageClientVO> mypageClientList(MypageClientVO mcvo);      // 회원정보
   
   public MypageClientVO mypageClientDetail(MypageClientVO mcvo);         // 회원 정보 상세페이지
   
   public int mypageClientUpdate(MypageClientVO mcvo);                  // 회원정보 수정
   
   public int mypageClientDelete(int client_no);                     // 회원정보 삭제(탈퇴)

   public int mypageCheck(MypageClientVO mcvo);                     // 비밀번호 체크
   
}