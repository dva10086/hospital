package service;

import java.util.List;

import po.OperationCustom;

public interface OperationService {
	public List<OperationCustom> queryOperationList()throws Exception;

}
