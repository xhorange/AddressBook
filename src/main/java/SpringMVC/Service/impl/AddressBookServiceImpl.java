package SpringMVC.Service.impl;

import SpringMVC.Dao.AddressbookMapper;
import SpringMVC.Entity.Addressbook;
import SpringMVC.Entity.AddressbookExample;
import SpringMVC.Service.AddressBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressBookServiceImpl implements AddressBookService {
    @Autowired
    private AddressbookMapper addressbookMapper;

    /**
     * 按分类查找联系人
     * @param classification
     * @return
     */

    @Override
    public List<Addressbook> findAddress(String classification) {
        AddressbookExample addressbookExample=new AddressbookExample();
        AddressbookExample.Criteria criteria=addressbookExample.createCriteria();
        criteria.andClassificationEqualTo(classification);
        return addressbookMapper.selectByExample(addressbookExample);
    }
}
