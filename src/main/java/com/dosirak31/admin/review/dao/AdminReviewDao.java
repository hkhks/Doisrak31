package com.dosirak31.admin.review.dao;

import java.util.List;

import com.dosirak31.admin.review.vo.AdminReviewVO;

public interface AdminReviewDao {
   public List<AdminReviewVO> adminReviewList(AdminReviewVO arvo);      
   public int adminReviewListCnt(AdminReviewVO arvo); 
   public int adminReviewDelete(int review_no);
   
   

}