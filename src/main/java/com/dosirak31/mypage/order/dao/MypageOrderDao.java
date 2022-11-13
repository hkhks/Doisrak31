package com.dosirak31.mypage.order.dao;

import java.util.List;

import com.dosirak31.food.order.vo.OrderDetailVO;
import com.dosirak31.mypage.order.vo.MypageOrderVO;

public interface MypageOrderDao {
   public List<OrderDetailVO> mypageOrderList(OrderDetailVO odv);
   
   public int mypageOrderDelete(int order_no);
   
   public int mypageOrderListCnt(OrderDetailVO odv);
}