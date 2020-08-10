package pojo;

import java.util.ArrayList;

public class DatabaseData {
	private String spot;
	private String month;
	private int budget;
	private int avgOverAllBudget;
	private int userGivenOverAllBudget;
	private boolean visit;
	private String reason;
	


	ArrayList<String> monthlist = new ArrayList<String>();
	ArrayList<String> budgetlist = new ArrayList<String>();
	
	
	
	public ArrayList<String> getBudgetlist() {
		return budgetlist;
	}
	public void setBudgetlist(ArrayList<String> budgetlist) {
		this.budgetlist = budgetlist;
	}
	public ArrayList<String> getMonthlist() {
		return monthlist;
	}
	public void setMonthlist(ArrayList<String> monthlist) {
		this.monthlist = monthlist;
	}
	public int getAvgOverAllBudget() {
		return avgOverAllBudget;
	}
	public void setAvgOverAllBudget(int avgOverAllBudget) {
		this.avgOverAllBudget = avgOverAllBudget;
	}
	public int getUserGivenOverAllBudget() {
		return userGivenOverAllBudget;
	}
	public void setUserGivenOverAllBudget(int userGivenOverAllBudget) {
		this.userGivenOverAllBudget = userGivenOverAllBudget;
	}
	public boolean isVisit() {
		return visit;
	}
	public void setVisit(boolean visit) {
		this.visit = visit;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getSpot() {
		return spot;
	}
	public void setSpot(String spot) {
		this.spot = spot;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	
	
}
