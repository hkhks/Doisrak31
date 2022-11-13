package com.dosirak31.mypage.client.dao;

import java.util.List;

import com.dosirak31.mypage.client.vo.MypageClientVO;

public interface MypageClientDao {
      
   public List<MypageClientVO> mypageClientList(MypageClientVO mcvo);      // ȸ������
   
   public MypageClientVO mypageClientDetail(MypageClientVO mcvo);         // ȸ�� ���� ��������
   
   public int mypageClientUpdate(MypageClientVO mcvo);                  // ȸ������ ����
   
   public int mypageClientDelete(int client_no);                     // ȸ������ ����(Ż��)

   public int mypageCheck(MypageClientVO mcvo);                     // ��й�ȣ üũ
   
}