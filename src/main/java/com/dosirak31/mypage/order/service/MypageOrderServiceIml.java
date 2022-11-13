package com.dosirak31.mypage.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.common.file.FileUploadUtil;
import com.dosirak31.food.order.vo.OrderDetailVO;
import com.dosirak31.mypage.order.dao.MypageOrderDao;
import com.dosirak31.mypage.order.vo.MypageOrderVO;

import lombok.Setter;

@Service
public class MypageOrderServiceIml implements MypageOrderService {
   
   @Setter(onMethod_ = @Autowired)
   private MypageOrderDao mypageOrderDao;
   
   
   @Override
   public List<OrderDetailVO> mypageOrderList(OrderDetailVO odv) {
      List<OrderDetailVO> list = null;
      list = mypageOrderDao.mypageOrderList(odv);
      return list;
   }
   
   
   @Override
   public int mypageOrderListCnt(OrderDetailVO odv) {
      return mypageOrderDao.mypageOrderListCnt(odv);
   }

   @Override
   public int mypageOrderDelete(OrderDetailVO odv) {
      int result= 0;
      result = mypageOrderDao.mypageOrderDelete(odv.getOrder_no());
      return result;
   }

}