package com.dosirak31.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageHealthDTO {
	private int startPage;//ȭ�鿡�� �������� �������� ���� ��ȣ
	private int endPage;//ȭ�鿡�� �������� �������� ����ȣ
	private boolean prev,next;//������ �������� �̵��� ��ũ�� ǥ�� ����
	
	private int total;
	private CommonHealthVO cvo;
	
	public PageHealthDTO(CommonHealthVO cvo, int total) {
		this.cvo=cvo;
		this.total=total;
		
		/*����¡�� ����ȣ (endPage)���ϱ�
		 * this.endPage=(int) (Math.ceil(����������/10.0))*10; */
		 this.endPage=(int) (Math.ceil(cvo.getPageNum()/10.0))*10;
		 /*1�������� ��� :Math.ceil(0.1)*10=10
		  *2�������� ���: Math.ceil(0.2)*10=10
		  *10�������� ���: Math.ceil(1)*10=10
		  *11�������� ���:Math.ceil(1.1)*10=20
		  * */
		 
		 
		 /*����¡�� ���۹�ȣ(startPage)���ϱ�*/
		 this.startPage=this.endPage-9;
		 
		 /*�� ������ ���ϱ�*/
		 int realEnd=(int)(Math.ceil((total*1.0)/cvo.getAmount()));
		 
		 if(realEnd<=this.endPage) {
			 this.endPage=realEnd;
		 }
		 
		 //���� ���ϱ�
		 this.prev=this.startPage>1;
		 
		 //�������ϱ�
		 this.next=this.endPage<realEnd;
	}
}
