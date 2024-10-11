package service_btl.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;

import service_btl.Dao.AccountDao;
import service_btl.Impl.AccountDaoImpl;
import service_btl.Impl.AuthorDaoImpl;
import service_btl.Impl.CategoryDaoImpl;
import service_btl.Impl.ChapterDaoImpl;
import service_btl.Impl.CommentDaoImpl;
import service_btl.Impl.FavoriteDaoImpl;
import service_btl.Impl.StoryDaoImpl;
import service_btl.Impl.ViewDaoImpl;
import service_btl.entities.Account;
import service_btl.entities.AccountDTO;
import service_btl.entities.Author;
import service_btl.entities.AuthorDTO;
import service_btl.entities.Category;
import service_btl.entities.CategoryDTO;
import service_btl.entities.Chapter;
import service_btl.entities.ChapterDTO;
import service_btl.entities.Comment;
import service_btl.entities.CommentDTO;
import service_btl.entities.Favorite;
import service_btl.entities.FavoriteDTO;
import service_btl.entities.Story;
import service_btl.entities.StoryDTO;
import service_btl.entities.View;
import service_btl.entities.ViewDTO;

@Path(value = "/service_btl")
public class Service_btl {
	@GET
	@Path("/Account")
	@Produces(MediaType.APPLICATION_JSON)
	public String getlistCategory() {

		List<Account> listCategory = new AccountDaoImpl().getAllUser();
		Gson son = new Gson();
		List<AccountDTO> listData = new ArrayList<AccountDTO>();
		for (Account c : listCategory) {
			AccountDTO cdto = new AccountDTO(c.getAcId(), c.getUserName(), c.getEmail(), c.getPassword(), c.getRole(),
					c.getCreateAt(), c.getUpdateAt(), c.getStatus());
			listData.add(cdto);
		}
		String data = son.toJson(listData);
		return data;

	}
	

	@GET
	@Path("/Account/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getAccountById(@PathParam("id") Integer id) {
		Account account = new AccountDaoImpl().findByUserId(id);
		Gson gson = new Gson();
		AccountDTO adto = new AccountDTO(account.getAcId(), account.getUserName(), account.getEmail(),
				account.getPassword(), account.getRole(), account.getCreateAt(), account.getUpdateAt(),
				account.getStatus());
		String data = gson.toJson(adto);
		return data;
	}

	@POST
	@Path("/Account")
	@Consumes(MediaType.APPLICATION_JSON)
	public String insertAccount(String a) {
		Gson gson = new Gson();
		AccountDTO objDTO = gson.fromJson(a, AccountDTO.class);

		Account account = new Account(objDTO.getAcId(), objDTO.getUserName(), objDTO.getEmail(), objDTO.getPassword(),
				objDTO.getRole(), objDTO.getCreateAt(), objDTO.getUpdateAt(), objDTO.getStatus());
		boolean success = new AccountDaoImpl().insertUser(account);

		String data = gson.toJson(success);
		return data;
	}

	@PUT
	@Path("/Account")
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateAccount(String a) {
		Gson gson = new Gson();
		AccountDTO objDTO = gson.fromJson(a, AccountDTO.class);

		Account account = new Account(objDTO.getAcId(), objDTO.getUserName(), objDTO.getEmail(), objDTO.getPassword(),
				objDTO.getRole(), objDTO.getCreateAt(), objDTO.getUpdateAt(), objDTO.getStatus());
		boolean success = new AccountDaoImpl().updateser(account);

		String data = gson.toJson(success);
		return data;
	}

	@DELETE
	@Path("/Account/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	public String deleteAccount(@PathParam("id") Integer id) {
		boolean success = new AccountDaoImpl().deleteUser(id);
		Gson gson = new Gson();
		String data = gson.toJson(success);
		return data;
	}

