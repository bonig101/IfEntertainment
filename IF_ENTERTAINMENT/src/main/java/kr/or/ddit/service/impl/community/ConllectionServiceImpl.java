package kr.or.ddit.service.impl.community;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.community.ICollectionMapper;
import kr.or.ddit.service.community.ICollectionService;
import kr.or.ddit.vo.common.MyCollectionVO;

@Service
public class ConllectionServiceImpl implements ICollectionService {
	
	@Inject
	private ICollectionMapper collectionMapper;

	@Override
	public List<MyCollectionVO> myCollectionList(int userNo) {
		return collectionMapper.myCollectionList(userNo);
	}

	@Override
	public void insertGoodsPurchaseCollection(int userNo) {
		collectionMapper.insertGoodsPurchaseCollection(userNo);
	}

}
