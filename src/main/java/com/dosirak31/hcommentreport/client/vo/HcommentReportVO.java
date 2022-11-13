package com.dosirak31.hcommentreport.client.vo;


import com.dosirak31.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class HcommentReportVO extends CommonVO{
	
	private int report_no= 0;
	private String reported_id ="";
	private String client_id ="";
	private String reg_date ="";
	private String reason_report="";
	private int health_comment_no = 0;
	
	private String health_title = "";
	private String health_comment_contents = "";
	
}
