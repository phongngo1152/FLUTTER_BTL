package service_btl.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping(value = {"","/login"})
	public String login() {
		return "login";
	}
	@RequestMapping(value = "/dashboard")
	public String dashboard() {
		return "admin/dashboard";
	}
	@RequestMapping(value = "/authors")
	public String listAuthor() {
		return "admin/author_list";
	}
	@RequestMapping(value = "/author-update")
	public String updateAuthor() {
		return "admin/author_update";
	}
	
	
	
	
	//
	@RequestMapping(value = "/categories")
	public String listCate() {
		return "admin/cate_list";
	}
	
	@RequestMapping(value = "/stories")
	public String listBook() {
		return "admin/stories_list";
	}
}
