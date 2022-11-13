package com.dosirak31.hcomment.client.dao;

import java.util.List;

import com.dosirak31.common.vo.CommonVO;
import com.dosirak31.hcomment.client.vo.HCommentVO;

public interface HCommentDao {
	
	 	public List<HCommentVO> selectAll(Integer health_no);

		public int delete(HCommentVO hcvo);
		
		public int insert(HCommentVO hvo);

		public int update(HCommentVO hvo);
		
		public int hcommentListCnt(HCommentVO hvo);	//��ü ��� �� ��ȸ

		public List<HCommentVO> select(HCommentVO hvo); // ��ü ��� ��������
		
		public int deleteadmin(HCommentVO hvo); // ������ ��� ����
		
		public List<HCommentVO> hcommentListExcel(HCommentVO hvo); //�ｺ ��� ���� �ٿ�ε� 
		
		
							
}
