package mapper;

import java.util.List;

import po.Operation;
import po.OperationCustom;

public interface OperationDao {
	
	public List<OperationCustom> queryOperationList() throws Exception;
	
	public Operation getOperation(String operation_id) throws Exception;
	
	public List<OperationCustom> findRoomDetail(String room_id) throws Exception;
}
