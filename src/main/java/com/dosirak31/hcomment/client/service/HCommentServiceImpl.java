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
		
		return hvo; // health_no이 일치하는 객체 반환
	}
	
	@Override
	public int delete(HCommentVO hcvo) {
		
		 int deletesu = hcommentDao.delete(hcvo);
	        
		return deletesu; //삭제하고 완료된 행의 갯수 반환
	}

	@Override
	public int insert(HCommentVO hvo) {
		
		int insertsu =  hcommentDao.insert(hvo);
		
		return insertsu; //insert하고 완료된 행의 갯수 반환
	}

	@Override
	public int update(HCommentVO hvo) {
		
		int updatesu = hcommentDao.update(hvo);
		
		return updatesu; // 업데이트 된 행의 갯수 반환
	}

	/******************************************************
	 * 관리자페이지 댓글 목록 불러오기
	 *****************************************************/
	@Override
	public List<HCommentVO> select(HCommentVO hvo) {
		
		List<HCommentVO> list = hcommentDao.select(hvo);
		
		return list; // health_no이 일치하는 객체 반환
	}
	
	/******************************************************
	 * 관리자페이지 댓글 삭제
	 *****************************************************/
	@Override
	public int deleteadmin(HCommentVO hvo){
		 
		int deletesu = hcommentDao.deleteadmin(hvo);
	        
		return deletesu; //삭제하고 완료된 행의 갯수 반환
		
	}

	/******************************************************
	 * 관리자페이지 댓글 갯수 세기
	 *****************************************************/
	@Override
	public int hcommentListCnt(HCommentVO hvo) {
		
		int countNum = 0;
		
		countNum = hcommentDao.hcommentListCnt(hvo);
		
		return countNum;
	}
	

	/******************************************************
	 * 관리자페이지 헬스 댓글 엑셀 다운로드
	 *****************************************************/

	@Override
	public List<HCommentVO> hcommentListExcel(HCommentVO hvo) {
		
		List<HCommentVO> hcommentList = null;
		hcommentList = hcommentDao.hcommentListExcel(hvo);
		
		return hcommentList;
	}
	
	


}
