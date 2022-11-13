package com.dosirak31.food.basic.dao;

import java.util.List;

import com.dosirak31.food.basic.vo.FoodBasicVO;

public interface FoodBasicDao {
	public List<FoodBasicVO> foodBasicList(int food_no);//��ȣ�� ������� ��ȸ
	public List<FoodBasicVO> foodBasicListCategory(String food_category); //ī�װ����� ������ ��ȸ ���� json���� �����
	public List<FoodBasicVO> foodBasicListNo(int food_no);//���� ��ȣ�� ���� json���Ϸ� ��ȸ
	public int foodBasicInsert(FoodBasicVO fbo) throws Exception;//��ǰ �߰� insert
	public int foodBasicDelete(int food_no) throws Exception;//��ǰ ����
	public int foodBasicUpdate(FoodBasicVO fbo) throws Exception;//��ǰ ����
}
