package service_btl.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class LoginController {
	@RequestMapping(value = { "/login", "" })
	public String login() {
		return "login"; // Trả về trang đăng nhập
	}
	@RequestMapping(value = { "/err500"})
	public String err() {
		
		return "err500"; // Trả về trang đăng nhập
	}
}
