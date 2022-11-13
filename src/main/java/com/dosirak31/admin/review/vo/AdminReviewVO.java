package com.dosirak31.admin.review.vo;

import com.dosirak31.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class AdminReviewVO extends CommonVO {
	
	private int review_no				=0;		
	private String review_contents		="";	
	private int review_score			=0;		
	private String review_date			="";	
	private int client_no				=0;		
	private int order_no				=0;		
	private String review_name			="";	
	

}
