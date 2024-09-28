package service_btl.Dao;

import java.util.List;

import service_btl.entities.Comment;

public interface CommentDao {
	public List<Comment> getAllComment();

	public Comment findByCommentName(String commentName);

	public boolean insertComment(Comment comment);

	public boolean updateComment(Comment comment);

	public Comment findByCommentId(Integer commentId);

	public boolean deleteComment(Integer id);

	public List<Comment> getCommentbyStoryId(Integer storyId);

}
