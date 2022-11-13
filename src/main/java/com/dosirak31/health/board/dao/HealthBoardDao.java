package com.dosirak31.health.board.dao;

import java.util.List;

import com.dosirak31.health.board.vo.HealthBoardVO;

public interface HealthBoardDao {			
	
	public List<HealthBoardVO> healthList(HealthBoardVO hbvo);	// Workout 게시판 조회
	public HealthBoardVO healthDetail(HealthBoardVO hbvo);		// 웨이트 & 유산소 동영상 상세 조회
	public int healthBoardInsert(HealthBoardVO hbvo);			// 글 쓰기 등록
	public int healthBoardUpdate(HealthBoardVO hbvo);			// 글 수정 등록
	public int healthBoardDelete(int health_no);				// 글 삭제 구현
	public int boardListCnt(HealthBoardVO hbvo);				// 페이징 처리 위한 목록 수 조회
	public int healthHit(HealthBoardVO hbvo);					// 조회수 조회
	
}
