package com.dosirak31.client.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.client.community.dao.CommunityDao;
import com.dosirak31.client.community.vo.CommunityVO;
import com.dosirak31.client.reply.dao.ReplyDao;
import com.dosirak31.common.file.FileUploadUtil;

import lombok.Setter;

@Service	// @Service 어노테이션을 줘야 인스턴스가 만들어진다. 서비스는 인터페이스를 만들고 구현형태로 이루어진다.
public class CommunityServiceImpl implements CommunityService {
	
	// 의존객체가 DAO
	@Setter(onMethod_ = @Autowired)
	private CommunityDao communityDao;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyDao replyDao;
	
	// 커뮤니티 게시판 목록 구현
	@Override
	public List<CommunityVO> communityList(CommunityVO cvo) {
		List<CommunityVO> list = null;
		list = communityDao.communityList(cvo);
		
		return list;
	}
	
	
	

	// 전체 레코드 수 구현
	@Override
	public int communityListCnt(CommunityVO cvo) {
		return communityDao.communityListCnt(cvo);
	}
	
	
	// 커뮤니티 게시판 글 입력 구현
	
	@Override
	public int communityInsert(CommunityVO cvo) throws Exception {
		int result = 0;
		
		if(cvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(cvo.getFile(), "community");
			cvo.setFile_name(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			cvo.setFile_thumb(thumbName);
		}
		
		
		  result = communityDao.communityInsert(cvo); 
		
		
		return result;
	}
	
	
	
	
	// 글 상세 구현
	
	@Override
	public CommunityVO communityDetail(CommunityVO cvo) {
		CommunityVO detail = null;
		
		communityDao.readCntUpdate(cvo); // 조회수 증가 메서드 호출
		
		detail = communityDao.communityDetail(cvo);
		if(detail != null) {
			detail.setCommunity_contents(detail.getCommunity_contents().toString().replaceAll("\n", "<br />"));
		}
		
		return detail;
	}
	
	// 비밀번호 확인 구현
		@Override
		public int pwdConfirm(CommunityVO cvo) {
			int result = 0;
			result = communityDao.pwdConfirm(cvo);
			return result;
		}
		
		// 업데이트폼 구현
		@Override
		public CommunityVO updateForm(CommunityVO cvo) {
			CommunityVO detail = null;
			
			detail = communityDao.communityDetail(cvo);
			
			return detail;
		}
		
		
		// 글 수정 구현
		@Override
		public int communityUpdate(CommunityVO cvo) throws Exception {
			int result = 0;
			
			if(!cvo.getFile().isEmpty()) {			// 새롭게 업로드할 파일이 존재하면
				if(!cvo.getFile_name().isEmpty()) {	// 기존 파일이 존재하면
					FileUploadUtil.fileDelete(cvo.getFile_name());
					FileUploadUtil.fileDelete(cvo.getFile_thumb());
				}
				
				String fileName = FileUploadUtil.fileUpload(cvo.getFile(), "community");
				cvo.setFile_name(fileName);
				
				String thumbName = FileUploadUtil.makeThumbnail(fileName);
				cvo.setFile_thumb(thumbName);
			}
			
			result = communityDao.communityUpdate(cvo);
			
			return result;
		}
		
		// 글 삭제 구현
		@Override
		public int communityDelete(CommunityVO cvo) throws Exception {
			int result = 0;
			if(!cvo.getFile_name().isEmpty()) {
				FileUploadUtil.fileDelete(cvo.getFile_name());
				FileUploadUtil.fileDelete(cvo.getFile_thumb());
			}
			
			result = communityDao.communityDelete(cvo.getCommunity_no());
			return result;
		}
		
		
		// 해당 개시물의 댓글 존재 여부 확인
		// 댓글이 존재하면 댓글수를 반환하고 존재하지 않으면 0을 반환
		@Override
		public int replyCnt(int community_no) {
			int result = 0;
			result = replyDao.replyCnt(community_no);
			return result;
		}


		


		





		
	
		
		
	
	
	
	
	
	
	

}
