package domain;

public class User {
	
	public Integer getUser_id() {
		return User_id;
	}
	public void setUser_id(Integer user_id) {
		User_id = user_id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nicknane) {
		this.nickname = nicknane;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getRight_problem_count() {
		return right_problem_count;
	}
	public void setRight_problem_count(Integer right_problem_count) {
		this.right_problem_count = right_problem_count;
	}
	private Integer User_id;

	private String nickname;
	private String email;
	private Integer right_problem_count;
	private Integer have_done_problem;
	private Integer password;
	private String account;
	private String school;
	private String identity;
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Integer getPassword() {
		return password;
	}
	public void setPassword(Integer password) {
		this.password = password;
	}
	public Integer getHave_done_problem() {
		return have_done_problem;
	}
	public void setHave_done_problem(Integer have_done_problem) {
		this.have_done_problem = have_done_problem;
	} 
}
