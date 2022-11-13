package com.dosirak31.mypage.review.vo;

import com.dosirak31.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MypageReviewVO extends CommonVO{
	
	private int client_no			=0;			
	
	private String client_id		="";		
	private String client_pw		="";		
	private String client_name		="";		
	private String client_email		="";				
	private String client_phone		="";		
	private String client_address	="";		
	private String client_rrn		="";		
	private String client_date		="";		
	private String client_update	="";		
	
	
	private int review_no				=0;		
	private String review_contents		="";	
	private int review_score			=0;		
	private String review_date			="";	
	private int order_no				=0;		
	private String review_name			="";	
	
	private String dosirak_name			="";	
	private int dosirak_no				=0;		
	
	private String food_img1;
	private String food_img2;
	private String food_img3;
	private String food_img4;
	private String food_img5;
	
	
}