	@GET
	@Path("/Author")
	@Produces(MediaType.APPLICATION_JSON)
	public String getAllAuthors() {
		List<Author> authorList = new AuthorDaoImpl().getAllAuthor();
		Gson gson = new Gson();
		List<AuthorDTO> authorDTOList = new ArrayList<>();

		for (Author author : authorList) {
			AuthorDTO authorDTO = new AuthorDTO(author.getAuthorId(), author.getName(), author.getBio(),
					author.getCreateAt(), author.getUpdateAt(), author.getStatus());
			authorDTOList.add(authorDTO);
		}
		String data = gson.toJson(authorDTOList);

		return data;
	}

	@GET
	@Path("/Author/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getAuthorById(@PathParam("id") Integer id) {
		Author author = new AuthorDaoImpl().findByAuthorId(id);
		Gson gson = new Gson();

		AuthorDTO authorDTO = new AuthorDTO(author.getAuthorId(), author.getName(), author.getBio(),
				author.getCreateAt(), author.getUpdateAt(), author.getStatus());

		return gson.toJson(authorDTO);
	}

	@POST
	@Path("/Author")
	@Consumes(MediaType.APPLICATION_JSON)
	public String insertAuthor(String authorData) {
		Gson gson = new Gson();
		AuthorDTO authorDTO = gson.fromJson(authorData, AuthorDTO.class);

		Author author = new Author(authorDTO.getAuthorId(), authorDTO.getName(), authorDTO.getBio(),
				authorDTO.getCreateAt(), authorDTO.getUpdateAt(), authorDTO.getStatus());

		boolean success = new AuthorDaoImpl().insertAuthor(author);
		return gson.toJson(success);
	}

	@PUT
	@Path("/Author")
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateAuthor(String authorData) {
		Gson gson = new Gson();
		AuthorDTO authorDTO = gson.fromJson(authorData, AuthorDTO.class);

		Author author = new Author(authorDTO.getAuthorId(), authorDTO.getName(), authorDTO.getBio(),
				authorDTO.getCreateAt(), authorDTO.getUpdateAt(), authorDTO.getStatus());

		boolean success = new AuthorDaoImpl().updateAuthor(author);
		return gson.toJson(success);
	}

	@DELETE
	@Path("/Author/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	public String deleteAuthor(@PathParam("id") Integer id) {
		boolean success = new AuthorDaoImpl().deleteAuthor(id);
		Gson gson = new Gson();
		return gson.toJson(success);
	}
	//
//	    categories

	@GET
	@Path("/Categories")
	@Produces(MediaType.APPLICATION_JSON)
	public String getAllCategory() {
		List<Category> cateList = new CategoryDaoImpl().getListCategory();
		Gson gson = new Gson();
		List<CategoryDTO> chapterDTOList = new ArrayList<>();

		for (Category cate : cateList) {
			CategoryDTO cateDTO = new CategoryDTO(cate.getCategoryId(),cate.getName(), cate.getDescription(), cate.getStatus(), cate.getCreateAt(), cate.getUpdateAt());
			chapterDTOList.add(cateDTO);
		}

		return gson.toJson(chapterDTOList);
	}
	@GET
	@Path("/Categories/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getCateById(@PathParam("id") Integer id) {
		Category cate = new CategoryDaoImpl().findByCateId(id);
		Gson gson = new Gson();

		CategoryDTO cateDTO = new CategoryDTO(cate.getCategoryId(), cate.getName(), cate.getDescription(),
				cate.getStatus(), cate.getCreateAt(), cate.getUpdateAt() // Map storyId
		);

		return gson.toJson(cateDTO);
	}

	@POST
	@Path("/Categories")
	@Consumes(MediaType.APPLICATION_JSON)
	public String insertCate(String cateData) {
		Gson gson = new Gson();
		CategoryDTO cateDTO = gson.fromJson(cateData, CategoryDTO.class);

		Category cate = new Category(cateDTO.getCategoryID(), 
				cateDTO.getName(), cateDTO.getDescription(),
				cateDTO.getCreateAt(), cateDTO.getUpdateAt(), cateDTO.getStatus());

		boolean success = new CategoryDaoImpl().insertCates(cate);
		return gson.toJson(success);
	}

