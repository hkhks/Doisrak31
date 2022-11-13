package com.dosirak31.mypage.client.service;

import java.util.List;

import com.dosirak31.mypage.client.vo.MypageClientVO;

public interface MypageClientService {
   
   public List<MypageClientVO> mypageClientList(MypageClientVO mcvo);      // ȸ������
   
   public MypageClientVO mypageClientDetail(MypageClientVO mcvo);         // ȸ�� ���� ��������
   
   public int mypageClientUpdate(MypageClientVO mcvo);                  // ȸ������ ����
   
   public MypageClientVO cUpdateForm(MypageClientVO mcvo);               // ���� ��
   
   public int mypageClientDelete(MypageClientVO client_no);            // ȸ������ ����(Ż��)

   public MypageClientVO mypageCheckForm(MypageClientVO mcvo);            // ��й�ȣ üũ ��
   
   public int mypageCheck(MypageClientVO mcvo);                     // ��й�ȣ üũ
   
   
   
}