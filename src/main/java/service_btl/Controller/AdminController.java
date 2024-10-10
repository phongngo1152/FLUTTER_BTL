package service_btl.Controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service_btl.Dao.CategoryDAO;
import service_btl.Dao.ChapterDao;
import service_btl.Dao.CommentDao;
import service_btl.Dao.StoryDao;
import service_btl.Impl.AccountDaoImpl;
import service_btl.entities.Account;
import service_btl.entities.Category;
import service_btl.entities.Chapter;
import service_btl.entities.Comment;
import service_btl.entities.Story;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private CommentDao commentDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private StoryDao storyDAO;

	@Autowired
	private AccountDaoImpl accountDao; // Hoặc AccountService nếu bạn sử dụng service layer

	@Autowired
	private ChapterDao chapterDAO;

	@RequestMapping(value = {"/dashboard" })
	public String dashboard(HttpSession session) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/admin/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
		return "admin/dashboard"; // Trả về trang dashboard
	}

	@RequestMapping(value = "/authors")
	public String listAuthor(HttpSession session, Model model) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
        List<Account> list = accountDao.getAccbyrRole(1);
        model.addAttribute("list",list);
		return "admin/author_list"; // Trả về trang danh sách tác giả
	}
	@RequestMapping(value = "/authors-form")
	public String formCreateAuthor(HttpSession session, Model model) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
        Account acc = new Account();
        model.addAttribute("acc",acc);
		return "admin/author_create"; // Trả về trang danh sách tác giả
	}
	
	@PostMapping("/saveAuthor")
	public String saveAuthor(@ModelAttribute("acc") Account acc, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
        acc.setCreateAt(new Date());
        acc.setUpdateAt(new Date());
		accountDao.insertUser(acc);
		return "redirect:/admin/authors";
	}
	
	@RequestMapping(value = "/author-update")
	public String updateAuthor(HttpSession session) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
		return "admin/author_update"; // Trả về trang cập nhật tác giả
	}

	//
	@RequestMapping(value = "/categories")
	public String listCate(Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
		List<Category> cate = categoryDAO.getListCategory();
		model.addAttribute("cate", cate);
		return "admin/cate_list";
	}

	@RequestMapping(value = "/cate-create-form")
	public String formCreateCate(Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
		Category cate = new Category();
		model.addAttribute("c", cate);
		return "admin/cate_create";
	}

	// Thêm danh mục mới
	@PostMapping("/saveCategory")
	public String saveCategory(@ModelAttribute("category") Category category, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
		category.setCreateAt(new Date());
		category.setUpdateAt(new Date());
		categoryDAO.insertCates(category);
		return "redirect:/admin/categories";
	}

	// Cập nhật danh mục
	@GetMapping("/edit/{id}")
	public String editCategory(Model model, @PathVariable("id") Integer cateId, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
		Category cate = categoryDAO.findByCateId(cateId);
		model.addAttribute("cate", cate);
		model.addAttribute("cateId", cateId);
		return "/admin/cate_update";
	}

	@PostMapping("/updateCategory")
	public String updateCategory(@ModelAttribute("cate") Category cate, @RequestParam("categoryId") Integer storyId,
			HttpServletRequest request, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
		cate.setCreateAt(new Date());
		cate.setUpdateAt(new Date());
		categoryDAO.updateCate(cate);
		return "redirect:/admin/categories";
	}

	// Xóa danh mục theo ID
	@GetMapping("/deleteCategory/{id}")
	public String deleteCategory(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes,
			HttpSession session) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
		Category cate = categoryDAO.findByCateId(id);
		if (cate != null) {
			categoryDAO.deleteCate(id);
			redirectAttributes.addFlashAttribute("message", "Category deleted successfully!");
		} else {
			redirectAttributes.addFlashAttribute("error", "Category delete failed!");
		}
		return "redirect:/admin/categories";

	}

	@RequestMapping(value = "/stories")
	public String listBook(Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
		List<Story> story = storyDAO.getAllStory();
		model.addAttribute("s", story);
		return "admin/stories_list";
	}

	@GetMapping("/editStory/{id}")
	public String editStory(Model model, @PathVariable("id") Integer id, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
		Story story = storyDAO.findByStoryId(id);
		String categoryName = story.getCategoryName();
		String authorName = story.getAuthorName();

		// Thêm vào model để hiển thị trong JSP
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("authorName", authorName);
		model.addAttribute("img", story.getCoverImage());
		model.addAttribute("s", story);
		List<Chapter> listchapter = chapterDAO.getChaptersbyStoryId(id);
		int count_chapter = listchapter.size();
		model.addAttribute("listchapter", listchapter);
		model.addAttribute("count_chapter", count_chapter);
		return "admin/stories_update";
	}

	@PostMapping("/updateStory")
	public String updateStory(@ModelAttribute("s") Story story, @RequestParam("storyId") Integer storyId,
			@RequestParam(value = "status", required = false) Boolean status, HttpServletRequest request, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
		// Tìm story theo storyId
		story = storyDAO.findByStoryId(storyId);

		if (story != null) {
			// Cập nhật trạng thái
			story.setStatus(status != null && status); // Nếu status không null và true, thì set là true

			// Gọi phương thức để cập nhật trạng thái vào cơ sở dữ liệu
			boolean result = storyDAO.updateStoryStatus(storyId, story.getStatus());

			// Kiểm tra kết quả và chuyển hướng
			if (result) {
				return "redirect:/admin/stories"; // Redirect đến trang danh sách câu chuyện
			} else {
				// Xử lý lỗi (có thể thêm thông báo lỗi vào mô hình để hiển thị)
				request.setAttribute("errorMessage", "Cập nhật thất bại.");
			}
		} else {
			request.setAttribute("errorMessage", "Không tìm thấy câu chuyện.");
		}
		return "redirect:/admin/stories"; // Redirect nếu có lỗi
	}


	@RequestMapping(value = "comments/{id}/detail-{cmtI}")
	public String commentDetail(Model model, HttpSession session, @PathVariable("id") Integer id,@PathVariable("cmtI") Integer cmtI) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
        Story storyId = storyDAO.findByStoryId(id);
        if (storyId == null ) {
			return "notfound";
		} 
        Comment cmtId = commentDAO.findByCommentId(cmtI);
        if (cmtId == null ) {
			return "notfound";
		} 
		List<Comment> cmt = commentDAO.getCommentbyStoryId(id); // add role vào đây
		model.addAttribute("cmt", cmt);
		model.addAttribute("cmtId", cmtId);
		model.addAttribute("storyId", storyId);
		return "admin/comment_detail";
	}
	@RequestMapping(value = "/comments")
	public String comments(Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

        // Kiểm tra nếu tài khoản chưa đăng nhập (account == null)
        if (account == null) {
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra role (giả sử 0 là admin, 1 là author)
        if (account.getRole() != 0) {
            return "redirect:/err500"; // Chuyển hướng nếu không phải admin
        }
		List<Comment> cmt = commentDAO.getAllComment(); // add role vào đây
		model.addAttribute("cmt", cmt);
		return "admin/comment_list";
	}
	
	 @RequestMapping(value = "/logout")
	    public String logout(HttpSession session) {
	        session.invalidate(); // Xóa phiên làm việc
	        return "redirect:/login"; // Chuyển hướng về trang đăng nhập
	    }
	    @PostMapping("/login")
	    public String login(@RequestParam("email") String email, // Thay đổi từ username thành email
	                        @RequestParam("password") String password,
	                        Model model, HttpSession session) {
	        System.out.println("Đang cố gắng đăng nhập với email: " + email); // In ra email đang cố gắng đăng nhập
	        Account account = accountDao.checklogin(email, password); // Thay đổi từ username thành email
	        if (account != null) {
	            session.setAttribute("account", account); // Lưu thông tin người dùng vào session
	         // Kiểm tra role của người dùng
	            if (account.getRole() == 0) {
	                return "redirect:/admin/dashboard"; // Nếu role = 0, chuyển về trang admin
	            } else if (account.getRole() == 1) {
	                return "redirect:/author/stories"; // Nếu role = 1, chuyển về trang author
	            } else {
	                // Nếu role không hợp lệ, chuyển về trang đăng nhập với thông báo lỗi
	                model.addAttribute("error", "Role không hợp lệ!");
	                return "login";
	            }// Chuyển hướng đến dashboard
	        } else {
	            model.addAttribute("error", true); // Thêm lỗi nếu đăng nhập không thành công
	            return "login"; // Trả về lại trang đăng nhập
	        }
	    }
}
