package controller;

import domain.account;
import mapping.AccountMapperI;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import util.MyBatisUtil;

import java.io.PrintWriter;

/**
 * Created by dzkan on 2016/3/8.
 */
@Controller
public class MainController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index()
    {
        System.out.println("start mvc");
        return "index";
    }

    @RequestMapping(value = "/loginFunction")
    public void login(String username,String password,PrintWriter pw)
    {
       // System.out.println("submit"+username+password);
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        AccountMapperI mapper = sqlSession.getMapper(AccountMapperI.class);
        account a=mapper.getByUsername(username);
        System.out.println(a.getPassword());
        System.out.println(password);
        System.out.println(a.getPassword().equals(password));
        if(a!=null&&a.getPassword().equals(password))     //a.getPassword()==password     wrong??
        {
            String x="1";
            pw.write(x);
        }
        else
        {
            String x="0";
            pw.write(x);
            System.out.println("Please enter correct username and password");

        }


    }
}