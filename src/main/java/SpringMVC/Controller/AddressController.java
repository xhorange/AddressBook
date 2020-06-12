package SpringMVC.Controller;

import SpringMVC.Entity.Addressbook;
import SpringMVC.Service.AddressBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;
@Controller
public class AddressController {
    @Autowired
    AddressBookService addressBookService;

    /**
     * 页面跳转
     * @return
     */
    @RequestMapping(value = "/addressbook",method = RequestMethod.GET)
    public String  JumpTOAddressbook(){
        return "/addressbook";
    }
    @RequestMapping(value = "/dial",method = RequestMethod.GET)
    public String  JumpTODial(){
        return "/index";
    }

    /**
     * 查找所有联系人
     * @return
     */
    @RequestMapping(value="/findInitAddress", method = RequestMethod.GET)//响应findAll，用来查询所有航班信息
    @ResponseBody
    public List<Addressbook> getInitAddress(){
        return addressBookService.findAddress("个人");
    }

    /**
     * 切换个人
     * @return
     */
    @RequestMapping(value="/changePerson", method = RequestMethod.GET)//响应findAll，用来查询所有航班信息
    @ResponseBody
    public List<Addressbook> getPersonAddress(){
        return addressBookService.findAddress("个人");
    }
    /**
     * 切换办公
     * @return
     */
    @RequestMapping(value="/changeOffice", method = RequestMethod.GET)//响应findAll，用来查询所有航班信息
    @ResponseBody
    public List<Addressbook> getOfficeAddress(){
        return addressBookService.findAddress("办公");
    }
    /**
     * 切换商务
     * @return
     */
    @RequestMapping(value="/changeBusiness", method = RequestMethod.GET)//响应findAll，用来查询所有航班信息
    @ResponseBody
    public List<Addressbook> getBusinessAddress(){
        return addressBookService.findAddress("商务");
    }

    /**
     * 新增联系人
     * @param addressbook
     * @param model
     * @return
     */
    @RequestMapping(value="/address/addPerson", method = RequestMethod.POST)
   public String insertPerson(@ModelAttribute Addressbook addressbook, Model model){
        int result=addressBookService.add(addressbook);
        model.addAttribute("insertResult",result);
        return "redirect:/addressbook";
    }
    @RequestMapping(value="/address/updatePerson", method = RequestMethod.POST)
    public String updatePerson(@ModelAttribute Addressbook addressbook,Model model){
        int result=addressBookService.update(addressbook);
        model.addAttribute("updateResult",result);
        return "redirect:/addressbook";
    }
    @RequestMapping(value="/delete", method = RequestMethod.POST)//响应delete，删除选中航班信息
    @ResponseBody
    public int delete(@RequestParam("ids")String ids){
        String id=ids.split(",")[0];
        if(addressBookService.deleteByID(id)>=0){
            addressBookService.updateID(id);
            return 1;
        }
        return -1;
    }

}
