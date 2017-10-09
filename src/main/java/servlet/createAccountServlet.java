package servlet;

import domain.account;
import mapping.AccountMapperI;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.http.HttpSession;

@javax.servlet.annotation.WebServlet(name = "createAccountServlet", urlPatterns = "/createAccountServlet")
public class createAccountServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        String city=request.getParameter("city");
        String phonenumber=request.getParameter("phonenumber");
        HttpSession session = request.getSession(false);
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        AccountMapperI mapper = sqlSession.getMapper(AccountMapperI.class);
        account at=new account();
        at.setUsername(username);
        at.setPassword(password);
        at.setEmail(email);
        at.setCity(city);
        at.setPhonenumber(phonenumber);
        at.setType(2);
        int x=mapper.add(at);



    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        doPost(request, response);

    }
}
