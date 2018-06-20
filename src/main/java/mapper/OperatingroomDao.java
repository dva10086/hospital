package mapper;

import java.util.List;

import po.OperatingroomCustom;

public interface OperatingroomDao {
	
	public List<OperatingroomCustom> queryRoomList() throws Exception;

}
