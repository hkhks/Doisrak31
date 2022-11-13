package com.dosirak31.food.basic.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;
import com.dosirak31.food.basic.vo.FoodBasicVO;

public interface FoodBasicService {
	public List<FoodBasicVO> foodBasicList(int food_no);//��ȣ�� ������� ��ȸ
	public List<FoodBasicVO> foodBasicListCategory(String food_category); //ī�װ����� ������ ��ȸ ���� json���� �����
	public List<FoodBasicVO> foodBasicListNo(int food_no);//���� ��ȣ�� ���� json���Ϸ� ��ȸ
	public int foodBasicInsert(FoodBasicVO fbo) throws Exception;//��ǰ �߰� insert
	public int foodBasicDelete(FoodBasicVO fbo) throws Exception;//��ǰ ����
	public int foodBasicUpdate(FoodBasicVO fbo) throws Exception;//��ǰ ����
}
