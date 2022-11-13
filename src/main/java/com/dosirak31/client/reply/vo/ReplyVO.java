package com.dosirak31.client.reply.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
   private int reply_no = 0;         //��۹�ȣ
   private int community_no = 0;      //�Խ��� �۹�ȣ
   private String client_id ="";      //��� �ۼ���
   private String admin_id ="";      //��� �ۼ���
   private String reply_contents ="";   //��� ����
   private String reply_date;         //��� �ۼ��� ( Ŭ���̾�Ʈ�κ��� ��¥ �޾ƿ����� Ÿ�� date)
   private String reply_pw = "";      //��� ��й�ȣ
   private String reply_update = "";   //��� ������
}