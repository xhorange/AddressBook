package SpringMVC.Dao;

import SpringMVC.Entity.Addressbook;
import SpringMVC.Entity.AddressbookExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AddressbookMapper {
    int countByExample(AddressbookExample example);

    int deleteByExample(AddressbookExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Addressbook record);

    int insertSelective(Addressbook record);

    List<Addressbook> selectByExample(AddressbookExample example);

    Addressbook selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Addressbook record, @Param("example") AddressbookExample example);

    int updateByExample(@Param("record") Addressbook record, @Param("example") AddressbookExample example);

    int updateByPrimaryKeySelective(Addressbook record);

    int updateByPrimaryKey(Addressbook record);
}