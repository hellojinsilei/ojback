package DAO;

import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;

import domain.User;

public interface UserDAO {
	public List<User> getUserAll();//�����û���Ϣ����
	public boolean delete(int id) ;//����idɾ���û�
	public List<User> getSerchUser(String s);
}
