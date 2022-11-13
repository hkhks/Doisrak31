package com.dosirak31.health.board.service;

import java.util.List;

import com.dosirak31.health.board.vo.HealthBoardVO;

public interface HealthBoardService {
	
	public List<HealthBoardVO> healthList(HealthBoardVO hbvo);			// Workout �Խ��� ��ȸ	

	public HealthBoardVO healthDetail(HealthBoardVO hbvo);				// ����Ʈ & ����� �� ��ȸ

	public int healthBoardInsert(HealthBoardVO hbvo) throws Exception;	// �� ���� ���
	
	public int healthBoardUpdate(HealthBoardVO hbvo) throws Exception;  // �� ���� ���

	public int healthBoardDelete(HealthBoardVO hbvo) throws Exception; 	// �� ���� ����

	public int boardListCnt(HealthBoardVO hbvo);						//����¡ ó�� ���� ��ü ��� �� ��ȸ

	public int healthHit(HealthBoardVO hbvo);							// ��ȸ�� ��ȸ

										

}
