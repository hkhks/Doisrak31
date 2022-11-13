package com.dosirak31.admin.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.client.community.dao.CommunityDao;
import com.dosirak31.client.community.vo.CommunityVO;
import com.dosirak31.client.reply.dao.ReplyDao;
import com.dosirak31.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class AdminCommunityServiceImpl implements AdminCommunityService {

   @Setter(onMethod_ = @Autowired)
   private CommunityDao communityDao;
   
   @Setter(onMethod_ = @Autowired)
   private ReplyDao replyDao;
   
   
   @Override
   public List<CommunityVO> communityList(CommunityVO cvo) {
      List<CommunityVO> aList = null;
      aList = communityDao.communityList(cvo);
      return aList;
   }

   @Override
   public int communityListCnt(CommunityVO cvo) {
      int countNum = 0;
      countNum = communityDao.communityListCnt(cvo);
      return countNum;
   }
   
   
   // Ŀ�´�Ƽ �Խ��� �� �Է� ����
   
      @Override
      public int communityInsert(CommunityVO cvo) throws Exception {
         int result = 0;
         
         if(cvo.getFile().getSize() > 0) {
            String fileName = FileUploadUtil.fileUpload(cvo.getFile(), "community");
            cvo.setFile_name(fileName);
            
            String thumbName = FileUploadUtil.makeThumbnail(fileName);
            cvo.setFile_thumb(thumbName);
         }
         
         
           result = communityDao.communityInsert(cvo); 
         
         
         return result;
      }
      
      
      
      
      // �� �� ����
      
      @Override
      public CommunityVO communityDetail(CommunityVO cvo) {
         CommunityVO detail = null;
         
         communityDao.readCntUpdate(cvo); // ��ȸ�� ���� �޼��� ȣ��
         
         detail = communityDao.communityDetail(cvo);
         if(detail != null) {
            detail.setCommunity_contents(detail.getCommunity_contents().toString().replaceAll("\n", "<br />"));
         }
         
         return detail;
      }
      
      // ��й�ȣ Ȯ�� ����
         @Override
         public int pwdConfirm(CommunityVO cvo) {
            int result = 0;
            result = communityDao.pwdConfirm(cvo);
            return result;
         }
         
         // ������Ʈ�� ����
         @Override
         public CommunityVO updateForm(CommunityVO cvo) {
            CommunityVO detail = null;
            
            detail = communityDao.communityDetail(cvo);
            
            return detail;
         }
         
         
         // �� ���� ����
         @Override
         public int communityUpdate(CommunityVO cvo) throws Exception {
            int result = 0;
            
            if(!cvo.getFile().isEmpty()) {         // ���Ӱ� ���ε��� ������ �����ϸ�
               if(!cvo.getFile_name().isEmpty()) {   // ���� ������ �����ϸ�
                  FileUploadUtil.fileDelete(cvo.getFile_name());
                  FileUploadUtil.fileDelete(cvo.getFile_thumb());
               }
               
               String fileName = FileUploadUtil.fileUpload(cvo.getFile(), "community");
               cvo.setFile_name(fileName);
               
               String thumbName = FileUploadUtil.makeThumbnail(fileName);
               cvo.setFile_thumb(thumbName);
            }
            
            result = communityDao.communityUpdate(cvo);
            
            return result;
         }
         
         // �� ���� ����
         @Override
         public int communityDelete(CommunityVO cvo) throws Exception {
            int result = 0;
            if(!cvo.getFile_name().isEmpty()) {
               FileUploadUtil.fileDelete(cvo.getFile_name());
               FileUploadUtil.fileDelete(cvo.getFile_thumb());
            }
            
            result = communityDao.communityDelete(cvo.getCommunity_no());
            return result;
         }
         
         
         // �ش� ���ù��� ��� ���� ���� Ȯ��
         // ����� �����ϸ� ��ۼ��� ��ȯ�ϰ� �������� ������ 0�� ��ȯ
         @Override
         public int replyCnt(int community_no) {
            int result = 0;
            result = replyDao.replyCnt(community_no);
            return result;
         }

}