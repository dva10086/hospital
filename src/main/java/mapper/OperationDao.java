package mapper;

import java.util.List;

import po.DoctorCustom;

public interface OperationDao {
	
	public List<OperationCustom> queryOperationList()throws Exception;
}
