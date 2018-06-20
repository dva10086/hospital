package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.OperationDao;
import po.Operation;
import po.OperationCustom;
import service.OperationService;

@Service
public class OperationServiceImpl implements OperationService{

	@Autowired
	private OperationDao operationDao;

	public List<OperationCustom> queryOperationList() throws Exception {
		// TODO Auto-generated method stub
		return operationDao.queryOperationList();
	}
	
	public Operation getOperation(String operation_id) throws Exception {
		// TODO Auto-generated method stub
		return operationDao.getOperation(operation_id);
	}

}
