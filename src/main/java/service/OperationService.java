package service;

import java.util.List;

import po.Operation;
import po.OperationCustom;

public interface OperationService {
	public List<OperationCustom> queryOperationList()throws Exception;
	
	public Operation getOperation(String operation_id) throws Exception;

}
