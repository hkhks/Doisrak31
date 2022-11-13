package com.dosirak31.admin.review.service;

import java.util.List;

import com.dosirak31.admin.review.vo.AdminReviewVO;

public interface AdminReviewService {
   public List<AdminReviewVO> adminReviewList(AdminReviewVO arvo);      
   public int adminReviewListCnt(AdminReviewVO arvo); 
   public int adminReviewDelete(AdminReviewVO review_no);
}