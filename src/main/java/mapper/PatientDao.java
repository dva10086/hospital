package mapper;

import java.util.List;

import po.PatientCustom;

public interface PatientDao {
	
	public List<PatientCustom> queryPatientList()throws Exception;

}
