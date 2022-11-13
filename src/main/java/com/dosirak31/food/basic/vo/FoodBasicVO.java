package com.dosirak31.food.basic.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FoodBasicVO {
	private int food_no; //�Ϸù�ȣ
	private String food_category="";//ī�װ�
	private String food_name="";//���ĸ�
	private String food_img="";//�����̹���
	private MultipartFile food_file;
	private int food_price=0;//����
	private double food_kcal=0.0;//Į�θ�
	private int food_volume=0;//�뷮
	private double food_calb=0.0;//ź��ȭ��
	private double food_protein=0.0;//�ܹ���
	private double food_fat=0.0;//����
	
}
