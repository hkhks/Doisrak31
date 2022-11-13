package com.dosirak31.admin.adminPage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dosirak31.admin.adminPage.dao.AdminPageDao;
import com.dosirak31.admin.adminPage.vo.MemberGraphDTO;
import com.dosirak31.food.order.vo.OrderDetailVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminPageServiceImpl implements AdminPageService {
	
	private AdminPageDao adminPageDao;
	
	@Override
	public List<OrderDetailVO> memberList(OrderDetailVO cvo) {
		List<OrderDetailVO> memberList=adminPageDao.memberList(cvo);
		return memberList;
	}
	
	@Override
	public int memberListCnt(OrderDetailVO cvo) {
		
		return adminPageDao.memberListCnt(cvo);
	}
	
	@Override
	public MemberGraphDTO ageGraph() {
		MemberGraphDTO ageGraph=adminPageDao.ageGraph();
		return ageGraph; 
	}
	
	@Override
	public MemberGraphDTO genderGraph() {
		MemberGraphDTO genderGraph=adminPageDao.genderGraph();
		return genderGraph;
	}
	
	@Override
	public MemberGraphDTO countMember() {
		MemberGraphDTO countMember=adminPageDao.countMember();
		return countMember;
	}
	
	@Override
	public List<OrderDetailVO> memberListExcel(OrderDetailVO cvo) {
		
		List<OrderDetailVO> memberList = adminPageDao.memberListExcel(cvo);
		
		return memberList;
	}

}