	@PUT
	@Path("/Categories")
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateCate(String cateData) {
		Gson gson = new Gson();
		CategoryDTO cateDTO = gson.fromJson(cateData, CategoryDTO.class);
		Category cate = new Category(cateDTO.getCategoryID(), 
				cateDTO.getName(), cateDTO.getDescription(),
				cateDTO.getCreateAt(), cateDTO.getUpdateAt(), cateDTO.getStatus());

		boolean success = new CategoryDaoImpl().updateCate(cate);
		return gson.toJson(success);
	}

	@DELETE
	@Path("/Categories/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String deleteCate(@PathParam("id") Integer id) {
		boolean success = new CategoryDaoImpl().deleteCate(id);
		Gson gson = new Gson();
		return gson.toJson(success);
	}
	
	// Stories
	@GET
	@Path("Story")
	@Produces(MediaType.APPLICATION_JSON)
	public String getAllStory() {
		List<Story> storyList = new StoryDaoImpl().getAllStory();
		Gson gson = new Gson();
		List<StoryDTO> storyDTOList = new ArrayList<>();

		for (Story story : storyList) {
			StoryDTO storyDTO = new StoryDTO(story.getStoryId(), story.getTitle(),
					story.getDescription(), story.getCoverImage(), story.getCreateAt(), story.getUpdateAt(),
					story.getStatus(), story.getAuthor().getAuthorId(), story.getCategory().getCategoryId() // Map storyId
			);
			storyDTOList.add(storyDTO);
		}

		return gson.toJson(storyDTOList);
	}

	@GET
	@Path("/Story/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getStoryById(@PathParam("id") Integer id) {
		Story story = new StoryDaoImpl().findByStoryId(id);
		Gson gson = new Gson();

		StoryDTO storyDTO = new StoryDTO(story.getStoryId(), story.getTitle(),
				story.getDescription(), story.getCoverImage(), story.getCreateAt(), story.getUpdateAt(),
				story.getStatus(), story.getAuthor().getAuthorId(), story.getCategory().getCategoryId() // Map storyId
		);
		return gson.toJson(storyDTO);
	}

	@GET
	@Path("/Story/Category/{CategoryId}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getStoryByStoryId(@PathParam("CategoryId") Integer storyId) {
		List<Story> chapterList = new StoryDaoImpl().getStorysbyCategoryId(storyId);
		Gson gson = new Gson();
		List<StoryDTO> storyDTOList = new ArrayList<>();

		for (Story story : chapterList) {
			StoryDTO storyDTO = new StoryDTO(story.getStoryId(), story.getTitle(),
					story.getDescription(), story.getCoverImage(), story.getCreateAt(), story.getUpdateAt(),
					story.getStatus(), story.getAuthor().getAuthorId(), story.getCategory().getCategoryId() // Map storyId
			);
			storyDTOList.add(storyDTO);
		}

		return gson.toJson(storyDTOList);
	}

	@POST
	@Path("/Story")
	@Consumes(MediaType.APPLICATION_JSON)
	public String insertStory(String storyData) {
		Gson gson = new Gson();
		StoryDTO storyDTO = gson.fromJson(storyData, StoryDTO.class);

		Author objAuthor = new Author();
		objAuthor.setAuthorId(storyDTO.getAuthorId());
		
		Category objCategory = new Category();
		objCategory.setCategoryId(storyDTO.getCategoryId());
		
		Story story = new Story(storyDTO.getStoryId(), storyDTO.getTitle(),
				storyDTO.getDescription(), storyDTO.getCoverImage(),  storyDTO.getCreateAt(), storyDTO.getUpdateAt(),
				storyDTO.getStatus(), objAuthor, objCategory);

		boolean success = new StoryDaoImpl().insertStory(story);
		return gson.toJson(success);
	}

