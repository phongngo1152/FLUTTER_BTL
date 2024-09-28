package service_btl.Dao;

import java.util.List;

import service_btl.entities.Author;
import service_btl.entities.Chapter;
import service_btl.entities.Favorite;

public interface ChapterDao {
	public List<Chapter> getAllChapter();

	public Chapter findByChapterName(String chapterName);

	public boolean insertChapter(Chapter chapter);

	public boolean updateChapter(Chapter chapter);

	public Chapter findByChapterId(Integer ChapterId);

	public boolean deleteChapter(Integer id);

	public List<Chapter> getChaptersbyStoryId(Integer storyId);

}
