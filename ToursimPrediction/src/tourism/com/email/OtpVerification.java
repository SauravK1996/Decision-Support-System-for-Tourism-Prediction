package tourism.com.email;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OtpVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String enterOtp = request.getParameter("enter_otp");
		//System.out.println("enterOtp "+enterOtp);
		
		HttpSession sesn = request.getSession();
		String userotp = (String)sesn.getAttribute("otp");
		//System.out.println("userotp "+userotp);
		
		String newemail = (String)sesn.getAttribute("newemail");
		//System.out.println("newemail "+ newemail);
		
		String userRecoverEmail = (String)sesn.getAttribute("emailrecover");
		//System.out.println("userRecoverEmail "+userRecoverEmail);
		
		
		if(enterOtp.equals(userotp) && newemail!=null){
			response.sendRedirect("signup.jsp");
		}else if(enterOtp.equals(userotp) && userRecoverEmail!=null){
			response.sendRedirect("enterpassword.jsp");
		}else{
			request.getSession().setAttribute("errormsg", "Enter valid OTP");
			response.sendRedirect("otpverification.jsp");
		}
		
		
	
	}

}
