package SpringMVC.Service;

import SpringMVC.Entity.Addressbook;

import java.util.List;

public interface AddressBookService {
    public List<Addressbook> findAddress(String classification);

}
