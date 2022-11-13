package com.dosirak31.health.board.vo;

import org.springframework.web.multipart.MultipartFile;

import com.dosirak31.common.vo.CommonHealthVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

// �ｺ �Խ��� VO
@EqualsAndHashCode(callSuper = false)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class HealthBoardVO extends CommonHealthVO {
	private int health_no;				// �ｺ �Խñ� ��ȣ
	private String health_title;			// �ｺ �Խñ� ����
	private String health_date;			// �ۼ� �Ͻ�
	private int health_closed;			// ����� ����
	private int health_hits;			// ��ȸ��
	private String health_contents;		// �Խñ� ����
	private String health_url ="";		// ����� url
	private String health_img = "";		// �ｺ �̹��� (���������� ������ ���ϸ�)
	private int health_category_no;		// �ｺ ī�װ� �Ϸù�ȣ (1�� ����Ʈ 2�� ī���)
	private String health_update;		// ���� �Ͻ�
	private String admin_id;			// ������ ���̵�
	
	private MultipartFile file;			// ���� ���ε带 ���� �ʵ�
}
