package com.dosirak31.common.log;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
@Aspect
public class LoggerAdvice {
	
	@Around("execution(* com.dosirak31..*Impl.*(..))")
	public Object timeLogging(ProceedingJoinPoint pjp) throws Throwable{
		log.info("-----------------------------------");
		log.info("[���� �α� Log] ����Ͻ� ���� ���� �� ����");
		
		//long startTime = System.currentTimeMillis();
		StopWatch watch = new StopWatch();
		watch.start();
		log.info("[ȣ�� �޼����� �Ķ���� ��]" + Arrays.toString(pjp.getArgs()));
		
		Object result = null;
		// proceed() : ���� target ��ü�� �޼��带 �����ϴ� ���.
		result = pjp.proceed();
		
		// long endTime = System.currentTimeMillis();
		watch.stop();
		
		log.info("[Class] " + pjp.getTarget().getClass());
		
		//logger.info(pjp.getSignature().getName()+" : �ҿ�ð� " + (endTime-startTime)+"ms");
		log.info("[ȣ�� �޼����] " + pjp.getSignature().getName());
		log.info("[�ҿ�ð�] " + watch.getTotalTimeSeconds());
		log.info("[���� ���] " + result);
		log.info("[���� �α�  Log] ����Ͻ� ���� ���� �� ����");
		log.info("-----------------------------------");
		
		return result;
	}
	
}
