package com.dosirak31.mypage.order.service;

import java.util.List;

import com.dosirak31.food.order.vo.OrderDetailVO;
import com.dosirak31.mypage.order.vo.MypageOrderVO;

public interface MypageOrderService {
   
      public List<OrderDetailVO> mypageOrderList(OrderDetailVO odv);
      
      public int mypageOrderDelete(OrderDetailVO order_no);
      
      public int mypageOrderListCnt(OrderDetailVO odv);
}