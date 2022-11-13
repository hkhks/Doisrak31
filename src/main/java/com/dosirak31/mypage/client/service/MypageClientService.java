package com.dosirak31.mypage.client.service;

import java.util.List;

import com.dosirak31.mypage.client.vo.MypageClientVO;

public interface MypageClientService {
   
   public List<MypageClientVO> mypageClientList(MypageClientVO mcvo);      // 회원정보
   
   public MypageClientVO mypageClientDetail(MypageClientVO mcvo);         // 회원 정보 상세페이지
   
   public int mypageClientUpdate(MypageClientVO mcvo);                  // 회원정보 수정
   
   public MypageClientVO cUpdateForm(MypageClientVO mcvo);               // 수정 폼
   
   public int mypageClientDelete(MypageClientVO client_no);            // 회원정보 삭제(탈퇴)

   public MypageClientVO mypageCheckForm(MypageClientVO mcvo);            // 비밀번호 체크 폼
   
   public int mypageCheck(MypageClientVO mcvo);                     // 비밀번호 체크
   
   
   
}