package com.dosirak31.food.basic.dao;

import java.util.List;

import com.dosirak31.food.basic.vo.FoodBasicVO;

public interface FoodBasicDao {
	public List<FoodBasicVO> foodBasicList(int food_no);//번호로 수정목록 조회
	public List<FoodBasicVO> foodBasicListCategory(String food_category); //카테고리별로 데이터 조회 위한 json파일 만들기
	public List<FoodBasicVO> foodBasicListNo(int food_no);//음식 번호에 따라 json파일로 조회
	public int foodBasicInsert(FoodBasicVO fbo) throws Exception;//식품 추가 insert
	public int foodBasicDelete(int food_no) throws Exception;//식품 삭제
	public int foodBasicUpdate(FoodBasicVO fbo) throws Exception;//식품 수정
}
