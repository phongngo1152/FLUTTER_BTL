package service_btl.Controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import service_btl.Dao.AuthorDao;
import service_btl.Dao.CategoryDAO;
import service_btl.Dao.StoryDao;
import service_btl.Service.Service_btl;
import service_btl.entities.Author;
import service_btl.entities.Category;
import service_btl.entities.Story;
import service_btl.entities.StoryDTO;

@Controller
@RequestMapping("/author")
public class AuthorController {
	@Autowired
	private StoryDao storyDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private AuthorDao authorDAO;

	// Trang đăng nhập
	@RequestMapping(value = {"", "/login"})
	public String login() {
	    return "login";
	}

	// Trang đăng ký
	@RequestMapping(value = "/register")
	public String register() {
	    return "register";
	}

	// Danh sách câu chuyện, kiểm tra đăng nhập
	@RequestMapping(value = "/stories")
	public String stories(Model model, HttpSession session) {
	    if (session.getAttribute("account") == null) {
	        return "redirect:/admin/login"; // Chuyển hướng về trang đăng nhập nếu không có tài khoản
	    }

	    List<Story> list = storyDAO.getAllStory();
	    model.addAttribute("list", list);
	    return "author/stories_list";
	}

	// Form tạo câu chuyện, kiểm tra đăng nhập
	@RequestMapping(value = "/form-create-story")
	public String createStory(Model model, HttpSession session) {
	    if (session.getAttribute("account") == null) {
	        return "redirect:/admin/login"; // Chuyển hướng về trang đăng nhập nếu không có tài khoản
	    }

	    Story story = new Story();
	    model.addAttribute("s", story);
	    List<Category> listcate = categoryDAO.getListCategory();
	    model.addAttribute("listcate", listcate);
	    List<Author> listauthor = authorDAO.getAllAuthor();
	    model.addAttribute("listauthor", listauthor);
	    return "author/stories_create";
	}

	// Lưu câu chuyện
	@PostMapping("/saveStory")
	public String saveStory(
	        @ModelAttribute("story") Story story,
	        @RequestParam("coverImageFile") MultipartFile coverImageFile,
	        HttpServletRequest request) {

	    // Chỉ thực hiện lưu câu chuyện nếu đã đăng nhập
	    HttpSession session = request.getSession();
	    if (session.getAttribute("account") == null) {
	        return "redirect:/admin/login"; // Chuyển hướng về trang đăng nhập nếu không có tài khoản
	    }

	    if (!coverImageFile.isEmpty()) {
	        try {
	            // Lưu ảnh coverImage vào thư mục trên server
	            String uploadDir = request.getServletContext().getRealPath("resources/image");
	            String fileName = coverImageFile.getOriginalFilename();
	            File file = new File(uploadDir, fileName);
	            coverImageFile.transferTo(file);

	            // Lưu đường dẫn ảnh vào story
	            story.setCoverImage(fileName);

	        } catch (Exception e) {
	            e.printStackTrace();
	            return "error";
	        }
	    }

	    story.setCreateAt(new Date());
	    story.setUpdateAt(new Date());
	    storyDAO.insertStory(story);

	    return "redirect:/author/stories";
	}

	// Form cập nhật câu chuyện, kiểm tra đăng nhập
	@RequestMapping(value = "/form-update-story/{id}")
	public String showEditStoryForm(@PathVariable("id") Integer id, Model model, HttpSession session) {
	    if (session.getAttribute("account") == null) {
	        return "redirect:/admin/login"; // Chuyển hướng về trang đăng nhập nếu không có tài khoản
	    }

	    Story story = storyDAO.findByStoryId(id);
	    model.addAttribute("s", story);
	    return "author/stories_update";
	}

	// Cập nhật câu chuyện, kiểm tra đăng nhập
	@RequestMapping(value = "/update-story/{id}")
	public String updateStory(
	        @PathVariable("id") Integer id,
	        @ModelAttribute("story") Story story,
	        @RequestParam("coverImageFile") MultipartFile coverImageFile,
	        HttpServletRequest request) {

	    // Chỉ thực hiện cập nhật câu chuyện nếu đã đăng nhập
	    HttpSession session = request.getSession();
	    if (session.getAttribute("account") == null) {
	        return "redirect:/admin/login"; // Chuyển hướng về trang đăng nhập nếu không có tài khoản
	    }

	    if (!coverImageFile.isEmpty()) {
	        try {
	            // Lưu ảnh coverImage vào thư mục trên server
	            String uploadDir = request.getServletContext().getRealPath("/uploads/");
	            String fileName = coverImageFile.getOriginalFilename();
	            File file = new File(uploadDir, fileName);
	            coverImageFile.transferTo(file);

	            // Lưu đường dẫn ảnh vào story
	            story.setCoverImage(fileName);

	        } catch (Exception e) {
	            e.printStackTrace();
	            return "error";
	        }
	    }

	    story.setUpdateAt(new Date());
	    storyDAO.updateStory(story);

	    return "redirect:/author/stories";
	}

	// Danh sách chương, kiểm tra đăng nhập
	@RequestMapping(value = "/chapter")
	public String chapters(HttpSession session) {
	    if (session.getAttribute("account") == null) {
	        return "redirect:/admin/login"; // Chuyển hướng về trang đăng nhập nếu không có tài khoản
	    }
	    return "author/chapter_list";
	}

	// Form tạo chương, kiểm tra đăng nhập
	@RequestMapping(value = "/create-chapter")
	public String createChapter(HttpSession session) {
	    if (session.getAttribute("account") == null) {
	        return "redirect:/admin/login"; // Chuyển hướng về trang đăng nhập nếu không có tài khoản
	    }
	    return "author/chapter_create";
	}

	// Danh sách bình luận, kiểm tra đăng nhập
	@RequestMapping(value = "/comments")
	public String comments(HttpSession session) {
	    if (session.getAttribute("account") == null) {
	        return "redirect:/admin/login"; // Chuyển hướng về trang đăng nhập nếu không có tài khoản
	    }
	    return "author/comment_list";
	}
}
