package SpringMVC.Service.impl;

import SpringMVC.Dao.AddressbookMapper;
import SpringMVC.Entity.Addressbook;
import SpringMVC.Entity.AddressbookExample;
import SpringMVC.Service.AddressBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Iterator;
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

    /**
     * 新增联系人
     * @param addressbook
     * @return
     */
    @Override
    public int add(Addressbook addressbook) {
        AddressbookExample addressbookExample=new AddressbookExample();
        AddressbookExample.Criteria criteria=addressbookExample.createCriteria();
        criteria.andClassificationEqualTo(addressbook.getClassification());
        int count=addressbookMapper.countByExample(addressbookExample);
        if(count>15){
            return -1;//表示人数超上限
        }
        else {
            Integer id= count + 1;
            addressbook.setId(id.toString());
            AddressbookExample addressbookExample_check=new AddressbookExample();
            AddressbookExample.Criteria criteria_check=addressbookExample_check.createCriteria();
            criteria_check.andNameEqualTo(addressbook.getName());
            criteria_check.andPhonenumberEqualTo(addressbook.getPhonenumber());
            List<Addressbook> addressbooks=addressbookMapper.selectByExample(addressbookExample_check);
            if (!addressbooks.isEmpty()) {
                return -2;//联系人存在
            }
            else {
                addressbookMapper.insert(addressbook);
                return 1;
            }
        }

    }

    @Override
    public int update(Addressbook addressbook) {
        AddressbookExample addressbookExample=new AddressbookExample();
        AddressbookExample.Criteria criteria= addressbookExample.createCriteria();
        criteria.andIdEqualTo(addressbook.getId());
        if(addressbookMapper.updateByExampleSelective(addressbook,addressbookExample)!=0){
            return 1;//成功
        }
        return -1;//已存在
    }

    @Override
    public int deleteByID(String ID) {

        AddressbookExample addressbookExample=new AddressbookExample();
        AddressbookExample.Criteria criteria=addressbookExample.createCriteria();
        criteria.andIdEqualTo(ID);
        return addressbookMapper.deleteByExample(addressbookExample);
    }

    @Override
    public int updateID(String ID) {
        int count=0;
        AddressbookExample addressbookExample=new AddressbookExample();
        AddressbookExample.Criteria criteria=addressbookExample.createCriteria();
        criteria.andIdGreaterThan(ID);
        List<Addressbook> addressbookList=addressbookMapper.selectByExample(addressbookExample);
        Iterator<Addressbook> addressbookIterator= addressbookList.iterator();
        while(addressbookIterator.hasNext()){
            Addressbook next=addressbookIterator.next();
            String oldID=next.getId();
            Integer newID=Integer.parseInt(oldID)-1;
            next.setId(newID.toString());
            addressbookMapper.updateByPrimaryKeySelective(next);
            count++;
        }
        return count;
    }
}
