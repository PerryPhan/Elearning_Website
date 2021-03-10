package app.controller;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
public class Testpage {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("/testpage")
	public String test(ModelMap model, HttpSession ss){
		model.addAttribute("link", "public");
		return "course/testpage";
		
	}
}
