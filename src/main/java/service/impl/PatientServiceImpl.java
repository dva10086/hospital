package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.PatientDao;
import po.PatientCustom;
import service.PatientService;

@Service
public class PatientServiceImpl implements PatientService{

	@Autowired
	private PatientDao patientdao;
	
	public List<PatientCustom> queryPatientList() throws Exception {
		// TODO Auto-generated method stub
		return patientdao.queryPatientList();
	}

}
