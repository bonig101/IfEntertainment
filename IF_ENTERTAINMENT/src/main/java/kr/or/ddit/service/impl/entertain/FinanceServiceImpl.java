package kr.or.ddit.service.impl.entertain;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.inject.Inject;

import org.apache.poi.ss.formula.functions.Column;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.entertain.IFinanceMapper;
import kr.or.ddit.service.entertain.IFinanceService;
import kr.or.ddit.vo.entertain.FinanceExcelVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FinanceServiceImpl implements IFinanceService {

	@Inject
	private IFinanceMapper financeMapper;

	@Override
	public List<FinanceExcelVO> excelDown() {
		return financeMapper.excelDown();
	}

	@Override
	public void insert(MultipartFile file) {
		try (InputStream is = file.getInputStream()) {
			financeMapper.delete();
			Workbook workbook = WorkbookFactory.create(is);
			Sheet sheet = workbook.getSheetAt(0);
			
			for (int i = 1; i < 6; i++) {
				Row row = sheet.getRow(i);

				FinanceExcelVO financeExcelVO = new FinanceExcelVO();

				financeExcelVO.setFiYear(getCellValueAsString(row.getCell(0))); // Year
				financeExcelVO.setFiAsset(getCellValueAsString(row.getCell(1))); // Asset
				financeExcelVO.setFiCasset(getCellValueAsString(row.getCell(2))); // CAsset
				financeExcelVO.setFiNasset(getCellValueAsString(row.getCell(3))); // NAsset
				financeExcelVO.setFiLiabilities(getCellValueAsString(row.getCell(4))); // Liabilities
				financeExcelVO.setFiCliabilities(getCellValueAsString(row.getCell(5))); // CLiabilities
				financeExcelVO.setFiNliabilities(getCellValueAsString(row.getCell(6))); // NLiailities
				financeExcelVO.setFiTotalcapital(getCellValueAsString(row.getCell(7))); // Totalcapital
				financeExcelVO.setFiPcse(getCellValueAsString(row.getCell(8))); // Pcse
				financeExcelVO.setFiCapital(getCellValueAsString(row.getCell(9))); // Capital
				financeExcelVO.setFiSis(getCellValueAsString(row.getCell(10))); // Sis
				financeExcelVO.setFiOthercapital(getCellValueAsString(row.getCell(11))); // Ohtercapital
				financeExcelVO.setFiAoci(getCellValueAsString(row.getCell(12))); // Aoci
				financeExcelVO.setFiRe(getCellValueAsString(row.getCell(13))); // Re
				financeExcelVO.setFiNci(getCellValueAsString(row.getCell(14))); // Nci

//				System.out.println(financeExcelVO);
						financeMapper.insert(financeExcelVO); // DB에 저장

			}

		} catch (IOException e) {
			e.printStackTrace();
			// 적절한 예외 처리 로직을 추가하세요.
		}
	}

	private String getCellValueAsString(Cell cell) {
		if (cell == null) {
			return "";
		}

		switch (cell.getCellType()) {
		case STRING:
			return cell.getStringCellValue();
		case NUMERIC:
			return Double.toString(cell.getNumericCellValue());
		case BOOLEAN:
			return Boolean.toString(cell.getBooleanCellValue());
		default:
			return "";
		}
	}

}
