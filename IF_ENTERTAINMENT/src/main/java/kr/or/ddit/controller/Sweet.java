package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/sweet")
public class Sweet {

	@RequestMapping(value="/alert.do" , method = RequestMethod.GET)
	public String sweet(Model model) {
		
		return "sweetAlert";
	}
}
