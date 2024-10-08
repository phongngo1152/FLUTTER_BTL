package service_btl.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service_btl.Impl.AccountDaoImpl;
import service_btl.entities.Account;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AccountDaoImpl accountDao; // Hoặc AccountService nếu bạn sử dụng service layer

    @RequestMapping(value = {"/login"})
    public String login() {
        return "login"; // Trả về trang đăng nhập
    }

    @RequestMapping(value = {"","/dashboard"})
    public String dashboard(HttpSession session) {
        if (session.getAttribute("account") == null) {
            return "redirect:/admin/login"; // Chuyển hướng về trang đăng nhập nếu không có tài khoản
        }
        return "admin/dashboard"; // Trả về trang dashboard
    }

    @RequestMapping(value = "/authors")
    public String listAuthor(HttpSession session) {
        if (session.getAttribute("account") == null) {
            return "redirect:/admin/login"; // Chuyển hướng về trang đăng nhập nếu không có tài khoản
        }
        return "admin/author_list"; // Trả về trang danh sách tác giả
    }

    @RequestMapping(value = "/author-update")
    public String updateAuthor(HttpSession session) {
        if (session.getAttribute("account") == null) {
            return "redirect:/admin/login"; // Chuyển hướng về trang đăng nhập nếu không có tài khoản
        }
        return "admin/author_update"; // Trả về trang cập nhật tác giả
    }

    @RequestMapping(value = "/categories")
    public String listCate(HttpSession session) {
        if (session.getAttribute("account") == null) {
            return "redirect:/admin/login"; // Chuyển hướng về trang đăng nhập nếu không có tài khoản
        }
        return "admin/cate_list"; // Trả về trang danh sách thể loại
    }

    @RequestMapping(value = "/stories")
    public String listBook(HttpSession session) {
        if (session.getAttribute("account") == null) {
            return "redirect:/admin/login"; // Chuyển hướng về trang đăng nhập nếu không có tài khoản
        }
        return "admin/stories_list"; // Trả về trang danh sách sách
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Xóa phiên làm việc
        return "redirect:/admin/login"; // Chuyển hướng về trang đăng nhập
    }
    @PostMapping("/login")
    public String login(@RequestParam("email") String email, // Thay đổi từ username thành email
                        @RequestParam("password") String password,
                        Model model, HttpSession session) {
        System.out.println("Đang cố gắng đăng nhập với email: " + email); // In ra email đang cố gắng đăng nhập
        Account account = accountDao.checklogin(email, password); // Thay đổi từ username thành email
        if (account != null) {
            session.setAttribute("account", account); // Lưu thông tin người dùng vào session
            return "redirect:/admin/dashboard"; // Chuyển hướng đến dashboard
        } else {
            model.addAttribute("error", true); // Thêm lỗi nếu đăng nhập không thành công
            return "login"; // Trả về lại trang đăng nhập
        }
    }
}