	@PUT
	@Path("/Story")
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateStory(String storyData) {
		Gson gson = new Gson();
		StoryDTO storyDTO = gson.fromJson(storyData, StoryDTO.class);
		
		Author objAuthor = new Author();
		objAuthor.setAuthorId(storyDTO.getAuthorId());
		
		Category objCategory = new Category();
		objCategory.setCategoryId(storyDTO.getCategoryId());
		
		Story story = new Story(storyDTO.getStoryId(), storyDTO.getTitle(),
				storyDTO.getDescription(), storyDTO.getCoverImage(),  storyDTO.getCreateAt(), storyDTO.getUpdateAt(),
				storyDTO.getStatus(), objAuthor, objCategory);


		boolean success = new StoryDaoImpl().updateStory(story);
		return gson.toJson(success);
	}

	@DELETE
	@Path("/Story/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String deleteStory(@PathParam("id") Integer id) {
		boolean success = new StoryDaoImpl().deleteStory(id);
		Gson gson = new Gson();
		return gson.toJson(success);
	}
		//

	
	@GET
	@Path("Chapter")
	@Produces(MediaType.APPLICATION_JSON)
	public String getAllChapters() {
		List<Chapter> chapterList = new ChapterDaoImpl().getAllChapter();
		Gson gson = new Gson();
		List<ChapterDTO> chapterDTOList = new ArrayList<>();

		for (Chapter chapter : chapterList) {
			ChapterDTO chapterDTO = new ChapterDTO(chapter.getChapterId(), chapter.getChapterTitle(),
					chapter.getContent(), chapter.getChapterNumber(), chapter.getCreateAt(), chapter.getUpdateAt(),
					chapter.getStatus(), chapter.getStory().getStoryId() // Map storyId
			);
			chapterDTOList.add(chapterDTO);
		}

		return gson.toJson(chapterDTOList);
	}

	@GET
	@Path("/Chapter/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getChapterById(@PathParam("id") Integer id) {
		Chapter chapter = new ChapterDaoImpl().findByChapterId(id);
		Gson gson = new Gson();

		ChapterDTO chapterDTO = new ChapterDTO(chapter.getChapterId(), chapter.getChapterTitle(), chapter.getContent(),
				chapter.getChapterNumber(), chapter.getCreateAt(), chapter.getUpdateAt(), chapter.getStatus(),
				chapter.getStory().getStoryId() // Map storyId
		);

		return gson.toJson(chapterDTO);
	}

	@GET
	@Path("/Chapter/story/{storyId}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getChaptersByStoryId(@PathParam("storyId") Integer storyId) {
		List<Chapter> chapterList = new ChapterDaoImpl().getChaptersbyStoryId(storyId);
		Gson gson = new Gson();
		List<ChapterDTO> chapterDTOList = new ArrayList<>();

		for (Chapter chapter : chapterList) {
			ChapterDTO chapterDTO = new ChapterDTO(chapter.getChapterId(), chapter.getChapterTitle(),
					chapter.getContent(), chapter.getChapterNumber(), chapter.getCreateAt(), chapter.getUpdateAt(),
					chapter.getStatus(), chapter.getStory().getStoryId());
			chapterDTOList.add(chapterDTO);
		}

		return gson.toJson(chapterDTOList);
	}

	@POST
	@Path("/Chapter")
	@Consumes(MediaType.APPLICATION_JSON)
	public String insertChapter(String chapterData) {
		Gson gson = new Gson();
		ChapterDTO chapterDTO = gson.fromJson(chapterData, ChapterDTO.class);

		Story objStory = new Story();
		objStory.setStoryId(chapterDTO.getStoryId());

		Chapter chapter = new Chapter(chapterDTO.getChapterId(), objStory, // Tìm Story từ id
				chapterDTO.getChapterTitle(), chapterDTO.getContent(), chapterDTO.getChapterNumber(),
				chapterDTO.getCreateAt(), chapterDTO.getUpdateAt(), chapterDTO.getStatus());

		boolean success = new ChapterDaoImpl().insertChapter(chapter);
		return gson.toJson(success);
	}

