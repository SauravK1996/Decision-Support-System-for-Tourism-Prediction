package tourism.com.processor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.DatabaseData;
import pojo.UserData;
import tourism.com.factory.DaoFactory;
import toursim.com.dao.DatabaseDataDao;


public class ProcessData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uspot = request.getParameter("spot");
		String ubudgetType = request.getParameter("budgetType");
		int ubudget = Integer.parseInt(request.getParameter("budget"));
		int uno_of_person = Integer.parseInt(request.getParameter("no_of_person"));
		int uno_of_days = Integer.parseInt(request.getParameter("no_of_days"));
		String umonth = request.getParameter("month");
		int perdayperpersonbudget = 0;
		
		UserData userData = new UserData();
		
		userData.setSpot(uspot);
		userData.setBudgetType(ubudgetType);
		userData.setNo_of_days(uno_of_days);
		userData.setNo_of_person(uno_of_person);
		userData.setMonths(umonth);
		
		int userGivenOverAllBudget = 0;
		
		if(ubudgetType.equals("perperson")){
			userGivenOverAllBudget = ubudget * uno_of_person * uno_of_days;
			perdayperpersonbudget = ubudget;
		}else{
			userGivenOverAllBudget = ubudget;
			perdayperpersonbudget = ubudget/(uno_of_person * uno_of_days);
		}
		
			
		DatabaseDataDao databaseDataDao = DaoFactory.getDatabaseData();
		DatabaseData databaseData = databaseDataDao.databaseData(uspot,umonth,perdayperpersonbudget);
		
		String dSpot = databaseData.getSpot();
		String dMonth = databaseData.getMonth();
		int dBudget = databaseData.getBudget();
		
		int avgOverAllBudget = dBudget * uno_of_person * uno_of_days;
		
		
		
		String reason = "";
		boolean visit = false;
		if(avgOverAllBudget > userGivenOverAllBudget && !umonth.equalsIgnoreCase(dMonth)){
			reason = reason + "Overall budget and month for your trip both are not in your favour.";
		}else if(avgOverAllBudget > userGivenOverAllBudget ){
			reason = reason + "Overall budget is not in your favour.";
		}else{
			if(umonth.equalsIgnoreCase(dMonth)){
				reason = reason + "Your data fulfilled all the requirements enjoy your trip.";
				visit = true;
			}else{
				reason = reason + "Month is not in your favour";
			}
		}
		
		databaseData.setAvgOverAllBudget(avgOverAllBudget);
		databaseData.setUserGivenOverAllBudget(userGivenOverAllBudget);
		databaseData.setReason(reason);
		databaseData.setVisit(visit);
		
		System.out.println("spot "+uspot);
		System.out.println("budgetType "+ubudgetType);
		System.out.println("budget "+ubudget);
		System.out.println("no_of_person "+uno_of_person);
		System.out.println("no_of_days "+uno_of_days);
		System.out.println("month "+umonth);
		
		System.out.println("*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*");
		
		System.out.println("userGivenOverAllBudget = "+userGivenOverAllBudget);
		System.out.println("avgOverAllBudget = "+avgOverAllBudget);
		System.out.println("dSpot = "+dSpot);
		System.out.println("dMonth = "+dMonth);
		System.out.println("dBudget = "+dBudget);
		System.out.println("reason = "+reason);
		System.out.println("visit = "+visit);
		
		HttpSession userSession =  request.getSession();
		userSession.setAttribute("userData", userData);
		
		HttpSession dbSession =  request.getSession();
		dbSession.setAttribute("databaseData", databaseData);

		response.sendRedirect("tour.jsp");
		
	}

}
