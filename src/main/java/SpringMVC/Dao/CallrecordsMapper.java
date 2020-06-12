package SpringMVC.Dao;

import SpringMVC.Entity.Callrecords;
import SpringMVC.Entity.CallrecordsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CallrecordsMapper {
    int countByExample(CallrecordsExample example);

    int deleteByExample(CallrecordsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Callrecords record);

    int insertSelective(Callrecords record);

    List<Callrecords> selectByExample(CallrecordsExample example);

    Callrecords selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Callrecords record, @Param("example") CallrecordsExample example);

    int updateByExample(@Param("record") Callrecords record, @Param("example") CallrecordsExample example);

    int updateByPrimaryKeySelective(Callrecords record);

    int updateByPrimaryKey(Callrecords record);
}