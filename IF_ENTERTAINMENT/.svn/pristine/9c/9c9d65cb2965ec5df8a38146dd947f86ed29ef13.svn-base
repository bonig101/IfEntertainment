package kr.or.ddit.controller.goods;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.goods.IOrderService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.goods.OrderDetailVO;
import kr.or.ddit.vo.goods.OrderIssueVO;
import kr.or.ddit.vo.goods.OrderVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 교환/환불/취소와 배송전/배송완료 등 주문이슈와 관련된 내역을 처리하는 컨트롤러
 * 
 * @author 성이수
 */
@Controller
@Slf4j
@RequestMapping("/goods/order")
public class OrderIssueController {

	@Inject
	private IOrderService orderService;
	
	/**
	 * 체크 된 항목을 배송전/후 처리하는 컨트롤러
	 * @param orderNos
	 * @param orderDelivery
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/deliverycheckUpdate.do", method = RequestMethod.POST)
	public String deliveryCheckUpdate(String[] orderNos, 
			String orderDelivery, Model model) {
		String goPage = "";

		List<OrderVO> orderList = new ArrayList<OrderVO>();
		for (String orderNo : orderNos) {
			OrderVO orderVO = new OrderVO();
			orderVO.setOrderNo(orderNo);
			orderVO.setOrderDelivery(orderDelivery);
			orderList.add(orderVO);
		}
		
		ServiceResult result = orderService.updateDeliverycomplate(orderList);
		if (result.equals(ServiceResult.OK)) {
			if (orderDelivery.equals("Y")) {
				goPage = "redirect:/goods/order/adminDeliveryBeforeList.do";
			}else {
				goPage = "redirect:/goods/order/adminDeliveryAfterList.do";
			}
		}
		return goPage;
		
	}
	
	/**
	 * 배송 전/후 처리를 하는 컨트롤러
	 * @param orderVO
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/deliveryUpdate.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> deliveryUpdate(
			OrderVO orderVO, Model model){
		ResponseEntity<ServiceResult> entity = null;
		
		log.info("@@@@@@orderVO : {}", orderVO);
		
		ServiceResult result = orderService.updateDeliverycomplate(orderVO);

		if (result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<ServiceResult>(ServiceResult.OK, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<ServiceResult>(ServiceResult.FAILED, HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}

	/**
	 * 주문상세내역을 불러오는 컨트롤러(관리자)
	 * @param currentPage
	 * @param searchType
	 * @param searchWord
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/deliveryDetail.do", method = RequestMethod.GET)
	public String deliveryDetail(String orderNo, Model model) {
		
		OrderDetailVO orderDetailVO = new OrderDetailVO();
		orderDetailVO.setOrderNo(orderNo);
		List<OrderDetailVO> orderDetailList = orderService.selectOrderDetailList(orderDetailVO);
		
		model.addAttribute("orderDetailList", orderDetailList);
		return "admin/goods/orderDeliveryDetail";
	}
	
	/**
	 * 배송후 주문내역을 불러오는 컨트롤러(관리자)
	 * @param currentPage
	 * @param searchType
	 * @param searchWord
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/adminDeliveryAfterList.do")
	public String orderDeliveryAfterList(
			@RequestParam(required = false, defaultValue = "Y") String orderDelivery,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "orderNo") String searchType,
			@RequestParam(required = false) String searchWord, Model model) {
		PaginationInfoVO<OrderVO> pagingVO = new PaginationInfoVO<OrderVO>();
		
		// 배송 처리 전, 후를 구분하는 필드
		pagingVO.setOrderDelivery(orderDelivery);

		if (StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord.toUpperCase());

			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = orderService.selectOrderDeliveryListCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		List<OrderVO> OrderDeliveryList = orderService.selectOrderDeliveryList(pagingVO);
		pagingVO.setDataList(OrderDeliveryList);

		model.addAttribute("status", "c");
		model.addAttribute("pagingVO", pagingVO);

		return "admin/goods/orderDeliveryBeforeList";
		
	}
	
	/**
	 * 배송전 주문내역을 불러오는 컨트롤러(관리자)
	 * @param currentPage
	 * @param searchType
	 * @param searchWord
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/adminDeliveryBeforeList.do")
	public String orderDeliveryBeforeList(
			@RequestParam(required = false, defaultValue = "N") String orderDelivery,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "orderNo") String searchType,
			@RequestParam(required = false) String searchWord, Model model) {
		PaginationInfoVO<OrderVO> pagingVO = new PaginationInfoVO<OrderVO>();
		
		// 배송 처리 전, 후를 구분하는 필드
		pagingVO.setOrderDelivery(orderDelivery);

		if (StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord.toUpperCase());

			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = orderService.selectOrderDeliveryListCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		List<OrderVO> OrderDeliveryList = orderService.selectOrderDeliveryList(pagingVO);
		pagingVO.setDataList(OrderDeliveryList);

		model.addAttribute("pagingVO", pagingVO);

		return "admin/goods/orderDeliveryBeforeList";
		
	}
	
	
	/**
	 * 교환 요청을 교환 완료 처리해주는 컨트롤러(관리자)
	 * @param orderIssueVO
	 * @param ra
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/change.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> updateOrderChange(
			@RequestBody OrderIssueVO orderIssueVO,
			RedirectAttributes ra, Model model) {
		ResponseEntity<ServiceResult> entity = null;

		log.info("orderIssuceVO {} : ", orderIssueVO);

		ServiceResult result = orderService.updateOrderIssueChange(orderIssueVO);

		if (result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<ServiceResult>(ServiceResult.OK, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<ServiceResult>(ServiceResult.FAILED, HttpStatus.BAD_REQUEST);
		}
		return entity;

	}

	/**
	 * 주문교환 내역 첫 화면 띄우는 컨트롤러 (관리자)
	 * @param orderIssueVO
	 * @param ra
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/adminChangelist.do")
	public String adminOrderChangeList(
			@RequestParam(required = false, defaultValue = "1") String odStatus,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "orderNo") String searchType,
			@RequestParam(required = false) String searchWord, Model model) {
		PaginationInfoVO<OrderVO> pagingVO = new PaginationInfoVO<OrderVO>();
		
		log.info("@@@@@@odStatus : {}", odStatus);
		
		// 제품교환 처리 전, 후를 구분하는 필드
		pagingVO.setOdStatus(odStatus);

		if (StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);

			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = orderService.selectAllOrderChangeListCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		List<OrderVO> AllorderChangeList = orderService.selectAllorderChangeList(pagingVO);
		pagingVO.setDataList(AllorderChangeList);

		model.addAttribute("pagingVO", pagingVO);
		
		return "admin/goods/orderChangeList";
	}

	/**
	 * 모든 주문 교환 내역 확인페이지를 불러오는 컨트롤러(관리자)
	 * 
	 * @param currentPage
	 * @param searchType
	 * @param searchWord
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	@RequestMapping(value = "/adminChangelistajax.do")
	public ResponseEntity<PaginationInfoVO<OrderVO>> adminOrderChangeListAjax(
			@RequestParam String odStatus,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "orderNo") String searchType,
			@RequestParam(required = false) String searchWord, Model model) {
		PaginationInfoVO<OrderVO> pagingVO = new PaginationInfoVO<OrderVO>();
		
		log.info("odStatus : {}", odStatus);
		
		// 제품교환 처리 전, 후를 구분하는 필드
		pagingVO.setOdStatus(odStatus);

		if (StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord.toUpperCase());

			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = orderService.selectAllOrderChangeListCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		List<OrderVO> AllorderChangeList = orderService.selectAllorderChangeList(pagingVO);
		pagingVO.setDataList(AllorderChangeList);
		log.info("### pagingVO : {}", pagingVO);

		return new ResponseEntity<PaginationInfoVO<OrderVO>>(pagingVO, HttpStatus.OK);
	}

	/**
	 * 모든 주문 취소 내역 확인페이지를 불러오는 컨트롤러(관리자)
	 * 
	 * @param currentPage
	 * @param searchType
	 * @param searchWord
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/adminCancellist.do")
	public String adminOrderCancelList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "orderNo") String searchType,
			@RequestParam(required = false) String searchWord, Model model) {
		PaginationInfoVO<OrderVO> pagingVO = new PaginationInfoVO<OrderVO>();

		if (StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);

			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord.toUpperCase());
		}
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = orderService.selectAllorderCancelListCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		List<OrderVO> AllOrderCancelList = orderService.selectAllorderCancelList(pagingVO);
		pagingVO.setDataList(AllOrderCancelList);

		model.addAttribute("pagingVO", pagingVO);

		return "admin/goods/orderCancelList";
	}

	/**
	 * 나의 주문 이슈 내역 확인페이지를 불러오는 컨트롤러(사용자)
	 * 
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value = "/issuelist.do")
	public String goodsOrderIssue(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			Model model) {
		PaginationInfoVO<OrderIssueVO> pagingVO = new PaginationInfoVO<OrderIssueVO>(4, 5);

		//int userNo = 111;
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserVO userVO = user.getUser();
		int userNo = userVO.getUserNo();
		pagingVO.setUserNo(userNo);

		pagingVO.setCurrentPage(currentPage);
		int totalRecord = orderService.selectOrderIssueListCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		List<OrderIssueVO> orderIssueList = orderService.selectOrderIssueList(pagingVO);
		log.info("@@@orderIssueList : {}", orderIssueList);
		pagingVO.setDataList(orderIssueList);

		model.addAttribute("pagingVO", pagingVO);

		return "goods/goodsOrderIssue";
	}

	/**
	 * 주문한 제품 취소에 대한 실행 컨트롤러 (사용자)
	 * 
	 * @param map
	 * @param ra
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value = "/orderCancel.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> insertOrderCancel(@RequestBody OrderIssueVO orderIssueVO,
			RedirectAttributes ra, Model model) {

		ResponseEntity<ServiceResult> entity = null;

		ServiceResult result = orderService.insertGoodsIssue(orderIssueVO);

		if (result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<ServiceResult>(ServiceResult.OK, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<ServiceResult>(ServiceResult.FAILED, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/**
	 * 주문한 제품 교환요청에 대한 실행 컨트롤러 (사용자)
	 * 
	 * @param map
	 * @param ra
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value = "/orderChange.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> insertOrderChage(OrderIssueVO orderIssueVO, HttpServletRequest req,
			RedirectAttributes ra, Model model) {

		ResponseEntity<ServiceResult> entity = null;

		log.info("orderIssueVO {} : ", orderIssueVO);

		ServiceResult result = orderService.insertIssueChange(req, orderIssueVO);

		if (result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<ServiceResult>(ServiceResult.OK, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<ServiceResult>(ServiceResult.FAILED, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
