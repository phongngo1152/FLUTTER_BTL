package service_btl.Dao;

import java.util.List;

import javax.management.relation.Role;

import service_btl.entities.Account;

public interface AccountDao {
	public List<Account> getAllUser();

	public Account findByUserName(String username);

	public boolean insertUser(Account account);

	public boolean updateser(Account account);

	public Account findByUserId(Integer accountId);

	public boolean deleteUser(Integer id);

	public List<Account> getUserByName(String accountname);

	public Account checklogin(String username, String password);
}
