package com.dosirak31.common.vo;

import lombok.Data;

@Data
public class CommonHealthVO {
	
	private int pageNum=0;
	private int amount=0;

	private String search="";
	private String keyword="";
	
	public CommonHealthVO() {
		this(1,12);
	}
	
	public CommonHealthVO(int pageNum,int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
}
