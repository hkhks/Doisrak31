package com.dosirak31.hcomment.client.vo;

import com.dosirak31.common.vo.CommonVO;

import lombok.Data;

@Data
public class HCommentVO extends CommonVO{
	
	private Integer health_comment_no; // ��۹�ȣ
	private Integer health_no;	//	�ｺ �Խù� ��ȣ
	private Integer parent_health_comment_no;	// ���� ��ȣ
	private String health_comment_contents;	//	����
	private String client_id;	//	�ۼ���
	private String reg_date; // ��ϳ�¥
	private String up_date; // ������¥
	
	private String health_title = "";
	
}
