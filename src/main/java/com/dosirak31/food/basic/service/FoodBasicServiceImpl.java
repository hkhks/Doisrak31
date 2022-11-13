package com.dosirak31.food.basic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dosirak31.food.basic.dao.FoodBasicDao;
import com.dosirak31.food.basic.file.FoodBasicFileUploadUtil;
import com.dosirak31.food.basic.vo.FoodBasicVO;

import lombok.Setter;

@Service
public class FoodBasicServiceImpl implements FoodBasicService {
	@Setter(onMethod_ = @Autowired)
	private FoodBasicDao foodBasicDao;
	//식품목록 전체 조회해오기
	@Override
	public List<FoodBasicVO> foodBasicList(int food_no) {
		List<FoodBasicVO> list= null;
		list=foodBasicDao.foodBasicList(food_no);
		return list;
	}
	//식품목록 카테고리별로 조회해오기
	@Override
	public List<FoodBasicVO> foodBasicListCategory(String food_category) {
		List<FoodBasicVO> list = null;
		list=foodBasicDao.foodBasicListCategory(food_category);
		return list;
	}
	//식품목록 번호별로 조회해오기
	@Override
	public List<FoodBasicVO> foodBasicListNo(int food_no) {
		List<FoodBasicVO> list = null;
		list=foodBasicDao.foodBasicListNo(food_no);
		return list;
	}
	
	//식품 추가하기
	@Override
	public int foodBasicInsert(FoodBasicVO fbo) throws Exception {
		int result=0;
		if(fbo.getFood_file().getSize()>0) {
			String fileName=FoodBasicFileUploadUtil.foodBasicFileUpload(fbo.getFood_file(), "food");
			fbo.setFood_img(fileName);
		}
		result=foodBasicDao.foodBasicInsert(fbo);
		return result;
	}
	@Override
	public int foodBasicDelete(FoodBasicVO fbo) throws Exception {
		int result=0;
		if(!fbo.getFood_img().isEmpty()) {
			FoodBasicFileUploadUtil.foodBasicFileDelete(fbo.getFood_img());
		}
		result=foodBasicDao.foodBasicDelete(fbo.getFood_no());
		return result;
	}
	@Override
	public int foodBasicUpdate(FoodBasicVO fbo) throws Exception {
		int result=0;
		if(!fbo.getFood_file().isEmpty()) {
			if(!fbo.getFood_img().isEmpty()) {
				FoodBasicFileUploadUtil.foodBasicFileDelete(fbo.getFood_img());
			}
			String fileName=FoodBasicFileUploadUtil.foodBasicFileUpload(fbo.getFood_file(), "food");
			fbo.setFood_img(fileName);
		}
		result=foodBasicDao.foodBasicUpdate(fbo);
		return result;
	}
	
	
}
