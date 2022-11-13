package com.dosirak31.mypage.order.vo;

import org.springframework.web.multipart.MultipartFile;

import com.dosirak31.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MypageOrderVO extends CommonVO{
   
   private int order_no         =0;
   private String order_date      ="";
   private String order_delivery_date   ="";
   private String order_delete_date   ="";
   private String order_client_name   ="";
   private String order_client_phone   ="";
   private String order_address      ="";
   private int client_no      =0;
   private int order_status_no   =0;
   
   private MultipartFile file;
   private String file_name      ="";
   private String file_thumb      ="";
}