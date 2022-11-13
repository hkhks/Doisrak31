package com.dosirak31.common.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUploadUtil {
	
	/*******************************************************
	 * ���� ���ε��� ���� ����
	 ******************************************************/
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}
	
	/*******************************************************
	 * ���� ���ε� �޼���
	 * ���ϸ��� �ߺ��� �ذ� ���
	 * Systme.currentTimeMillis()�� ����ϰų� UUID�� 123��Ʈ�� ���̴�.
	 * ǥ�� ���Ŀ��� UUID�� 32���� 16������ ǥ���Ǹ� �� 36�� ����(32�� ���ڿ� 4���� ������)��
	 * �� 8-4-4-4-12��� 5���� �׷��� ���������� �����Ѵ�. �̸��׸� ������ ����.
	 * �̶� UUID.randomUUID().toString()�� �̿��ؼ� ��´�.
	 * 50e8400-e29b-41d4-a716-446655440000
	 ******************************************************/
	
	public static String fileUpload(MultipartFile file, String fileName) throws IOException{
		log.info("fileUpload ȣ�� ����");
		
		String real_name = null;
		/// MultipartFile Ŭ������ getFile() �޼���� Ŭ���̾�Ʈ�� ���ε��� ����
		String org_name = file.getOriginalFilename();
		log.info("���ε� ���ϸ� :"+org_name);
		
		// ���ϸ� ����(�ߺ����� �ʰ�)
		if(org_name != null && (!org_name.equals(""))) {
			real_name = fileName + "_" + System.currentTimeMillis() + "_"  + org_name; // ������ ���� �̸�
			
			String docRoot = "C://dosirak31img//"+fileName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot+"/"+real_name);
			log.info("���ε��� ����(fileAdd) : " + fileAdd);
			
			file.transferTo(fileAdd); // �� �޼��忡 ���� �����ο� ���������� File�� ������
		}
		return real_name; // ������ ����� ���ϸ� ��ȯ(community_1658205347977_cat.jpg)
		
	}
	
	
	/*******************************************************
	 * ���� ���� �޼���
	 * ��� �� ���ϸ� : board/board_1658205347977_cat.jpg
	 * thumbnail ��� �� ���ϸ� : community/thumbnail_board_1658205347977_cat.jpg
	 ******************************************************/
	
	public static void fileDelete(String fileName) throws IOException{ // fileName = thumbnail_community_1658205347977_cat.jpg
		log.info("fileDelete ȣ�� ����");
		
		boolean result = false;
		String startDirName = "", docRoot = "";
		String dirName = fileName.substring(0, fileName.indexOf("_")); // dirName = thumbnail
		
		if(dirName.equals("thumbnail")) {
			startDirName = fileName.substring(dirName.length()+1, fileName.indexOf("_", dirName.length()+1)); // community
			docRoot = "C://dosirak31img//"+startDirName+"//"+dirName; // docRoot = C://dosirak31img//community//thumbnail
		} else {
			docRoot = "C://dosirak31img//"+dirName; // docRoot = C://dosirak31img//community
		}
		
		File fileDelete = new File(docRoot+"/"+fileName); // C://dosirak31img//community
		
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		log.info("���� ���� ����(true/false) : " + result);
		
	}
	
	
	/*******************************************************
	 * ���� thumbnail ���� �޼���
	 * thumbnail ��� �� ���ϸ�: thumbnail/thumbnail_community_1658205347977_cat.jpg
	 ******************************************************/
	public static String makeThumbnail(String fileName) throws Exception{ // fileName = community_1658205347977_cat.jpg
		
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		// �̹����� �����ϴ� ���� ����
		String imgPath = "C://dosirak31img//"+dirName;
		// ����� ������ ���� ���(������ ��ġ: C:\...)
		File fileAdd = new File(imgPath, fileName);	// C://dosirak31img//community//community_1658205347977_cat.jpg
		log.info("���� �̹��� ����(fileAdd) : " + fileAdd);
		
		BufferedImage sourceImg = ImageIO.read(fileAdd);// fileAdd�� �ش��ϴ� �̹��� ������ �о�ͼ� �����ͷ� ����
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 133);//ũ�⸦ �����Ͽ� �̹��� ������ ����.
									// resize(���[BufferedImage Ÿ��]=�����̹���, ��������(���μ��κ���), ���� �Ǵ� �ʺ�, ũ��)
		
		String thumbnailName = "thumbnail_"+fileName; // thumbnail_community_1658205347977_cat.jpg
		String docRoot = imgPath+"/thumbnail"; // C://dosirak31img//community//thumbnail
		makeDir(docRoot);
		
		File newFile = new File(docRoot, thumbnailName); // C://dosirak31img//community//thumbnail//thumbnail_community_1658205347977_cat.jpg
		log.info("���ε��� ����(newFile) : " + newFile);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		log.info("Ȯ����(formatName) : " + formatName);
		
		ImageIO.write(destImg, formatName, newFile);	// ������ �̹��� �����͸� ������ ���Ͽ� ����
		
		return thumbnailName; // ������ ����� ���ϸ� ��ȯ(thumbnail_community_1658205347977_cat.jpg)
		
	}

}
