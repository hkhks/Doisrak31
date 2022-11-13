package com.dosirak31.food.order.dao;

import java.util.List;

import com.dosirak31.food.order.vo.OrderDetailVO;
import com.dosirak31.food.order.vo.OrderGraphDTO;

public interface FoodOrderDao {
	public int bagInsert(OrderDetailVO odv);//장바구니에 insert
	public List<OrderDetailVO> bagList(int client_no);//장바구니로 이동하기.select해오기
	public int bagUpdate(OrderDetailVO odv);//수량 수정 및 주문으로 변경
	public int bagDelete1(int dosirak_no);//도시락만 삭제
	public int bagOrderNo(int order_no);//주문상세번호 몇개인지 조회
	public int bagDelete2(int order_no);////주문상세없으면 주문테이블도 삭제
	public int orderInsert(OrderDetailVO odv);//주문에 insert
	public OrderDetailVO orderList(OrderDetailVO odv);//주문번호 select
	public int paymentInsert(OrderDetailVO odv);//결제테이블 insert
	public int orderUpdate(OrderDetailVO odv);//주문 상태 및 배달 정보 update);//결제테이블 insert
	
	public List<OrderDetailVO> orderhistory(OrderDetailVO odv);//주문내역 관리자페이지에 조회
	public int orderListCnt(OrderDetailVO odv);//페이징처리를 위한 list개수 
	
	public List<OrderDetailVO> orderDetailHistory(int order_no);//주문 상세 내용
	public int orderDelivery(OrderDetailVO odv);//배달 버튼-발송
	public int paymentDelete(OrderDetailVO odv);//결제취소버튼
	
	public OrderGraphDTO orderBeforeWeek();//지난주 매출
	public OrderGraphDTO orderCurrentWeek();//이번주 매출
	public OrderGraphDTO orderMonth();//오늘,지난달,이번달 매출
}
