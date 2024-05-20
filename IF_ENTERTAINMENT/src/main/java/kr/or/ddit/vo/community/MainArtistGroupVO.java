package kr.or.ddit.vo.community;

import java.util.Date;
import java.util.List;

import kr.or.ddit.vo.entertain.ArtistVO;
import lombok.Data;

@Data
public class MainArtistGroupVO {
	 private String agId;
	 private String agName;
	 private Date agDate;
	 private String agIntro;
	 private String agProfile;
	 private String agDelyn;
	 private List<ArtistVO> artistList;
	private int userNo;
	private Date artistBirth;
	private String artistIntro;
	private String artistFakename;
	private String artistDelyn;
	private String userId;
	private String userName;
	private String userType;
	private String userProfile;
		
}
