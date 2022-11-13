package com.dosirak31.admin.community.service;

import java.util.List;

import com.dosirak31.client.community.vo.CommunityVO;

public interface AdminCommunityService {
   public List<CommunityVO> communityList(CommunityVO cvo);
   public int communityListCnt(CommunityVO cvo);
   public int communityInsert(CommunityVO cvo) throws Exception;
   public CommunityVO communityDetail(CommunityVO cvo);
   public int pwdConfirm(CommunityVO cvo);
   public CommunityVO updateForm(CommunityVO cvo);
   public int communityUpdate(CommunityVO cvo) throws Exception;
   public int communityDelete(CommunityVO cvo) throws Exception;
   public int replyCnt(int community_no);
}