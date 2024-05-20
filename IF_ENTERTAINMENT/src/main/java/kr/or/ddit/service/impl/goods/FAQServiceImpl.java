package kr.or.ddit.service.impl.goods;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.goods.IFAQMapper;
import kr.or.ddit.service.goods.IFAQService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.goods.FaqVO;

@Service
public class FAQServiceImpl implements IFAQService {
	
	@Inject
	private IFAQMapper faqMapper;

	@Override
	public int selectUserFaqListCount(PaginationInfoVO<FaqVO> pagingVO) {
		return faqMapper.selectUserFaqListCount(pagingVO);
	}

	@Override
	public List<FaqVO> selectFaqList(PaginationInfoVO<FaqVO> pagingVO) {
		return faqMapper.selectFaqList(pagingVO);
	}

	@Override
	public int selectAdminFaqListCount(PaginationInfoVO<FaqVO> pagingVO) {
		return faqMapper.selectAdminFaqListCount(pagingVO);
	}

	@Override
	public List<FaqVO> selecAdminFaqList(PaginationInfoVO<FaqVO> pagingVO) {
		return faqMapper.selecAdminFaqList(pagingVO);
	}

	@Override
	public ServiceResult faqInsert(FaqVO faqVO) {
		ServiceResult result = null;
		
		int status = faqMapper.faqInsert(faqVO);
		
		if (status > 0) {
			result = ServiceResult.OK;
		}else {
			result =ServiceResult.FAILED;
		}
		return result;
	}

}
