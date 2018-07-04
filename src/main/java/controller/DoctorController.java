package controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.cxf.transport.Session;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import po.DoctorCustom;
import po.OperationCustom;
import po.PatientCustom;
import service.DoctorService;
import service.OperationService;
import service.PatientService;

@Controller
@RequestMapping("/jsp")
public class DoctorController {

	@Autowired
	public DoctorService doctorService;
	@Autowired
	public PatientService patientService;
	@Autowired
	public OperationService operationService;
	/*//账户查询
	@RequestMapping("/queryDoctor.action")
	public ModelAndView queryDoctor() throws Exception {
		
		List<DoctorCustom> doctorList = doctorService.queryDoctorList();
		ModelAndView modelandview = new ModelAndView();
		modelandview.addObject("doctorList",doctorList);
		
		modelandview.setViewName("index");
		
		return modelandview;
	}
	
	@RequestMapping("/editDoctor.action")
	public ModelAndView editDoctor(@RequestParam("id")String id) throws Exception{
		DoctorCustom doctorCustom = doctorService.findDoctorById(id);
		
		ModelAndView modelandview = new ModelAndView();
		modelandview.addObject("doctorCustom",doctorCustom);
		
		modelandview.setViewName("doctor/editDoctor");
		
		return modelandview;
		
		
	}
	@RequestMapping("/editDoctorSubmit.action")
	public String editDoctorSubmit(HttpServletRequest request,String id,DoctorCustom doctorCustom) throws Exception{
		
		doctorService.updateDoctorById(id, doctorCustom);
			
		return "forward:queryDoctor.action";
		
		
	}*/
	
	@RequestMapping("/DoctorSignin.action")
	public ModelAndView DoctorSignin(HttpSession session,String username,String password) throws Exception{
		
		List<PatientCustom> patientList = patientService.queryPatientList();
		List<DoctorCustom> doctorList = doctorService.queryDoctorList();
		DoctorCustom doctorCustom = new DoctorCustom();
		for(int i=0; i<doctorList.size(); i++) {
            if(doctorList.get(i).getId().equals(username)) {
            	doctorCustom = doctorList.get(i);
            }
		}
		if(doctorCustom.getPassword().equals(password)) {
			session.setAttribute("doctor_id", username);
			ModelAndView modelandview = new ModelAndView();
			modelandview.addObject("patientList",patientList);
			
			modelandview.setViewName("DoctorShowPatient");
			
			return modelandview;
		}
		else {
			System.out.println("登录失败!");
			return null;
		}
			
	}
	
	@RequestMapping("/queryPatient.action")
	public ModelAndView queryPatient() throws Exception{
		
		List<PatientCustom> patientList = patientService.queryPatientList();
		ModelAndView modelandview = new ModelAndView();
		modelandview.addObject("patientList",patientList);
		
		modelandview.setViewName("DoctorShowPatient");
		
		return modelandview;
			
	}
	
	@RequestMapping("/searchPatient.action")
	public ModelAndView searchPatient(String id) throws Exception{
		
		List<PatientCustom> patientList = patientService.queryPatientList();
		if(id!=""&&id!=null) {
		for(int i=0; i<patientList.size(); i++) {
			if(patientList.get(i).getId().equals(id)) {
				continue;
			}else {
				patientList.remove(i);
				i--;
			}

		}
		}
		ModelAndView modelandview = new ModelAndView();
		modelandview.addObject("patientList",patientList);
		
		modelandview.setViewName("DoctorShowPatient");
		
		return modelandview;
			
	}
	
	@RequestMapping("/startOperation.action")
	public ModelAndView startOperation(String start) throws Exception{
		
		List<PatientCustom> patientList = patientService.queryPatientList();
		String operation_id = "0x";
		for(int i=0; i<3; i++) {
			int random = (int) (1+Math.random()*(9-1+1));
			operation_id = operation_id + String.valueOf(random);
		}
		
		PatientCustom patient = new PatientCustom();
		for(int i=0; i<patientList.size(); i++) {
			if(patientList.get(i).getId().equals(start)) {
				patient = patientList.get(i);
			}

		}
		ModelAndView modelandview = new ModelAndView();
		modelandview.addObject("patient",patient);
		modelandview.addObject("operation_id",operation_id);
		
		modelandview.setViewName("DoctorStartOperation");
		
		return modelandview;
			
	}
	@RequestMapping("/submitOperation.action")
	public String submitOperation(HttpSession session,String operation_id,String doctor_id,String patient_id,
			String day, String start_time, String end_time,String room_id,String nursenum) throws Exception{
		OperationCustom operationCustom = new OperationCustom();
		
		operationCustom.setOperation_id(operation_id);
		operationCustom.setDoctor_id(doctor_id);
		operationCustom.setPatient_id(patient_id);
		String start = day+" "+start_time;
		String finish = day+" "+end_time;
		Timestamp start1 = new Timestamp(System.currentTimeMillis());  
		Timestamp start2 = new Timestamp(System.currentTimeMillis());  
        String tsStr = "2011-05-09 11:49:45";  
	        try {  
	        	start1 = Timestamp.valueOf(start);  
	        	start2 = Timestamp.valueOf(finish);
		        } catch (Exception e) {  
		           e.printStackTrace();  
	            }  
	    operationCustom.setTime_start(start1);
	    operationCustom.setTime_finish(start2);
		operationCustom.setOperatingroom_id(room_id);
		operationCustom.setNurseNum(Integer.valueOf(nursenum));
		operationCustom.setStatus(1);
		operationCustom.setAnesthetist_id("0");
		operationCustom.setDate("0");
	
		operationService.addOperation(operationCustom);

		session.setAttribute("flag", "1");
		return "forward:queryPatient.action";
		
			
	}
	
	
}
