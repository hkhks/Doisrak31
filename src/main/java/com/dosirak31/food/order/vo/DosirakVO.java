package com.dosirak31.food.order.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DosirakVO extends ClientVO{//���ö�
	private int dosirak_no; 	//���ö���ȣ
	private String dosirak_name;	//���ö���
	private String food_name1;	//��ǰ��1
	private String food_name2;	//��ǰ��2
	private String food_name3;	//��ǰ��3
	private String food_name4;	//��ǰ��4
	private String food_name5;	//��ǰ��5
	private String food_img1;	//��ǰ��1
	private String food_img2;	//��ǰ��1
	private String food_img3;	//��ǰ��1
	private String food_img4;	//��ǰ��1
	private String food_img5;	//��ǰ��1
	
}
