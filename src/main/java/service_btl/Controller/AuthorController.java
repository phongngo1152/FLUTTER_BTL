package service_btl.Controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service_btl.Dao.AuthorDao;
import service_btl.Dao.CategoryDAO;
import service_btl.Dao.ChapterDao;
import service_btl.Dao.CommentDao;
import service_btl.Dao.StoryDao;
import service_btl.Service.Service_btl;
import service_btl.entities.Author;
import service_btl.entities.Category;
import service_btl.entities.Chapter;
import service_btl.entities.Comment;
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

	@Autowired
	private ChapterDao chapterDAO;

	@Autowired
	private CommentDao commentDAO;

	@RequestMapping(value = { "", "/login" })
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/register")
	public String register() {
		return "register";
	}

	// STORY

	@RequestMapping(value = "/stories")
	public String stories(Model model) {
		List<Story> list = storyDAO.getAllStory();
		model.addAttribute("list", list);
		return "author/stories_list";
	}

	@RequestMapping(value = "/form-create-story")
	public String createStory(Model model) {
		Story story = new Story();
		model.addAttribute("s", story);
		List<Category> listcate = categoryDAO.getListCategory();
		model.addAttribute("listcate", listcate);
		List<Author> listauthor = authorDAO.getAllAuthor();
		model.addAttribute("listauthor", listauthor);
		return "author/stories_create";
	}

	@PostMapping("/saveStory")
	public String saveStory(@ModelAttribute("story") Story story,
			@RequestParam("coverImageFile") MultipartFile coverImageFile, HttpServletRequest request) {

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

	@RequestMapping(value = "/form-update-story/{id}")
	public String showEditStoryForm(@PathVariable("id") Integer id, Model model) {
		Story story = storyDAO.findByStoryId(id);
		if (story == null) {
			return "notfound";
		}
		model.addAttribute("story", story);
		List<Chapter> listchapter = chapterDAO.getChaptersbyStoryId(id);
		int count_chapter = listchapter.size();
		model.addAttribute("listchapter", listchapter);
		model.addAttribute("count_chapter", count_chapter);
		model.addAttribute("idurl", id);
		List<Category> listcate = categoryDAO.getListCategory();
		model.addAttribute("listcate", listcate);

		List<Author> listauthor = authorDAO.getAllAuthor();
		model.addAttribute("listauthor", listauthor);

		return "author/stories_update";
	}

	@PostMapping("/updateStory")
	public String updateStory(@ModelAttribute("story") Story story,
			@RequestParam("coverImageFile") MultipartFile coverImageFile, HttpServletRequest request) {

		Story existingStory = storyDAO.findByStoryId(story.getStoryId());

		if (existingStory == null) {
			return "notfound"; // Xử lý lỗi nếu không tìm thấy câu chuyện
		}

		if (!coverImageFile.isEmpty()) {
			// Nếu có ảnh mới được chọn
			try {
				// Lưu ảnh coverImage mới vào thư mục trên server
				String uploadDir = request.getServletContext().getRealPath("resources/image");
				String fileName = coverImageFile.getOriginalFilename();
				File file = new File(uploadDir, fileName);
				coverImageFile.transferTo(file);

				// Lưu đường dẫn ảnh mới vào story
				story.setCoverImage(fileName);
			} catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
		} else {
			// Nếu không chọn ảnh mới, giữ lại ảnh cũ
			story.setCoverImage(existingStory.getCoverImage());
		}

		// Cập nhật các trường khác của story
		story.setCreateAt(existingStory.getCreateAt()); // giữ nguyên ngày tạo
		story.setUpdateAt(new Date()); // cập nhật ngày update

		storyDAO.updateStory(story);

		return "redirect:/author/stories"; // Chuyển hướng về trang danh sách câu chuyện
	}

	@RequestMapping(value = "/deleteStory/{id}", method = RequestMethod.GET)
	public String deleteStory(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		Story story = storyDAO.findByStoryId(id);
		List<Chapter> chapter = chapterDAO.getChaptersbyStoryId(id);
		int countChapter = chapter.size();
		List<Comment> cmt = commentDAO.getCommentbyStoryId(id);
		int countCmt = cmt.size();
		if (story != null && countChapter == 0 || story != null && countChapter == 0
				|| story != null && countChapter == 0 && countChapter == 0) {
			storyDAO.deleteStory(id);
			redirectAttributes.addFlashAttribute("message", "Story deleted successfully!");
		} else {
			redirectAttributes.addFlashAttribute("error", "Story delete failed, because contains comment or chapter!");
		}

		return "redirect:/author/stories"; // Điều hướng về trang danh sách câu chuyện
	}

	// CHAPTER

	@RequestMapping(value = "/form-update-story/{id}/create-chapter")
	public String createChapter(Model model, @PathVariable("id") Integer storyId) {
		Story story = storyDAO.findByStoryId(storyId);
		if (story == null) {
			return "notfound";
		} else {
			model.addAttribute("s", story);
			Chapter chapter = new Chapter();
			model.addAttribute("chapter", chapter);
			return "author/chapter_create";
		}

	}

	@PostMapping("/form-update-story/{id}/saveChapter")
	public String saveChapter(@ModelAttribute("chapter") Chapter chapter, @PathVariable("id") Integer storyId,
			HttpServletRequest request) {

		Story story = storyDAO.findByStoryId(storyId);
		if (story != null) {
			chapter.setStory(story);
			chapter.setCreateAt(new Date());
			chapter.setUpdateAt(new Date());
			chapterDAO.insertChapter(chapter);

			return "redirect:/author/form-update-story/" + storyId;
		} else {
			return "notfound";
		}

	}

	@RequestMapping(value = "/form-update-story/{id}/edit-chapter/{idChapter}")
	public String editChapter(Model model, @PathVariable("idChapter") Integer idChapter,
			@PathVariable("id") Integer storyId) {

		Story story = storyDAO.findByStoryId(storyId);
		Chapter chapterid = chapterDAO.findByChapterId(idChapter);
		if (story == null || chapterid == null) {
			return "notfound";
		} else {
			Chapter chapter = chapterDAO.findByChapterId(idChapter);
			model.addAttribute("chapter", chapter);
			model.addAttribute("idChapter", idChapter);
			return "author/chapter_update";
		}

	}

	@PostMapping("/updateChapter")
	public String updateChapter(@ModelAttribute("chapter") Chapter chapter, @RequestParam("story.storyId") Integer storyId,
			HttpServletRequest request) {
		
			chapter.setCreateAt(new Date());
			chapter.setUpdateAt(new Date());
			chapterDAO.updateChapter(chapter);

			return "redirect:/author/form-update-story/" + storyId;
	}
	@RequestMapping(value = "/form-update-story/{storyId}/deleteStory/{id}", method = RequestMethod.GET)
	public String deleteChapter(@PathVariable("id") Integer id, @PathVariable("storyId") Integer storyId, RedirectAttributes redirectAttributes) {
		Chapter chapter = chapterDAO.findByChapterId(id);
		
		if (chapter != null) {
			chapterDAO.deleteChapter(id);
			redirectAttributes.addFlashAttribute("message", "Chapter deleted successfully!");
		} else {
			redirectAttributes.addFlashAttribute("error", "Chapter delete failed!");
		}

		return "redirect:/author/form-update-story/"+ storyId; // Điều hướng về trang danh sách câu chuyện
	}

	// COMMENT

	@RequestMapping(value = "/comments")
	public String comments(Model model) {
		List<Comment> cmt = commentDAO.getCommentbyAccId(2); // add role vào đây
		model.addAttribute("cmt", cmt);
		return "author/comment_list";
	}

	@RequestMapping(value = "/form-update-comment/{id}")
	public String formUpdateComment(Model model, @PathVariable("id") Integer id) {
//		Comment cmt = new Comment();
//		model.addAttribute("cmt", cmt);
//		model.addAttribute(id);
//		List<Comment> story = commentDAO.getCommentbyStoryId(id);
		return "author/comment_update";
	}


}
