package controller;

import domain.service;
import mapping.ServiceMapperI;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import util.MyBatisUtil;

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


}

