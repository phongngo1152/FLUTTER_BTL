package service_btl.Dao;

import java.util.List;

import service_btl.entities.Author;

public interface AuthorDao {
	public List<Author> getAllAuthor();

	public Author findByAuthorName(String authorname);

	public boolean insertAuthor(Author author);

	public boolean updateAuthor(Author author);

	public Author findByAuthorId(Integer AuthorId);

	public boolean deleteAuthor(Integer id);
}
