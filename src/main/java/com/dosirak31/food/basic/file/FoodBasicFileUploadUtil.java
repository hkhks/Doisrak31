package com.dosirak31.food.basic.file;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FoodBasicFileUploadUtil {
	 /*****************************************************************
	    * 파일 업로드할 폴더 생성
	    *****************************************************************/
	   public static void makeDir(String docRoot) {
	      File fileDir = new File(docRoot);
	      if (fileDir.exists()) { // 파일 존재여부 확인
	         return; // 파일 존재하면 true
	      }
	      fileDir.mkdirs(); // 파일이 존재하지 않으면 폴더를 자동으로 생성한다.
	   }
	   
	   
	   
	   
	   public static String foodBasicFileUpload(MultipartFile file, String fileName) throws IOException {
	      // 실질적인 파일 업로드는 여기서 한다. // 스트링 타입의 파일 이름을 가져온다.

	      String real_name = null;
	      // MultipartFile클래스의 getFile()메서드로 클라이언트가 업로드한 파일
	      String org_name = file.getOriginalFilename();
	     

	      // 파일명 변경(중복되지않게)
	      if (org_name != null && (!org_name.equals(""))) {
	         real_name = org_name;// 저장할 파일 이름

	         String docRoot = "C://dosirak31img//" + fileName;
	         makeDir(docRoot); // 폴더 만드는 작업

	         File fileAdd = new File(docRoot + "/" + real_name);

	         file.transferTo(fileAdd); // 전체경로가 담겨져있는 파일 객체가 필요. -> fileAdd
	      }
	      return real_name; // 이 이름으로 서버측에 저장.
	   }
	   
	   

	   /*****************************************************************
	    * 파일 삭제 메서드 
	    * 경로 및 파일명: board/board_1657205347898_cat.jpg 
	    * 
	    *****************************************************************/
	   public static void foodBasicFileDelete(String fileName) throws IOException { 
	                  // 인자값으로 파일 이름을 받는다.(경로X) fileName = board_1657205347898_cat.jsp
	   
	      boolean result = false;
	      String startDirName = "", docRoot = "";
	     
	                              // 0번째 부터 시작해서 _ 위치까지 -> board
	    
	         docRoot = "C://dosirak31img//" + fileName; 
	         // docRoot = C://uploadStorage//board
	    
	      File fileDelete = new File(docRoot + "/" + fileName);
	         // C://uploadStorage//board/board_1657205347898_cat.jsp
	      
	      if (fileDelete.exists() && fileDelete.isFile()) {
	         result = fileDelete.delete();
	      }
	      
	   }
}
