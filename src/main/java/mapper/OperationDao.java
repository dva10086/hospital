package mapper;

import java.util.List;

import po.OperationCustom;

public interface OperationDao {
	
	public List<OperationCustom> queryOperationList()throws Exception;
}
