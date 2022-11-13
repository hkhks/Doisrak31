package com.dosirak31.login.client.dao;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dosirak31.login.client.vo.ClientLoginVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class test {
	

	@Setter(onMethod_= @Autowired)
	private ClientLoginDao clientLoginDao;	
	
	
	@Test 
	public void testSearhId() {
		
		ClientLoginVO cvo = new ClientLoginVO();
		
		cvo.setClient_email("gyruddkssud@naver.com");
		cvo.setClient_pw("reset");
		
		
		int result = clientLoginDao.pwupdate(cvo);
		
		log.info("¿Ï´¢");
		
		
	}
	/*update client
		set client_pw = #{client_pw}
		where client_email = #{client_email}*/
	
	
	
	

}
