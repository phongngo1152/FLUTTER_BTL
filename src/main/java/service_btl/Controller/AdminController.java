package service_btl.Controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import service_btl.Dao.CommentDao;
import service_btl.Dao.StoryDao;
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
	
	@RequestMapping(value = { "", "/login" })
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
	public String listCate(Model model) {
		List<Category> cate = categoryDAO.getListCategory();
		model.addAttribute("cate", cate);
		return "admin/cate_list";
	}

	@RequestMapping(value = "/cate-create-form")
	public String formCreateCate(Model model) {
		Category cate = new Category();
		model.addAttribute("c", cate);
		return "admin/cate_create";
	}

	// Thêm danh mục mới
	@PostMapping("/saveCategory")
	public String saveCategory(@ModelAttribute("category") Category category) {
		category.setCreateAt(new Date());
		category.setUpdateAt(new Date());
		categoryDAO.insertCates(category);
		return "redirect:/admin/categories";
	}

	// Cập nhật danh mục
	@GetMapping("/edit/{id}")
	public String editCategory(Model model, @PathVariable("id") Integer cateId) {
		Category cate = categoryDAO.findByCateId(cateId);
		model.addAttribute("cate", cate);
		model.addAttribute("cateId", cateId);
		return "/admin/cate_update";
	}

	@PostMapping("/updateCategory")
	public String updateCategory(@ModelAttribute("cate") Category cate, @RequestParam("categoryId") Integer storyId,
			HttpServletRequest request) {

		cate.setCreateAt(new Date());
		cate.setUpdateAt(new Date());
		categoryDAO.updateCate(cate);
		return "redirect:/admin/categories";
	}

	// Xóa danh mục theo ID
	@GetMapping("/deleteCategory/{id}")
	public String deleteCategory(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
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
	public String listBook(Model model) {
		List<Story> story = storyDAO.getAllStory();
		model.addAttribute("s",story);
		return "admin/stories_list";
	}
	@GetMapping("/editStory/{id}")
	public String editStory(Model model, @PathVariable("id") Integer id) {
		
		Story story = storyDAO.findByStoryId(id);
		String categoryName = story.getCategoryName();
		String authorName = story.getAuthorName();
		
		// Thêm vào model để hiển thị trong JSP
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("authorName", authorName);
		 model.addAttribute("img", story.getCoverImage());
		model.addAttribute("s", story);
		return "admin/stories_update";
	}

	@PostMapping("/updateStory")
	public String updateStory(@ModelAttribute("s") Story story, 
	                          @RequestParam("storyId") Integer storyId, 
	                          @RequestParam(value = "status", required = false) Boolean status,
	                          HttpServletRequest request) {
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
	@RequestMapping(value = "/comments")
	public String comments(Model model) {
		List<Comment> cmt = commentDAO.getAllComment(); // add role vào đây
		model.addAttribute("cmt", cmt);
		return "author/comment_list";
	}
}
