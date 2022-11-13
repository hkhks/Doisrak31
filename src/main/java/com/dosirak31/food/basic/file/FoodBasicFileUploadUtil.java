package com.dosirak31.food.basic.file;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FoodBasicFileUploadUtil {
	 /*****************************************************************
	    * ���� ���ε��� ���� ����
	    *****************************************************************/
	   public static void makeDir(String docRoot) {
	      File fileDir = new File(docRoot);
	      if (fileDir.exists()) { // ���� ���翩�� Ȯ��
	         return; // ���� �����ϸ� true
	      }
	      fileDir.mkdirs(); // ������ �������� ������ ������ �ڵ����� �����Ѵ�.
	   }
	   
	   
	   
	   
	   public static String foodBasicFileUpload(MultipartFile file, String fileName) throws IOException {
	      // �������� ���� ���ε�� ���⼭ �Ѵ�. // ��Ʈ�� Ÿ���� ���� �̸��� �����´�.

	      String real_name = null;
	      // MultipartFileŬ������ getFile()�޼���� Ŭ���̾�Ʈ�� ���ε��� ����
	      String org_name = file.getOriginalFilename();
	     

	      // ���ϸ� ����(�ߺ������ʰ�)
	      if (org_name != null && (!org_name.equals(""))) {
	         real_name = org_name;// ������ ���� �̸�

	         String docRoot = "C://dosirak31img//" + fileName;
	         makeDir(docRoot); // ���� ����� �۾�

	         File fileAdd = new File(docRoot + "/" + real_name);

	         file.transferTo(fileAdd); // ��ü��ΰ� ������ִ� ���� ��ü�� �ʿ�. -> fileAdd
	      }
	      return real_name; // �� �̸����� �������� ����.
	   }
	   
	   

	   /*****************************************************************
	    * ���� ���� �޼��� 
	    * ��� �� ���ϸ�: board/board_1657205347898_cat.jpg 
	    * 
	    *****************************************************************/
	   public static void foodBasicFileDelete(String fileName) throws IOException { 
	                  // ���ڰ����� ���� �̸��� �޴´�.(���X) fileName = board_1657205347898_cat.jsp
	   
	      boolean result = false;
	      String startDirName = "", docRoot = "";
	     
	                              // 0��° ���� �����ؼ� _ ��ġ���� -> board
	    
	         docRoot = "C://dosirak31img//" + fileName; 
	         // docRoot = C://uploadStorage//board
	    
	      File fileDelete = new File(docRoot + "/" + fileName);
	         // C://uploadStorage//board/board_1657205347898_cat.jsp
	      
	      if (fileDelete.exists() && fileDelete.isFile()) {
	         result = fileDelete.delete();
	      }
	      
	   }
}
