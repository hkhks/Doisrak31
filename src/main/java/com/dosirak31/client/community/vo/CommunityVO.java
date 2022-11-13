package com.dosirak31.client.community.vo;

import org.springframework.web.multipart.MultipartFile;

import com.dosirak31.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class CommunityVO extends CommonVO{
	
	private int community_no;	//�Խñ��Ϸù�ȣ not null ������ ó��
	private String client_id;		//ȸ���Ϸù�ȣ 	null
	private String admin_id;		//������ ���̵� null
	private String community_title;	//�Խñ�����  not null
	private String community_pw;	//�Խñۺ�й�ȣ null
	private String community_date;	//�ۼ��Ͻ� 
	private int community_notify = 0;	//��������
	private int community_hits = 0;		//��ȸ��
	private int community_closed = 0;	//���������
	private String community_contents;	//�Խñ۳���
	private int community_category_no=0;	//�Խ���ī�װ��Ϸù�ȣ
	private String community_update;	//�Խ��� �����Ͻ�
	private int reply_cnt = 0;		//��۰���
	
	private MultipartFile file; // ���� ���ε带 ���� �ʵ�
	private String file_name = "";			//���������� ������ ���ϸ�
	private String file_thumb = ""; // ���������� ������ ����� �̹��� ���ϸ�
	
}