	@PUT
	@Path("/Chapter")
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateChapter(String chapterData) {
		Gson gson = new Gson();
		ChapterDTO chapterDTO = gson.fromJson(chapterData, ChapterDTO.class);
		Story objStory = new Story();
		objStory.setStoryId(chapterDTO.getStoryId());
		Chapter chapter = new Chapter(chapterDTO.getChapterId(), objStory, // Tìm Story từ id
				chapterDTO.getChapterTitle(), chapterDTO.getContent(), chapterDTO.getChapterNumber(),
				chapterDTO.getCreateAt(), chapterDTO.getUpdateAt(), chapterDTO.getStatus());

		boolean success = new ChapterDaoImpl().updateChapter(chapter);
		return gson.toJson(success);
	}

	@DELETE
	@Path("/Chapter/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String deleteChapter(@PathParam("id") Integer id) {
		boolean success = new ChapterDaoImpl().deleteChapter(id);
		Gson gson = new Gson();
		return gson.toJson(success);
	}
	//

	@GET
	@Path("/Comment")
	@Produces(MediaType.APPLICATION_JSON)
	public String getAllComments() {
		List<Comment> commentList = new CommentDaoImpl().getAllComment();
		Gson gson = new Gson();
		List<CommentDTO> commentDTOList = new ArrayList<>();

		for (Comment comment : commentList) {
			CommentDTO commentDTO = new CommentDTO(comment.getCommentId(), comment.getAccount().getAcId(), // Map
																											// accountId
					comment.getStory().getStoryId(), // Map storyId
					comment.getChapter().getChapterId(), // Map chapterId
					comment.getContent(), comment.getCreateAt(), comment.getUpdateAt(), comment.getStatus());
			commentDTOList.add(commentDTO);
		}

		return gson.toJson(commentDTOList);
	}

	@GET
	@Path("/Comment/story/{storyId}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getCommentsByStoryId(@PathParam("storyId") Integer storyId) {
		List<Comment> commentList = new CommentDaoImpl().getCommentbyStoryId(storyId);
		Gson gson = new Gson();
		List<CommentDTO> commentDTOList = new ArrayList<>();

		for (Comment comment : commentList) {
			CommentDTO commentDTO = new CommentDTO(comment.getCommentId(), comment.getAccount().getAcId(), // Map
																											// accountId
					comment.getStory().getStoryId(), // Map storyId
					comment.getChapter().getChapterId(), // Map chapterId
					comment.getContent(), comment.getCreateAt(), comment.getUpdateAt(), comment.getStatus());
			commentDTOList.add(commentDTO);
		}

		return gson.toJson(commentDTOList);
	}

	@GET
	@Path("/Comment/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getCommentById(@PathParam("id") Integer id) {
		Comment comment = new CommentDaoImpl().findByCommentId(id);
		Gson gson = new Gson();

		CommentDTO commentDTO = new CommentDTO(comment.getCommentId(), comment.getAccount().getAcId(),
				comment.getStory().getStoryId(), comment.getChapter().getChapterId(), comment.getContent(),
				comment.getCreateAt(), comment.getUpdateAt(), comment.getStatus());

		return gson.toJson(commentDTO);
	}

	@POST
	@Path("/Comment")

	@Consumes(MediaType.APPLICATION_JSON)
	public String insertComment(String commentData) {
		Gson gson = new Gson();
		CommentDTO commentDTO = gson.fromJson(commentData, CommentDTO.class);

		Account account = new Account();
		account.setAcId(commentDTO.getAccountId());

		Story story = new Story();
		story.setStoryId(commentDTO.getStoryId());

		Chapter chapter = new Chapter();
		chapter.setChapterId(commentDTO.getChapterId());

		Comment comment = new Comment(commentDTO.getCommentId(), account, story, chapter, commentDTO.getContent(),
				commentDTO.getCreateAt(), commentDTO.getUpdateAt(), commentDTO.getStatus());

		boolean success = new CommentDaoImpl().insertComment(comment);
		return gson.toJson(success);
	}

	@PUT
	@Path("/Comment")

