package com.dosirak31.client.community.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dosirak31.client.community.vo.CommunityVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CommunityMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private CommunityDao communityDao;
	
	
	@Test
	public void testCommunityList() {
		CommunityVO cvo = new CommunityVO();
		
		cvo.setPageNum(1);
		cvo.setAmount(10);
		
		cvo.setSearch("community_title");
		cvo.setKeyword("test");
		
		List<CommunityVO> list = communityDao.communityList(cvo);
		for(CommunityVO vo : list) {
			log.info(vo);
		}
	
	}

}
