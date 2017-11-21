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
import util.MyBatisUtil;

import java.io.PrintWriter;
import java.util.List;


@Controller    //千万别忘了加    。。。。。。。。。。。。。。。
public class MainController {

    @RequestMapping(value = "/initialVolunteerData")
    public @ResponseBody
    List<service> initialVolunteerData() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        ServiceMapperI mapper = sqlSession.getMapper(ServiceMapperI.class);
        // return "/WEB-INF/index.jsp";
        //service ser = mapper.getServiceByID(1);
        List<service> ser=mapper.getAllServices();
        System.out.println(ser);


        sqlSession.close();
         return ser;
        //        return str;

    }

    @RequestMapping(value = "/UpdateAccountInformation")
    public void updateAccountInformation(PrintWriter pw, String username,String firstname,String lastname,String email,String city,String phone) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        AccountMapperI mapper = sqlSession.getMapper(AccountMapperI.class);
        System.out.println("....................++"+username+ firstname);
        account a=new account();
a.setUsername(username);
        a.setFirstname(firstname);
        a.setLastname(lastname);
        a.setEmail(email);
        a.setCity(city);
        a.setPhonenumber(phone);

        int x=mapper.update(a);


        sqlSession.close();

       pw.write(1);


    }


    @RequestMapping(value = "/ApplyService")
    public void applyService(PrintWriter pw, String username,String serviceid) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
       ServiceMapperI smapper = sqlSession.getMapper(ServiceMapperI.class);
       int Iserviceid=Integer.parseInt(serviceid);
        System.out.println("---------------"+Iserviceid);
      service s=smapper.getServiceByID(Iserviceid);
      String servicename=s.getServicename();

        EventMapperI emapper=sqlSession.getMapper(EventMapperI.class);

        event e=new event();
        e.setServicename(servicename);
        e.setStatus(0);
        e.setUsername(username);

        int a=emapper.add(e);
        sqlSession.close();
        pw.write(1);


    }

    @RequestMapping(value = "/InitialAppliedServiceForUser")
    public @ResponseBody
    List<event> initialAppliedServiceForUser(String username) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        EventMapperI mapper = sqlSession.getMapper(EventMapperI.class);
        List<event> e=mapper.getEventByUsername(username);
        System.out.println("---------"+e.get(0));
        sqlSession.close();
        return e;


    }

}

