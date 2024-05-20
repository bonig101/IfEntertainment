package kr.or.ddit.vo.entertain;

import java.util.Date;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AuditionRegisterVO {

	private int arNo;
	
//	@NotBlank(message = "제목(20자이내)을 입력해주세요.")
//	@Size(max = 20)
	private String arTitle;
	
//	@NotBlank(message = "이름을 입력해주세요.")
//	@Pattern(regexp = "^[a-zA-Z]*$", message = "특수 문자나 숫자는 입력할 수 없습니다.")
	private String arName;
	
//	@NotNull(message = "성별를 선택해주세요.")
	private String arGender;
	
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String arBirth;
	
//	@Pattern(
//	    regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#$%^&*()-+=]).{8,}$",
//	    message = "대문자 1개 이상, 소문자 1개 이상, 숫자 1개 이상, 특수문자 1개 이상을 포함한 8자 이상을 입력해주세요."
//	)
	private String arPw;
	private String arPw1;
	
//	@Pattern(regexp = "^\\d{3}-\\d{3,4}-\\d{4}$", message = "올바른 전화번호형식이 아닙니다.")
	private String arTelno;
	
//	@Email(message = "올바른 이메일 형식이 아닙니다.")
	private String arEmail;
	
//	@NotBlank(message = "신장을 입력해주세요.")
	private String arHeight;
	
//	@NotBlank(message = "체중를 입력해주세요.")
	private String arWeight;
	
//	@NotBlank(message = "지원분야를 선택해주세요.")
	private String arCategory;
	
	private String arEducation;
	private String arSpecialty;
	private String arCareer;
	private String arPhoto;
	private String arVideo;
	private Date arRegdate;
	private String arCancel;
	private String arNation;
	
	private MultipartFile auditionPhotoFile;
	private MultipartFile auditionVideoFile;
	
	public AuditionRegisterVO() {
	}
	
	public AuditionRegisterVO(MultipartFile auditionPhotoFile, MultipartFile auditionVideoFile) {
		if(auditionPhotoFile != null && auditionVideoFile != null ) {
			this.auditionPhotoFile = auditionPhotoFile;
			this.auditionVideoFile = auditionVideoFile;
		}
	}
}
