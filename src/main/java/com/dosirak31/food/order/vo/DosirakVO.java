package com.dosirak31.food.order.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DosirakVO extends ClientVO{//도시락
	private int dosirak_no; 	//도시락번호
	private String dosirak_name;	//도시락명
	private String food_name1;	//식품명1
	private String food_name2;	//식품명2
	private String food_name3;	//식품명3
	private String food_name4;	//식품명4
	private String food_name5;	//식품명5
	private String food_img1;	//식품명1
	private String food_img2;	//식품명1
	private String food_img3;	//식품명1
	private String food_img4;	//식품명1
	private String food_img5;	//식품명1
	
}
