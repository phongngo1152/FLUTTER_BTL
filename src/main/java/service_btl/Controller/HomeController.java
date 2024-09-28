package service_btl.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	 
	@RequestMapping(value = {"","/login"})
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/register")
	public String register() {
		return "register";
	}
}
