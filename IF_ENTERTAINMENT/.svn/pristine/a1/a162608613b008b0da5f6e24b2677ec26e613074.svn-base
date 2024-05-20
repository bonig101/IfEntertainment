package kr.or.ddit.aop;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@Aspect
public class AOPController {

	// 서비스 패키지 안에서의 메소드 실행시간을 체크한다.
	@Around("execution(* kr.or.ddit.service..*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {
	    // 메소드 실행 직전 시간 체킹
	    long startTime = System.currentTimeMillis();
	    
	    // 메소드 실행
	    Object result = pjp.proceed();    // 타겟 실행
	    
	    // 메소드 실행 직후 시간 체킹
	    long endTime = System.currentTimeMillis();
	    log.info("[@Around] Args : " + Arrays.toString(pjp.getArgs()));
	    
	    // 직후 시간 - 직전 시간 = 메소드 실행 시간
	    log.info("[@Around] timeLog : " + pjp.getSignature());
	    log.info("[@Around] 메소드 실행시간 : " + (endTime - startTime));
	    

	    try {
	        // 파일 경로 생성
	        File folder = new File("C:/file");
	        folder.mkdirs(); // 폴더가 없으면 생성
	        
	        File methodTimeFile = new File(folder, "method_time.txt");
	        
	        FileOutputStream fos = new FileOutputStream(methodTimeFile, true); // true를 사용하여 기존 파일에 추가
	        PrintWriter writer = new PrintWriter(fos);
	        writer.println("[@Around] 메소드명 : " + pjp.getSignature());
	        writer.println("[@Around] 메소드 실행시간 : " + (endTime - startTime) + "ms");
	        writer.println("----------------------------------------------------------------------------------------------------------------------------");
	        writer.close();
	        log.info("메소드 실행 시간 및 시그니처를 파일에 저장했습니다.");
	    } catch (IOException e) {
	        log.error("파일에 기록하는 동안 오류가 발생했습니다: " + e.getMessage());
	    }
	    
	    return result;
	}	
}






















	










