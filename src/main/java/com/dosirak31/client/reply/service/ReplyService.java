package com.dosirak31.client.reply.service;

import java.util.List;

import com.dosirak31.client.reply.vo.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> replyList(Integer community_no);
	public int replyInsert(ReplyVO rvo);
	public int replyUpdate(ReplyVO rvo);
	public int replyDelete(Integer reply_no);
}
