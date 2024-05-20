package kr.or.ddit.controller.entertain;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import lombok.extern.slf4j.Slf4j;

/**
 * 주식정보 컨트롤러
 * @author 홍진영
 *
 */
@Controller
@Slf4j
@RequestMapping("/entertain/stock")
public class StockController {
	
	// 1. 주식가격 가져올 수 있는 API 활용해서 예쁘게 뿌려보기
	
	/**
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/info.do", method = RequestMethod.GET)
	public String getStock(Model model) throws IOException {
		
		// 네이버 - 하이브 주식 메인 페이지 링크
		String naverMainUrl = "https://finance.naver.com/item/main.nhn?code=352820";
		
		// 네이버 - 하이브 주식 정보 페이지 링크
		String siseUrl = "https://finance.naver.com/item/sise.naver?code=352820";
		
		// 하이브 - 주가정보 페이지 링크
		String hiveUrl = "https://ir.gsifn.io/bighit/ir_current.html?koreng=1";
		
		Document doc1 = Jsoup.connect(naverMainUrl).get();
		Document doc2 = Jsoup.connect(siseUrl).get();
		Document doc3 = Jsoup.connect(hiveUrl).get();
		
		
		
		
		// 주식 기본정보를 가져온다.
		Elements summary = doc3.select("div").select("#quote_chart");
		String curPrice = summary.select("#cur_close").text();
		String upDown = summary.select("#updown").text();
		String percent = summary.select("#percent").text();
		String upDownMark = percent.contains("-") ? "down" : "up";
		String open = summary.select("#open").text();
		String high = summary.select("#high").text();
		String low = summary.select("#low").text();
		String volume = summary.select("#volume").text();
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("curPrice", curPrice);
		map.put("upDown", upDown);
		map.put("percent", percent);
		map.put("open", open);
		map.put("high", high);
		map.put("low", low);
		map.put("volume", volume);
		
//		log.info("curPrice : {}", map.get("curPrice"));
//		log.info("upDown : {}", map.get("upDown"));
		log.info("percent : {}", map.get("percent"));
//		log.info("open : {}", map.get("open"));
//		log.info("high : {}", map.get("high"));
//		log.info("low : {}", map.get("low"));
//		log.info("volume : {}", map.get("volume"));
		
		
		
		// 주식 차트를 네이버증권에서 가져온다.
		Elements chart = doc1.getElementsByAttributeValue("id", "img_chart_area");
		
		// 주식 주문정보를 네이버에서 가져온다.
		Elements table_jumun = doc2.select("tbody").get(1).select("tr");
		
		Iterator<Element> it = table_jumun.iterator();
		while(it.hasNext()) {
			log.info("### it : {}", it.next());
		}
		
		// 주식 호가창 정보를 가져온다.
		Elements table_hoga = doc2.select("tbody").get(2).select("tr");
		
		Iterator<Element> it2 = table_jumun.iterator();
		while(it.hasNext()) {
			log.info("### it : {}", it2.next());
		}
		
		model.addAttribute("map", map);
		model.addAttribute("chart", chart);
		model.addAttribute("table_jumun", table_jumun);
		model.addAttribute("table_hoga", table_hoga);
		model.addAttribute("upDownMark", upDownMark);
		model.addAttribute("sideName", "investor");
		
		return "entertain/stock";
	}
	
	

}
