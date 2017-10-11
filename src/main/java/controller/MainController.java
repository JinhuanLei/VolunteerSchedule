package controller;

import domain.service;
import mapping.ServiceMapperI;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import util.MyBatisUtil;


@Controller    //千万别忘了加    。。。。。。。。。。。。。。。
public class MainController {

    @RequestMapping(value = "/initialVolunteerData")

    public @ResponseBody service initialVolunteerData()
    {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
       ServiceMapperI mapper = sqlSession.getMapper(ServiceMapperI.class);
        // return "/WEB-INF/index.jsp";
        service ser=mapper.getServiceByID(1);
        System.out.println(ser);
        sqlSession.close();
            return  ser;

    }
//    @RequestMapping(value = "/loginFunction")
//    public void login(String username,String password,PrintWriter pw)
//    {
//        // System.out.println("submit"+username+password);
//        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
//        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
//        AccountMapperI mapper = sqlSession.getMapper(AccountMapperI.class);
//        account a=mapper.getByUsername(username);
//        System.out.println(a.getPassword());
//        System.out.println(password);
//        System.out.println(a.getPassword().equals(password));
//        if(a!=null&&a.getPassword().equals(password))     //a.getPassword()==password     wrong??
//        {
//            String x="1";
//            pw.write(x);
//        }
//        else
//        {
//            String x="0";
//            pw.write(x);
//            System.out.println("Please enter correct username and password");
//
//        }
//
//        sqlSession.close();
//    }
}
