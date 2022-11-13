package com.dosirak31.hcomment.client.service;

import java.util.List;

import com.dosirak31.hcomment.client.vo.HCommentVO;

public interface HCommentService {
	
	public List<HCommentVO> selectAll(Integer health_no);
	
	public int delete(HCommentVO hcvo);

	public int insert(HCommentVO hvo);

	public int update(HCommentVO hvo);
	
	public int hcommentListCnt(HCommentVO hvo);// ������������ ��� ���� ����
	
	public List<HCommentVO> select(HCommentVO hvo); // ������������ ��� ��ü ��� �ҷ�����

	public int deleteadmin(HCommentVO hvo); //������������ ��� ����
	
	public List<HCommentVO> hcommentListExcel(HCommentVO hvo); // ������������ ���� �ٿ�
								
	
	


}
