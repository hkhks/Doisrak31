package com.dosirak31.client.reply.dao;

import java.util.List;

import com.dosirak31.client.reply.vo.ReplyVO;

public interface ReplyDao {
	public List<ReplyVO> replyList(Integer community_no);
	public int replyInsert(ReplyVO rvo);
	public int replyUpdate(ReplyVO rvo);
	public int replyDelete(Integer reply_no);
	public int replyCnt(int community_no);
}
