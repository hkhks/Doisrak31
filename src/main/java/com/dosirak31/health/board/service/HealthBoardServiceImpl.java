package com.dosirak31.health.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.common.file.FileUploadUtil;
import com.dosirak31.health.board.dao.HealthBoardDao;
import com.dosirak31.health.board.vo.HealthBoardVO;

import lombok.Setter;

@Service

public class HealthBoardServiceImpl implements HealthBoardService {

	@Setter(onMethod_ = @Autowired)
	private HealthBoardDao hBoardDao;

	/****************************************************************************
	 * Workout �Խ��� ��ȸ
	 ***************************************************************************/

	@Override
	public List<HealthBoardVO> healthList(HealthBoardVO hbvo) {
		List<HealthBoardVO> healthList = null;
		healthList = hBoardDao.healthList(hbvo);
		return healthList;
	}
	
	/****************************************************************************
	 * ����Ʈ & ����� ������ �� ��ȸ ����
	 ***************************************************************************/
	@Override
	public HealthBoardVO healthDetail(HealthBoardVO hbvo) {
	HealthBoardVO weightDetail = null;	
		
		weightDetail = hBoardDao.healthDetail(hbvo);
		if(weightDetail!=null) {
	           weightDetail.setHealth_contents(weightDetail.getHealth_contents().toString().replaceAll("\n", "<br/>"));
	        }
		
		// ������ url �޼���
				if(weightDetail!=null) {
					weightDetail.setHealth_url(weightDetail.getHealth_url());
				}
		
		return weightDetail;
	}

	/****************************************************************************
	 * �� ���� ���
	 ***************************************************************************/
	 // �� �Է� ����
	@Override
	public int healthBoardInsert(HealthBoardVO hbvo) throws Exception {
		int result = 0;
		
		if(hbvo.getFile().getSize()>0) {
	         String fileName=FileUploadUtil.fileUpload(hbvo.getFile(), "health");
	         hbvo.setHealth_img(fileName);
	      }		
		
		result = hBoardDao.healthBoardInsert(hbvo);
		return result;
	}
	
	/****************************************************************************
	 * �� ���� ���
	 ***************************************************************************/
	@Override
	 public int healthBoardUpdate(HealthBoardVO hbvo) throws Exception {
        int result = 0;
        if(!hbvo.getFile().isEmpty()) {
           if(!hbvo.getHealth_img().isEmpty()) {
        	   FileUploadUtil.fileDelete(hbvo.getHealth_img());
         
           }
           
           String fileName = FileUploadUtil.fileUpload(hbvo.getFile(), "health");
           hbvo.setHealth_img(fileName);
        }
        result = hBoardDao.healthBoardUpdate(hbvo);
        return result;
     }

	/****************************************************************************
	 * �� ���� ����
	 * @throws Exception 
	 ***************************************************************************/
	@Override
	public int healthBoardDelete(HealthBoardVO hbvo) throws Exception {
		int result=0;
	      if(!hbvo.getHealth_img().isEmpty()) {
	         FileUploadUtil.fileDelete(hbvo.getHealth_img());
	      }
	      result=hBoardDao.healthBoardDelete(hbvo.getHealth_no());
	      return result;
	}

	/****************************************************************************
	 * ����¡ ó�� ���� ��ü ���(���ڵ�) �� ��ȸ
	 ***************************************************************************/
	@Override
	public int boardListCnt(HealthBoardVO hbvo) {
		return  hBoardDao.boardListCnt(hbvo);
	}
	
	/****************************************************************************
	 * �Խ��� ��ȸ�� ��ȸ
	 ***************************************************************************/
	@Override
	public int healthHit(HealthBoardVO hbvo) {
		int result=0;
	    result = hBoardDao.healthHit(hbvo);
	    return result;
		
	}




}