package com.dosirak31.hcomment.client.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dosirak31.hcomment.client.dao.HCommentDao;
import com.dosirak31.hcomment.client.vo.HCommentVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class HCommentServiceImpl implements HCommentService{
	
	private HCommentDao hcommentDao;

	@Override
	public List<HCommentVO> selectAll(Integer health_no) {
		
		List<HCommentVO> hvo = hcommentDao.selectAll(health_no);
		
		return hvo; // health_no�� ��ġ�ϴ� ��ü ��ȯ
	}
	
	@Override
	public int delete(HCommentVO hcvo) {
		
		 int deletesu = hcommentDao.delete(hcvo);
	        
		return deletesu; //�����ϰ� �Ϸ�� ���� ���� ��ȯ
	}

	@Override
	public int insert(HCommentVO hvo) {
		
		int insertsu =  hcommentDao.insert(hvo);
		
		return insertsu; //insert�ϰ� �Ϸ�� ���� ���� ��ȯ
	}

	@Override
	public int update(HCommentVO hvo) {
		
		int updatesu = hcommentDao.update(hvo);
		
		return updatesu; // ������Ʈ �� ���� ���� ��ȯ
	}

	/******************************************************
	 * ������������ ��� ��� �ҷ�����
	 *****************************************************/
	@Override
	public List<HCommentVO> select(HCommentVO hvo) {
		
		List<HCommentVO> list = hcommentDao.select(hvo);
		
		return list; // health_no�� ��ġ�ϴ� ��ü ��ȯ
	}
	
	/******************************************************
	 * ������������ ��� ����
	 *****************************************************/
	@Override
	public int deleteadmin(HCommentVO hvo){
		 
		int deletesu = hcommentDao.deleteadmin(hvo);
	        
		return deletesu; //�����ϰ� �Ϸ�� ���� ���� ��ȯ
		
	}

	/******************************************************
	 * ������������ ��� ���� ����
	 *****************************************************/
	@Override
	public int hcommentListCnt(HCommentVO hvo) {
		
		int countNum = 0;
		
		countNum = hcommentDao.hcommentListCnt(hvo);
		
		return countNum;
	}
	

	/******************************************************
	 * ������������ �ｺ ��� ���� �ٿ�ε�
	 *****************************************************/

	@Override
	public List<HCommentVO> hcommentListExcel(HCommentVO hvo) {
		
		List<HCommentVO> hcommentList = null;
		hcommentList = hcommentDao.hcommentListExcel(hvo);
		
		return hcommentList;
	}
	
	


}
