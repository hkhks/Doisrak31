package com.dosirak31.mypage.client.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.mypage.client.dao.MypageClientDao;
import com.dosirak31.mypage.client.vo.MypageClientVO;

import lombok.Setter;

@Service
public class MypageClientServiceImpl implements MypageClientService {
   
   @Setter(onMethod_ = @Autowired)
   private MypageClientDao mypageClientDao;
   
   // ȸ������
   @Override
   public List<MypageClientVO> mypageClientList(MypageClientVO mcvo) {
      List<MypageClientVO> list = null;
      list = mypageClientDao.mypageClientList(mcvo);
      return list;
   }
   
   // ȸ������ ������
   @Override
   public MypageClientVO mypageClientDetail(MypageClientVO mcvo) {
      MypageClientVO detail = null;
      
      detail = mypageClientDao.mypageClientDetail(mcvo);
      return detail;
   }
   
   // ȸ������ ����
   @Override
   public int mypageClientUpdate(MypageClientVO mcvo) {
      int result = 0;
      result = mypageClientDao.mypageClientUpdate(mcvo);
      return result;
   }
   
   // ȸ������ ������
   @Override
   public MypageClientVO cUpdateForm(MypageClientVO mcvo) {
      MypageClientVO detail = null;
      detail = mypageClientDao.mypageClientDetail(mcvo);
      return detail;
   }
   
   // ȸ������ ����
   @Override
   public int mypageClientDelete(MypageClientVO mcvo) {
      int result =0;
      result = mypageClientDao.mypageClientDelete(mcvo.getClient_no());
      return result;
   }

   // ��й�ȣ üũ
   @Override
   public int mypageCheck(MypageClientVO mcvo) {
      int result = 0;
      result = mypageClientDao.mypageCheck(mcvo);
      return result;
   }
   
   // ��й�ȣ üũ ��
   @Override
   public MypageClientVO mypageCheckForm(MypageClientVO mcvo) {
      MypageClientVO detail = null;
      detail = mypageClientDao.mypageClientDetail(mcvo);
      return detail;
   }
}