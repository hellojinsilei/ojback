package domain;

public class Problem {

	private Integer problem_id;
	public Integer getProblem_id() {
		return problem_id;
	}
	public void setProblem_id(Integer problem_id) {
		this.problem_id = problem_id;
	}
	public String getProblem_name() {
		return problem_name;
	}
	public void setProblem_name(String problem_name) {
		this.problem_name = problem_name;
	}
	public Integer getProblem_creator_id() {
		return problem_creator_id;
	}
	public void setProblem_creator_id(Integer problem_creator_id) {
		this.problem_creator_id = problem_creator_id;
	}
	public Integer getProblem_difficulty() {
		return problem_difficulty;
	}
	public void setProblem_difficulty(Integer problem_difficulty) {
		this.problem_difficulty = problem_difficulty;
	}
	public Integer getProblem_value() {
		return problem_value;
	}
	public void setProblem_value(Integer problem_value) {
		this.problem_value = problem_value;
	}
	public Integer getIs_publish() {
		return is_publish;
	}
	public void setIs_publish(Integer is_publish) {
		this.is_publish = is_publish;
	}
	public Integer getTotal_submit_count() {
		return total_submit_count;
	}
	public void setTotal_submit_count(Integer total_submit_count) {
		this.total_submit_count = total_submit_count;
	}
	public Integer getTotal_right_count() {
		return total_right_count;
	}
	public void setTotal_right_count(Integer total_right_count) {
		this.total_right_count = total_right_count;
	}
	private String problem_name;
	private Integer problem_creator_id;
	private Integer problem_difficulty;
	private Integer problem_value;
	private Integer is_publish;
	private Integer total_submit_count; 
	private Integer total_right_count;
}