	@Consumes(MediaType.APPLICATION_JSON)
	public String updateComment(String commentData) {
		Gson gson = new Gson();
		CommentDTO commentDTO = gson.fromJson(commentData, CommentDTO.class);

		Account account = new Account();
		account.setAcId(commentDTO.getAccountId());

		Story story = new Story();
		story.setStoryId(commentDTO.getStoryId());

		Chapter chapter = new Chapter();
		chapter.setChapterId(commentDTO.getChapterId());

		Comment comment = new Comment(commentDTO.getCommentId(), account, story, chapter, commentDTO.getContent(),
				commentDTO.getCreateAt(), commentDTO.getUpdateAt(), commentDTO.getStatus());

		boolean success = new CommentDaoImpl().updateComment(comment);
		return gson.toJson(success);
	}

	@DELETE
	@Path("/Comment/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String deleteComment(@PathParam("id") Integer id) {
		boolean success = new CommentDaoImpl().deleteComment(id);
		Gson gson = new Gson();
		return gson.toJson(success);
	}

	//

	@GET
	@Path("/Favorite")
	@Produces(MediaType.APPLICATION_JSON)
	public String getAllFavorites() {
		List<Favorite> favoriteList = new FavoriteDaoImpl().getFavourite();
		Gson gson = new Gson();
		List<FavoriteDTO> favoriteDTOList = new ArrayList<>();

		for (Favorite favorite : favoriteList) {
			FavoriteDTO favoriteDTO = new FavoriteDTO(favorite.getFavoriteId(), favorite.getAccount().getAcId(),
					favorite.getStory().getStoryId(), favorite.getCreateAt(), favorite.getUpdateAt(),
					favorite.getStatus());
			favoriteDTOList.add(favoriteDTO);
		}

		return gson.toJson(favoriteDTOList);
	}

	@GET
	@Path("/Favorite/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getFavoriteById(@PathParam("id") Integer id) {
		Favorite favorite = new FavoriteDaoImpl().getFavouriteById(id);
		Gson gson = new Gson();

		FavoriteDTO favoriteDTO = new FavoriteDTO(favorite.getFavoriteId(), favorite.getAccount().getAcId(),
				favorite.getStory().getStoryId(), favorite.getCreateAt(), favorite.getUpdateAt(), favorite.getStatus());

		return gson.toJson(favoriteDTO);
	}

	@GET
	@Path("Favorite/user/{userId}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getFavoritesByUserId(@PathParam("userId") Integer userId) {
		List<Favorite> favoriteList = new FavoriteDaoImpl().getFavouritesbyUserId(userId);
		Gson gson = new Gson();
		List<FavoriteDTO> favoriteDTOList = new ArrayList<>();

		for (Favorite favorite : favoriteList) {
			FavoriteDTO favoriteDTO = new FavoriteDTO(favorite.getFavoriteId(), favorite.getAccount().getAcId(),
					favorite.getStory().getStoryId(), favorite.getCreateAt(), favorite.getUpdateAt(),
					favorite.getStatus());
			favoriteDTOList.add(favoriteDTO);
		}

		return gson.toJson(favoriteDTOList);
	}

	@POST
	@Path("/Favorite")
	@Consumes(MediaType.APPLICATION_JSON)
	public String insertFavorite(String favoriteData) {
		Gson gson = new Gson();
		FavoriteDTO favoriteDTO = gson.fromJson(favoriteData, FavoriteDTO.class);

		Account account = new Account();
		account.setAcId(favoriteDTO.getAccountId());

		Story story = new Story();
		story.setStoryId(favoriteDTO.getStoryId());

		Favorite favorite = new Favorite(favoriteDTO.getFavoriteId(), account, story, favoriteDTO.getCreateAt(),
				favoriteDTO.getUpdateAt(), favoriteDTO.getStatus());

		boolean success = new FavoriteDaoImpl().insertFavourites(favorite);
		return gson.toJson(success);
	}

