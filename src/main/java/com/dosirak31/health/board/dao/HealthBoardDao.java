package com.dosirak31.health.board.dao;

import java.util.List;

import com.dosirak31.health.board.vo.HealthBoardVO;

public interface HealthBoardDao {			
	
	public List<HealthBoardVO> healthList(HealthBoardVO hbvo);	// Workout �Խ��� ��ȸ
	public HealthBoardVO healthDetail(HealthBoardVO hbvo);		// ����Ʈ & ����� ������ �� ��ȸ
	public int healthBoardInsert(HealthBoardVO hbvo);			// �� ���� ���
	public int healthBoardUpdate(HealthBoardVO hbvo);			// �� ���� ���
	public int healthBoardDelete(int health_no);				// �� ���� ����
	public int boardListCnt(HealthBoardVO hbvo);				// ����¡ ó�� ���� ��� �� ��ȸ
	public int healthHit(HealthBoardVO hbvo);					// ��ȸ�� ��ȸ
	
}
