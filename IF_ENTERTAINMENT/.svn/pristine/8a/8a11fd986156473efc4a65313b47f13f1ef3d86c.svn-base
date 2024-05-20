package kr.or.ddit.vo.entertain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AlbumVO {

	
	 private int alNo;
	 private String alName;
	 private String alDate;
	 private String alPhoto;
	 private String alUrl;
	 private String alIntro;
	 private String alDelyn;
	 private String agId;
	 private MultipartFile alTempPhoto;
	 
	   public AlbumVO() {}
	   
	     public AlbumVO(MultipartFile alTempPhoto) {
			if(alTempPhoto != null ) {
				this.alTempPhoto = alTempPhoto;
			}
		}
	 
}
