package DAO;

import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;

import domain.User;

public interface UserDAO {
	public List<User> getUserAll();//返回用户信息集合
	public boolean delete(int id) ;//根据id删除用户
	public List<User> getSerchUser(String s);
}
