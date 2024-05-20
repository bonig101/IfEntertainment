package kr.or.ddit.vo.goods;

import java.util.Date;

import lombok.Data;

@Data
public class goodsBuyVO {
	 private int gbNo;
	 private int gbPrice;
	 private int gbQuantity;
	 private Date gbDate;
	 private int goodsNo;
	 private String gbStatus;
	 
	 private String goodsName;
	 private Integer goodsQuantity;
	 private String goodsThumbnail;
	 private Integer goodsAutobuycount;
	 private String goodsArtist;
	 private String gcId;
}

