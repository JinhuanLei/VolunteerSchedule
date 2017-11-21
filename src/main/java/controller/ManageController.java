package controller;

import domain.account;
import domain.event;
import domain.service;
import mapping.AccountMapperI;
import mapping.EventMapperI;
import mapping.ServiceMapperI;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import util.MyBatisUtil;

import java.io.PrintWriter;
import java.util.List;

@Controller
public class ManageController {


    @RequestMapping(value = "/getReportJsp")

    public ModelAndView getReportJsp() {

        return new ModelAndView("addReport");

    }

    @RequestMapping(value="/ManageToMain")
    public ModelAndView ManageToMain()
    {
        return new ModelAndView("mainInterfaceJsp");
    }

    @RequestMapping(value="/MainToManage")
    public ModelAndView MainToManage()
    {
        return new ModelAndView("inferManagementJsp");
    }

    @RequestMapping(value="/TurnToServiceTable")
    public ModelAndView turnToServiceTable()
    {
        return new ModelAndView("servicesTable");
    }

    @RequestMapping(value="/TurnToManagePage")
    public ModelAndView turnToManagePage()
    {
        return new ModelAndView("inferManagementJsp");
    }

    @RequestMapping(value = "/AddNewAccountByAdmin")

    public void addNewAccountByAdmin(String username, String password,String usertype, String firstname,String lastname,PrintWriter pw) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        AccountMapperI mapper = sqlSession.getMapper(AccountMapperI.class);
        account a=new account();
        int Utype=ditinguishType(usertype);
        a.setUsername(username);
        a.setPassword(password);
        a.setType(Utype);
        a.setFirstname(firstname);
        a.setLastname(lastname);
        int x=mapper.add(a);
        sqlSession.close();
        String str="";
        pw.write(str);

    }
    public int  ditinguishType(String usertype)
    {
        if(usertype.equals("Manager"))
        {
            return 1;
        }

        else if(usertype.equals("Volunteer"))
        {
            return 2;
        }
        return -1;
    }
    @RequestMapping(value = "/AddNewPost")
    public void AddNewPost(String servicename, String location,String starttime,String endtime,String peoplenum,String contactpersonname,String contactinformation,String introduction, PrintWriter pw) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        ServiceMapperI mapper = sqlSession.getMapper(ServiceMapperI.class);
        service s=new service();
        s.setServicename(servicename);
        s.setPeoplenum(Integer.parseInt(peoplenum));
        s.setLocation(location);
       s.setStarttime(starttime);
       s.setEndtime(endtime);
        s.setContactpersonname(contactpersonname);
        s.setContactinformation(contactinformation);
        s.setIntroduction(introduction);
        int x=mapper.add(s);
        sqlSession.close();
        String str="";
        pw.write(str);

    }


    @RequestMapping(value = "/getAllAccount")

    public @ResponseBody
    List<account> getAllAccount() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
       AccountMapperI mapper = sqlSession.getMapper(AccountMapperI.class);
        // return "/WEB-INF/index.jsp";
        //service ser = mapper.getServiceByID(1);
        List<account> list=mapper.getAllAccounts();

        return list;

    }

    @RequestMapping(value = "/getManageJsp")

    public ModelAndView getManageJsp() {

        return new ModelAndView("inferManagementJsp");

    }


    @RequestMapping(value = "/GetMainJsp")

    public ModelAndView getMainJsp() {

        return new ModelAndView("mainInterfaceJsp");

    }

    @RequestMapping(value = "/GetAddAccountJsp")

    public ModelAndView getAddAccountJsp() {

        return new ModelAndView("addAccountJsp");
    }

    @RequestMapping(value = "/DeleteAccount")

    public void deleteAccount(PrintWriter pw,String accountname) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        AccountMapperI mapper = sqlSession.getMapper(AccountMapperI.class);

        int x=mapper.deleteByName(accountname);
        pw.write("success");


    }

    @RequestMapping(value = "/InitialAccountInformation")
    public @ResponseBody
    account initialAccountInformation(String username) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        AccountMapperI mapper = sqlSession.getMapper(AccountMapperI.class);
        // return "/WEB-INF/index.jsp";
        //service ser = mapper.getServiceByID(1);
        account a=mapper.getByUsername(username);
        return a;

    }
    @RequestMapping(value = "/DeleteService")

    public void deleteService(PrintWriter pw,String serviceid) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        ServiceMapperI mapper = sqlSession.getMapper(ServiceMapperI.class);

        int Intserviceid=Integer.parseInt(serviceid);

        int x=mapper.deleteById(Intserviceid);
        pw.write("success");
    }

    @RequestMapping(value = "/TurnToPageServiceRequest")

    public ModelAndView turnToPageServiceRequest() {
        return new ModelAndView("/ServiceRequest");


    }

    @RequestMapping(value = "/InitialRequestInformation")
    public @ResponseBody
    List<event> initialRequestInformation() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        EventMapperI mapper = sqlSession.getMapper(EventMapperI.class);
        // return "/WEB-INF/index.jsp";
        //service ser = mapper.getServiceByID(1);
        List<event> a=mapper.getEventBystatus();
        return a;

    }


    @RequestMapping(value = "/PermitRequest")
    public void permitRequest(PrintWriter pw,String eventid) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        EventMapperI mapper = sqlSession.getMapper(EventMapperI.class);
        // return "/WEB-INF/index.jsp";
        //service ser = mapper.getServiceByID(1);
        int a=mapper.update(Integer.parseInt(eventid));
       sqlSession.close();
        pw.write(1);

    }


    @RequestMapping(value = "/DeleteRequest")
    public void deleteRequest(PrintWriter pw,String eventid) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        EventMapperI mapper = sqlSession.getMapper(EventMapperI.class);
        // return "/WEB-INF/index.jsp";
        //service ser = mapper.getServiceByID(1);
        int a=mapper.deleteById(Integer.parseInt(eventid));
        sqlSession.close();
        pw.write(1);

    }

}
