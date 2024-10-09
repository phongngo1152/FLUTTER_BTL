package service_btl.Dao;

import java.util.List;

import service_btl.entities.Story;


public interface StoryDao {
	public List<Story> getAllStory();

	public Story findByStoryName(String storyrName);

	public boolean insertStory(Story story);

	public boolean updateStory(Story story);

	public boolean updateStoryStatus(Integer storyId, Boolean newStatus);

	public Story findByStoryId(Integer storyId);

	public boolean deleteStory(Integer id);

	public List<Story> getStorysbyCategoryId(Integer storyId);
	
	// lấy danh sách story thro tác giả
	
	
}
