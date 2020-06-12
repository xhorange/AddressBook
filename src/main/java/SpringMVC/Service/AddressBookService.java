package SpringMVC.Service;

import SpringMVC.Entity.Addressbook;

import java.util.List;

public interface AddressBookService {
     List<Addressbook> findAddress(String classification);

     int add(Addressbook addressbook);

     int update(Addressbook addressbook);

     int deleteByID(String  ID);

     int updateID(String ID);
}
