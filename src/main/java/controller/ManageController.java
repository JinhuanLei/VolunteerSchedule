package controller;

import domain.account;
import domain.service;
import mapping.AccountMapperI;
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

    public void addNewAccountByAdmin(String username, String password,String usertype, PrintWriter pw) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        AccountMapperI mapper = sqlSession.getMapper(AccountMapperI.class);
        account a=new account();
        int Utype=ditinguishType(usertype);
        a.setUsername(username);
        a.setPassword(password);
        a.setType(Utype);
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

}
