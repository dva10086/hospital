package controller;

import java.nio.file.Watchable;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import po.DoctorCustom;
import po.PatientCustom;

@Controller
@RequestMapping("/jsp")
public class SignController {
	
	DoctorController doctorController;
	
	@RequestMapping("/signincontroller.action")
	public String signincontroller(String way,HttpSession session,String username, String password) throws Exception{
		
		if(way.equals("doctor")) {
			
		doctorController = new DoctorController();
		return "forward:DoctorSignin.action";
		
		}
		return null;
		
			
	}
	
	

}
