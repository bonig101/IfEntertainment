package kr.or.ddit.service.impl.entertain;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.entertain.ICompanyInfoMapper;
import kr.or.ddit.service.entertain.ICompanyInfoService;

@Service
public class CompanyServiceImpl implements ICompanyInfoService {

	@Inject
	private ICompanyInfoMapper companyInfoMapper;
}