	@PUT
	@Path("/Favorite")
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateFavorite(String favoriteData) {
		Gson gson = new Gson();
		FavoriteDTO favoriteDTO = gson.fromJson(favoriteData, FavoriteDTO.class);

		Account account = new Account();
		account.setAcId(favoriteDTO.getAccountId());

		Story story = new Story();
		story.setStoryId(favoriteDTO.getStoryId());

		Favorite favorite = new Favorite(favoriteDTO.getFavoriteId(), account, story, favoriteDTO.getCreateAt(),
				favoriteDTO.getUpdateAt(), favoriteDTO.getStatus());

		boolean success = new FavoriteDaoImpl().updateFavourite(favorite);
		return gson.toJson(success);
	}

	@DELETE
	@Path("/Favorite/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String deleteFavorite(@PathParam("id") Integer id) {
		boolean success = new FavoriteDaoImpl().deleteFavourite(id);
		Gson gson = new Gson();
		return gson.toJson(success);
	}

	//

	@GET
	@Path("/View")
	@Produces(MediaType.APPLICATION_JSON)
	public String getAllViews() {
		List<View> viewList = new ViewDaoImpl().getView();
		Gson gson = new Gson();
		List<ViewDTO> viewDTOList = new ArrayList<>();

		for (View view : viewList) {
			ViewDTO viewDTO = new ViewDTO(view.getViewId(), view.getAccount().getAcId(), view.getStory().getStoryId(),
					view.getChapter().getChapterId(), view.getViewedAt(), view.getCreateAt(), view.getUpdateAt(),
					view.getStatus());
			viewDTOList.add(viewDTO);
		}

		return gson.toJson(viewDTOList);
	}

	// Lấy view theo viewId
	@GET
	@Path("/View/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getViewById(@PathParam("id") Integer id) {
		View view = new ViewDaoImpl().getViewById(id);
		Gson gson = new Gson();

		if (view != null) {
			ViewDTO viewDTO = new ViewDTO(view.getViewId(), view.getAccount().getAcId(), view.getStory().getStoryId(),
					view.getChapter().getChapterId(), view.getViewedAt(), view.getCreateAt(), view.getUpdateAt(),
					view.getStatus());
			return gson.toJson(viewDTO);
		}
		return gson.toJson(null);
	}

	// Thêm mới một view
	@POST
	@Path("/View")
	@Consumes(MediaType.APPLICATION_JSON)
	public String insertView(String viewData) {
		Gson gson = new Gson();
		ViewDTO viewDTO = gson.fromJson(viewData, ViewDTO.class);

		Account account = new Account();
		account.setAcId(viewDTO.getAccountId());

		Story story = new Story();
		story.setStoryId(viewDTO.getStoryId());

		Chapter chapter = new Chapter();
		chapter.setChapterId(viewDTO.getChapterId());

		View view = new View(viewDTO.getViewId(), account, story, chapter, viewDTO.getViewedAt(), viewDTO.getCreateAt(),
				viewDTO.getUpdateAt(), viewDTO.getStatus());

		boolean success = new ViewDaoImpl().insertViews(view);
		return gson.toJson(success);
	}

	// Cập nhật một view
	@PUT
	@Path("/View")
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateView(String viewData) {
		Gson gson = new Gson();
		ViewDTO viewDTO = gson.fromJson(viewData, ViewDTO.class);

		Account account = new Account();
		account.setAcId(viewDTO.getAccountId());

		Story story = new Story();
		story.setStoryId(viewDTO.getStoryId());

		Chapter chapter = new Chapter();
		chapter.setChapterId(viewDTO.getChapterId());

		View view = new View(viewDTO.getViewId(), account, story, chapter, viewDTO.getViewedAt(), viewDTO.getCreateAt(),
				viewDTO.getUpdateAt(), viewDTO.getStatus());

		boolean success = new ViewDaoImpl().updateView(view);
		return gson.toJson(success);
	}

	// Xóa view theo viewId
	@DELETE
	@Path("/View/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String deleteView(@PathParam("id") Integer id) {
		boolean success = new ViewDaoImpl().deleteView(id);
		Gson gson = new Gson();
		return gson.toJson(success);
	}
}
