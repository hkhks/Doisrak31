package com.dosirak31.admin.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.admin.review.dao.AdminReviewDao;
import com.dosirak31.admin.review.vo.AdminReviewVO;

import lombok.Setter;

@Service
public class AdminReviewServiceImpl implements AdminReviewService {
   
   @Setter(onMethod_ = @Autowired)
   private AdminReviewDao adminReviewDao;
   
   @Override
   public List<AdminReviewVO> adminReviewList(AdminReviewVO arvo) {
      List<AdminReviewVO> list = null;
      list = adminReviewDao.adminReviewList(arvo);
      return list;
   }

   @Override
   public int adminReviewListCnt(AdminReviewVO arvo) {
      return adminReviewDao.adminReviewListCnt(arvo);
   }

   @Override
   public int adminReviewDelete(AdminReviewVO arvo) {
      int result = 0;
      result = adminReviewDao.adminReviewDelete(arvo.getReview_no());
      return result;
   }


}