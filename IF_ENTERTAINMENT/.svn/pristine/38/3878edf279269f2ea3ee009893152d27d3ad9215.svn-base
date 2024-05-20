package kr.or.ddit.controller.entertain;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.entertain.IArtistService;
import kr.or.ddit.vo.entertain.AlbumVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 아티스트 앨범 등록 컨트롤러
 * @author 조재훈
 */
@Controller
@Slf4j
@RequestMapping("/entertain/artist/album")
public class ArtistAlbumInsertController {
	// 앨범 등록시 앨범에 속한 수록곡들도 함께 업로드가 되도록(트랜잭션)
	
	@Inject
	private IArtistService artistService;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/albumInsertForm.do" ,method = RequestMethod.GET)
	public String albumInsertForm(String agId, Model model) {
		model.addAttribute("agId", agId);
		
		return "admin/entertain/albumInsertForm";
	}
	
	/**
	 * @param albumVO
	 * @param trackNames
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public ResponseEntity<?> albumInsert(AlbumVO albumVO, 
            @RequestParam(value ="trackName[]", required = false ) List<String> trackNames,
            HttpServletRequest req) {
			log.info("albumVO ??" + albumVO);
			int status = artistService.albumInsert(albumVO, req, trackNames);
			if(status > 0) {
		        String successMessage = "앨범이 성공적으로 추가되었습니다.";
		        return new ResponseEntity<>(successMessage, HttpStatus.OK);
		    } else {
		        String errorMessage = "앨범 추가에 실패했습니다.";
		        return new ResponseEntity<>(errorMessage, HttpStatus.BAD_REQUEST);
		    }
}
}