package service_btl.Dao;

import java.util.List;

import service_btl.entities.Story;


public interface StoryDao {
	public List<Story> getAllStory();

	public List<Story> findByStoryName(String name);

	public boolean insertStory(Story story);

	public boolean updateStory(Story story);

	public boolean updateStoryStatus(Integer storyId, Boolean newStatus);

	public Story findByStoryId(Integer storyId);

	public boolean deleteStory(Integer id);

	public List<Story> getStorysbyCategoryId(Integer storyId);
	
	// lấy danh sách story thro tác giả
	public List<Story> getStorysbyAuthorId(Integer authorId);
	
	
	public List<Story> getTop5StoryNew();
	
	public List<Story> getTop5StoryFavorite();
	public List<Story> getStoryAPI();
	public Story findByStoryIdAPI(Integer storyId);
	
	
}
