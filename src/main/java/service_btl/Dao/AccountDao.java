package service_btl.Dao;

import java.util.List;

import javax.management.relation.Role;

import service_btl.entities.Account;
import service_btl.entities.LoginDTOAPIFlutter;
import service_btl.entities.RegisterDTOAPIFlutter;

public interface AccountDao {
	public List<Account> getAllUser();

	public Account findByUserName(String username);

	public boolean insertUser(Account account);

	public boolean updateser(Account account);

	public Account findByUserId(Integer accountId);

	public boolean deleteUser(Integer id);

	public List<Account> getUserByName(String accountname);
	
	public List<Account> getAccbyrRole(Integer role);

	public Account checklogin(String username, String password);
	
	public boolean updateStatus(Account account);
	
	public boolean checkByUserName(String username);
	
	public boolean checkByUserEmail(String email);

	public Account loginAPIFlutter(LoginDTOAPIFlutter loginDTO);
	
	public boolean registerFlutter(RegisterDTOAPIFlutter register);
	
	public void saveAdminAccount(Account account);
}
