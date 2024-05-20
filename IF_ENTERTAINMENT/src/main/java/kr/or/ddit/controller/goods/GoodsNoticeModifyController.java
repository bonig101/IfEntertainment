package kr.or.ddit.controller.goods;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

import kr.or.ddit.service.goods.IGoodsNoticeService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.goods.GoodsNoticeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 굿즈샵 공지사항 수정 및 삭제 컨트롤러
 * @author 성이수
 */
@Controller
@Slf4j
@RequestMapping("/goods/notice")
public class GoodsNoticeModifyController {
	
	@Inject
	private IGoodsNoticeService goodsNoticeService;
	
	/**
	 * 체크한 공지사항 게시물을 삭제하는 컨트롤러
	 * @param noticeNos
	 * @param req
	 * @param model
	 * @param ra
	 * @return
	 */
	@RequestMapping(value = "/ckeckDelete.do", method = RequestMethod.POST)
	public String noticeCheckDelete(
			int[] noticeNos, HttpServletRequest req, Model model,
			RedirectAttributes ra) {
		String goPage = "";
		
		for (int noticeNo : noticeNos) {
			ServiceResult result = goodsNoticeService.deleteGoodsNotice(req, noticeNo);
			if (result.equals(ServiceResult.OK)) {
				goPage = "redirect:/goods/notice/list.do";
			}else {
				ra.addAttribute("message", "서버오류, 다시시도해주세요.");
				goPage = "redirect:/goods/notice/list.do";
			}
		}
		return goPage;
	}

	// 수정할 때에도 메인공지 여부 체크박스로 선택할 수 있도록

	/**
	 * 굿즈샵 공지사항 게시물을 삭제하는 컨트롤러
	 * @param req
	 * @param ra
	 * @param bfNo
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String goodNoticedelete(
			HttpServletRequest req,
			RedirectAttributes ra,
			int bfNo, Model model) {

		String goPage = "";
		
		ServiceResult result = goodsNoticeService.deleteGoodsNotice(req, bfNo);
		if (result.equals(ServiceResult.OK)) {
			//ra.addFlashAttribute("message", "게시글 삭제가 완료되었습니다.");
			goPage = "redirect:/goods/notice/list.do";
		}else {
			ra.addAttribute("message", "서버오류, 다시 시도해주세요.");
			goPage = "redirect:/goods/notice/list.do";
		}
		return goPage;
	}
	
	/**
	 * 굿즈샵 공지사항 수정화면을 띄우는 컨트롤러
	 * @param bfNo
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String updateForm(int bfNo, Model model) {
		GoodsNoticeVO goodsNoticeVO = goodsNoticeService.selectGoodsNotice(bfNo);
		model.addAttribute("goodsNotice", goodsNoticeVO);
		model.addAttribute("status", "u");
		return "admin/goods/addGoodsNotice"; 
	}
	
	/**
	 * 굿즈샵 공지사항을 수정하는 컨트롤러
	 * @param req
	 * @param ra
	 * @param goodsNoticeVO
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String goodsNoticeupdate(
			HttpServletRequest req,
			RedirectAttributes ra,
			GoodsNoticeVO goodsNoticeVO, Model model) {
		String goPage="";
		
		if (goodsNoticeVO.getBfDisplay() == null) {
			goodsNoticeVO.setBfDisplay("N");
		}
		
		ServiceResult result = goodsNoticeService.updateGoodsNotice(req, goodsNoticeVO);
		
		if (result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "게시글 수정이 완료 되었습니다.");
			goPage = "redirect:/goods/notice/detail.do?bfNo="+goodsNoticeVO.getBfNo();
		}else {
			model.addAttribute("prod", goodsNoticeVO);
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("status", "u");
			goPage = "goods/notice/form";
		}
		return goPage;
	}
	
}
