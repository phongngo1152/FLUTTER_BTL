package service_btl.Dao;

import java.util.List;

import service_btl.entities.Category;
import service_btl.entities.Comment;

public interface CategoryDAO {
	public List<Category> getListCategory();

	public boolean insertCates(Category category);

	public boolean updateCate(Category category);
	
	public Category findByCateId(Integer categoryId);

	public boolean deleteCate(Integer categoryId);
}
