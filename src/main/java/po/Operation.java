package po;

import java.sql.Timestamp;

public class Operation {
	private String operation_id;
	private Timestamp time_start;
	private Timestamp time_finish;
	private String patient_id;
	private String operatingroom_id;
<<<<<<< HEAD
	private String doctor_id;
	private String anesthetist_id;
	private int nurseNum;
	private int status;
	private String date;
	
=======
	private String docotor_id;
	private String anesthetist_id;
	private int nurseNum;
	private int status;
>>>>>>> c0ca11f5a8713c4ef9b8e400f8600f6bcf1bab31
	public String getOperation_id() {
		return operation_id;
	}
	public void setOperation_id(String operation_id) {
		this.operation_id = operation_id;
	}
	public Timestamp getTime_start() {
		return time_start;
	}
	public void setTime_start(Timestamp time_start) {
		this.time_start = time_start;
	}
	public Timestamp getTime_finish() {
		return time_finish;
	}
	public void setTime_finish(Timestamp time_finish) {
		this.time_finish = time_finish;
	}
	public String getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(String patient_id) {
		this.patient_id = patient_id;
	}
	public String getOperatingroom_id() {
		return operatingroom_id;
	}
	public void setOperatingroom_id(String operatingroom_id) {
		this.operatingroom_id = operatingroom_id;
	}
<<<<<<< HEAD
	public String getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(String doctor_id) {
		this.doctor_id = doctor_id;
=======
	public String getDocotor_id() {
		return docotor_id;
	}
	public void setDocotor_id(String docotor_id) {
		this.docotor_id = docotor_id;
>>>>>>> c0ca11f5a8713c4ef9b8e400f8600f6bcf1bab31
	}
	public String getAnesthetist_id() {
		return anesthetist_id;
	}
	public void setAnesthetist_id(String anesthetist_id) {
		this.anesthetist_id = anesthetist_id;
	}
	public int getNurseNum() {
		return nurseNum;
	}
	public void setNurseNum(int nurseNum) {
		this.nurseNum = nurseNum;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
<<<<<<< HEAD
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
=======
>>>>>>> c0ca11f5a8713c4ef9b8e400f8600f6bcf1bab31
	
	

}
