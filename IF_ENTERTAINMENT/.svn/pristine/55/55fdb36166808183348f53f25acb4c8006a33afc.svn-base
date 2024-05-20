package kr.or.ddit.vo.goods;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.controller.goods.GoodsRetrieveController;
import lombok.Data;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class GoodsVO {
	 private int goodsNo;
	 
	 @NotBlank(message = "상품명을 입력해주세요.")
	 private String goodsName;
	 
	 @Pattern(regexp = "^[0-9]+$", message = "숫자만 입력해주세요.")
	 private Integer goodsPrice;
	 
	 @Pattern(regexp = "^[0-9]+$", message = "숫자만 입력해주세요.")
	 private Integer goodsQuantity;
	 private String goodsRegdate;
	 private String goodsMembership;
	 
	 @NotBlank(message = "아티스트 카테고리를 선택해주세요.")
	 private String goodsArtist;
	 private String goodsDisplay;
	 private String goodsThumbnail;
	 @Pattern(regexp = "^[0-9]+$", message = "숫자만 입력해주세요.")
	 private Integer goodsLimit;
	 @Pattern(regexp = "^[0-9]+$", message = "숫자만 입력해주세요.")
	 private Integer goodsAutocndtn;
	 @Pattern(regexp = "^[0-9]+$", message = "숫자만 입력해주세요.")
	 private Integer goodsAutobuycount;
	 
	 @NotBlank(message = "카테고리(중분류)를 선택해주세요.")
	 private String gcId;
	 
	 @NotBlank(message = "썸네일을 등록해주세요.")
	 private MultipartFile goodsThumb;
	 
	 private Integer[] delProdNo;
	 private String[] goodsTag; 
	 private String agId; 
	 private String userNo;
	 private List<GoodsTagVO> goodsTagList;
	 
	 private int gbPrice;
	 private int gbNo;
	 private int gbQuantity;
	 
	 
	 // 해당 상품의 총 판매금액(굿즈 통계를 위한 필드)
	 private int goodsTotalPrice;
	 
	 @NotBlank(message = "상세 이미지를 선택해주세요.")
	 private MultipartFile[] goodsFile;
	 private List<GoodsAttachfileVO> goodsFileList;
	 
	 public void setGoodsFile(MultipartFile[] goodsFile) {
		 this.goodsFile = goodsFile;
		 if (goodsFile != null) {
			List<GoodsAttachfileVO> goodsFileList = new ArrayList<GoodsAttachfileVO>();
			for (MultipartFile item : goodsFile) {
				if (StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				GoodsAttachfileVO goodsFileVO = new GoodsAttachfileVO(item);
				goodsFileList.add(goodsFileVO);
			}
			this.goodsFileList = goodsFileList;
		}
	 }
	 
	 public void setGoodsTag(String[] goodsTag) {
		 if(goodsTag != null && goodsTag.length > 0) {
			 this.goodsTag = goodsTag;
			 for (String tag : goodsTag) {
				if(tag.equals("membership")) {
					goodsMembership = "Y";
				}else {
					goodsMembership = "N";
				}
			 }
		 }
	 }
	 
}
