package service_btl.Dao;

import java.util.List;

import service_btl.entities.Comment;
import service_btl.entities.Favorite;
import service_btl.entities.View;

public interface ViewDao {
	public List<View> getView();

	public boolean insertViews(View view);

	public boolean updateView(View view);

	public boolean deleteView(Integer viewId);

	public View getViewById(Integer viewId);

	public List<Comment> getCommentbyStoryId(Integer storyId);

}
