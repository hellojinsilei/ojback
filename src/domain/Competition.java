package domain;

public class Competition {

	private Integer competition_id;
	public Integer getCompetition_id() {
		return competition_id;
	}
	public void setCompetition_id(Integer competition_id) {
		this.competition_id = competition_id;
	}
	public String getCompetition_name() {
		return competition_name;
	}
	public void setCompetition_name(String competition_name) {
		this.competition_name = competition_name;
	}
	public String getCompetition_description() {
		return competition_description;
	}
	public void setCompetition_description(String competition_description) {
		this.competition_description = competition_description;
	}
	public Integer getCompetition_players_count() {
		return competition_players_count;
	}
	public void setCompetition_players_count(Integer competition_players_count) {
		this.competition_players_count = competition_players_count;
	}
	private String competition_name;
	private String competition_description;
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	private String start;
	private String end;
	private Integer competition_players_count;
	
	
	
}
