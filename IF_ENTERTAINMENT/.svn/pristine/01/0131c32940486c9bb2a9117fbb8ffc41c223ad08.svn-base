package kr.or.ddit.vo.community;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FeedAttachFileVO {
	 
	 private MultipartFile item;
	 private int faNo;
	 private String faName;
	 private long faSize;
	 private String faMime;
	 private String faSavepath;
	 private String faFancysize;
	 private String faFilter;
	 private String faSavedname;
	 private int feedNo;
	 
	 //아티스트그룹
	 private String agId;
	 public FeedAttachFileVO() {}
	 public FeedAttachFileVO(MultipartFile[] feedFile) {}
	 
	 public FeedAttachFileVO(MultipartFile item) {
		    if (item != null) {
		        this.item = item;
		        this.faName = item.getOriginalFilename();
		        this.faSize = item.getSize();
		        this.faMime = item.getContentType();
		        this.faFancysize = FileUtils.byteCountToDisplaySize(faSize);
		    }
		}


}
