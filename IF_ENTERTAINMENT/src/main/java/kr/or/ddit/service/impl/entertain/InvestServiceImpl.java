package kr.or.ddit.service.impl.entertain;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.entertain.IInvestMapper;
import kr.or.ddit.service.entertain.IInvestService;

@Service
public class InvestServiceImpl implements IInvestService {

	@Inject
	private IInvestMapper investMapper;
}
