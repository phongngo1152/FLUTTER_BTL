package service_btl.Dao;

import java.util.List;

import service_btl.entities.Comment;
import service_btl.entities.Favorite;

public interface FavoriteDao {
	public List<Favorite> getFavourite();
	public List<Favorite> getFavouritesbyUserId(Integer accId);

	public boolean insertFavourites(Favorite favourite);
	public boolean updateFavourite(Favorite favourite);
	public boolean deleteFavourite(Integer favouriteId);
	public Favorite getFavouriteById(Integer favouriteId);
}
