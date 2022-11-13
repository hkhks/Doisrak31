package com.dosirak31.admin.adminPage.service;


import java.util.List;

import com.dosirak31.admin.adminPage.vo.MemberGraphDTO;
import com.dosirak31.food.order.vo.OrderDetailVO;

public interface AdminPageService {
	public List<OrderDetailVO> memberList(OrderDetailVO cvo);//회원 목록 조회해오기
	public int memberListCnt(OrderDetailVO cvo);//페이징처리를 위한 list개수 
	public MemberGraphDTO ageGraph();//회원 나이
	public MemberGraphDTO genderGraph();//회원 성별
	public MemberGraphDTO countMember();//오늘 회원가입한 수
	
	public List<OrderDetailVO> memberListExcel(OrderDetailVO cvo);
}
