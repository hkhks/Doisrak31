package com.dosirak31.client.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.client.community.vo.CommunityVO;
import com.dosirak31.client.reply.dao.ReplyDao;
import com.dosirak31.client.reply.vo.ReplyVO;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyDao replyDao;
	
	// �۸�� ����
	@Override
	public List<ReplyVO> replyList(Integer community_no) {
		List<ReplyVO> list = null;
		
		list = replyDao.replyList(community_no);
		
		return list;
	}
	

	// �� �Է� ����
	@Override
	public int replyInsert(ReplyVO rvo) {
		int result = 0;
		result = replyDao.replyInsert(rvo);
		return result;
	}

	//�� ���� ����
	@Override
	public int replyUpdate(ReplyVO rvo) {
		int result = 0;
		result = replyDao.replyUpdate(rvo);
		return result;
	}

	//�� ���� ����
	@Override
	public int replyDelete(Integer reply_no) {
		int result = 0;
		result = replyDao.replyDelete(reply_no);
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
