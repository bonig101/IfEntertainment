package kr.or.ddit.vo.entertain;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class IRFileVO {
	
	
	private int bfNo;
	
	private String bfTitle;
	private String bfWriter;
	private Date bfRegdate;
	private int userNo;
	private int btNo;
	
	private MultipartFile irPPT;
	private MultipartFile irPDF;
	
	private String irPPTName;
	private String irPDFName;
	
	private List<IRFileAttachVO> attachFileList;
	
}
