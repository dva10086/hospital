package service;

import java.util.List;

import po.PatientCustom;

public interface PatientService {
	public List<PatientCustom> queryPatientList()throws Exception;

}
