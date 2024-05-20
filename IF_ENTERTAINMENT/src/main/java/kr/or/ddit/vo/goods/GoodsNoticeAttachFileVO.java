package kr.or.ddit.vo.goods;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsNoticeAttachFileVO {
	private MultipartFile item;
	 private int baNo;
	 private int bfNo;
	 private String baName;
	 private long baSize;
	 private String baFancysize;
	 private String baMime;
	 private String baSavepath;
	 private int baDowncount;
	 
	 public GoodsNoticeAttachFileVO() {}
	 
	 public GoodsNoticeAttachFileVO(MultipartFile item) {
		 this.item = item;
		 this.baName = item.getOriginalFilename();
		 this.baSize = item.getSize();
		 this.baMime = item.getContentType();
		 this.baFancysize = FileUtils.byteCountToDisplaySize(baSize);
	 }
}
