package servlet;

import domain.account;
import mapping.AccountMapperI;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.http.HttpSession;

@javax.servlet.annotation.WebServlet(name = "loginServlet", urlPatterns = "/loginServlet")
public class loginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession(false);
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
       AccountMapperI mapper = sqlSession.getMapper(AccountMapperI.class);
//        System.out.println("data from ajax 1"+request.getParameter("username"));
//        System.out.println("data from ajax 2"+request.getParameter("password"));
        String username=request.getParameter("username");
        String password=request.getParameter("password");
          String str="Please enter correct username and password";
        account a=mapper.getByUsername(request.getParameter("username"));
        System.out.println(a.getPassword());
        System.out.println(password);
        System.out.println(a.getPassword().equals(password));
        if(a!=null&&a.getPassword().equals(password))     //a.getPassword()==password     wrong??
           {
               String x="1";
               response.getWriter().write(x);
           }
           else
           {
               String x="0";
               response.getWriter().write(x);
               System.out.println("Please enter correct username and password");

           }

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        doPost(request, response);

    }
}
