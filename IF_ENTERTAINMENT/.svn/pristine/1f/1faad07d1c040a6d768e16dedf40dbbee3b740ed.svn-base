package kr.or.ddit.controller.entertain;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.service.entertain.IFinanceService;
import lombok.extern.slf4j.Slf4j;

/**
 * 재무재표 등록 컨트롤러(관리자)
 * @author 조재훈
 */
@Controller
@Slf4j
@RequestMapping("/entertain/finance")
public class FinancialInsertController {
	
	// 관리자가 처음으로 재무재표를 업로드 했을 때에는 테이블에 Insert가 된다.
	// 기존에 테이블이 있는상태여서 굳이 insert를 넣을까 말까 고민중
	
	@Inject
	private IFinanceService financeService;
	
	
	@PostMapping("/insert.do")
	@ResponseBody // 이 어노테이션을 추가하여 응답이 HTTP 응답 본문임을 명시
	public ResponseEntity<?> insert(@RequestParam("upFile") MultipartFile file) throws IOException {
	    log.info("File: " + file);
	    financeService.insert(file);

	    // 응답 구성
	    Map<String, Object> response = new HashMap<>();
	    response.put("status", "success");
	    response.put("message", "파일 업로드 및 데이터 저장 성공");

	    return ResponseEntity.ok(response); // JSON 형식으로 응답 보내기
	}
}
