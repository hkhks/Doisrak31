package com.dosirak31.food.order.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dosirak31.food.order.dao.FoodOrderDao;
import com.dosirak31.food.order.vo.OrderDetailVO;
import com.dosirak31.food.order.vo.OrderGraphDTO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class FoodOrderServiceImpl implements FoodOrderService {

	private FoodOrderDao foodOrderDao;
	//��ٱ��Ͽ� �Է�
	@Override
	public int bagInsert(OrderDetailVO odv) {
		int result=foodOrderDao.bagInsert(odv);
		return result;
	}
	//��ٱ��� ��ȸ
	@Override
	public List<OrderDetailVO> bagList(int client_no) {
		List<OrderDetailVO> bagList=foodOrderDao.bagList(client_no);
		return bagList;
	}
	//���ö��� ����
	@Override
	public int bagDelete1(int dosirak_no) {
		int result=0;
		result=foodOrderDao.bagDelete1(dosirak_no);
		return result;
	}
	//�ֹ��󼼾����� �ֹ����̺� ����
	@Override
	public int bagDelete2(int order_no) {
		int result=0;
		result=foodOrderDao.bagDelete2(order_no);
		return result;
	}
	
	//�ֹ������̺� �ֹ���ȣ�� �����	
	@Override
	public int bagOrderNo(int order_no) {
		int result=0;
		result=foodOrderDao.bagOrderNo(order_no);
		return result;
	}
	//��ٱ��� ���� ����
	@Override
	public int bagUpdate(OrderDetailVO odv) {
		int result=0;
		result=foodOrderDao.bagUpdate(odv);
		return result;
	}
	/*������ 2������ �ֹ� insert*/
	@Override
	public int orderInsert(OrderDetailVO odv) {
		int result=foodOrderDao.orderInsert(odv);
		return result;
	}
	/*���� 2������ �ֹ� �� �� insert�� select��ȸ*/
	@Override
	public OrderDetailVO orderList(OrderDetailVO odv) {
		OrderDetailVO orderList=foodOrderDao.orderList(odv);
		return orderList;
	}
	@Override
	public int paymentInsert(OrderDetailVO odv) {
		
		return foodOrderDao.paymentInsert(odv);
	}
	@Override
	public int orderUpdate(OrderDetailVO odv) {
		return foodOrderDao.orderUpdate(odv);
	}
	@Override
	public List<OrderDetailVO> orderhistory(OrderDetailVO odv) {
		List<OrderDetailVO> orderhistory=foodOrderDao.orderhistory(odv);
		return orderhistory;
	}
	@Override
	public int orderListCnt(OrderDetailVO odv) {
		return foodOrderDao.orderListCnt(odv);
	}
	@Override
	public List<OrderDetailVO> orderDetailHistory(int order_no) {
		 List<OrderDetailVO> orderDetailHistory= foodOrderDao.orderDetailHistory(order_no);
		return orderDetailHistory;
	}
	@Override
	public int orderDelivery(OrderDetailVO odv) {
		int result=foodOrderDao.orderDelivery(odv);//��� ��ư-�߼�
		return result;
	}
	
	@Override
	public int paymentDelete(OrderDetailVO odv) {
		int result=foodOrderDao.paymentDelete(odv);//��� ��ư-�߼�
		return result;
	}
	
	@Override
	public OrderGraphDTO orderBeforeWeek() {
		OrderGraphDTO orderBeforeWeek= foodOrderDao.orderBeforeWeek();
		return orderBeforeWeek;
	}
	@Override
	public OrderGraphDTO orderCurrentWeek() {
		OrderGraphDTO orderCurrentWeek=foodOrderDao.orderCurrentWeek();
		return orderCurrentWeek;
	}
	@Override
	public OrderGraphDTO orderMonth() {
		OrderGraphDTO orderMonth=foodOrderDao.orderMonth();
		return orderMonth;
	}

}
