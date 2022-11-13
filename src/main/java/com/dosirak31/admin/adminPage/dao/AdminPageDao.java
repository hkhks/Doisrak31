package com.dosirak31.admin.adminPage.dao;

import java.util.List;

import com.dosirak31.admin.adminPage.vo.MemberGraphDTO;
import com.dosirak31.food.order.vo.OrderDetailVO;

public interface AdminPageDao {
	public List<OrderDetailVO> memberList(OrderDetailVO cvo);//ȸ�� ��� ��ȸ�ؿ���
	public int memberListCnt(OrderDetailVO cvo);//����¡ó���� ���� list����
	public MemberGraphDTO ageGraph();//ȸ�� ����
	public MemberGraphDTO genderGraph();//ȸ�� ����
	public MemberGraphDTO countMember();//���� ȸ�������� ��
	
	public List<OrderDetailVO> memberListExcel(OrderDetailVO cvo);
}
