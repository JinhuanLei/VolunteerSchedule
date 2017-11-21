package controller;

import com.sun.mail.util.MailSSLSocketFactory;
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

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.PrintWriter;
import java.security.GeneralSecurityException;
import java.util.List;
import java.util.Properties;

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
    public void permitRequest(PrintWriter pw,String eventid,String username) throws GeneralSecurityException, MessagingException {
        SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
        // 得到UserMapperI接口的实现类对象，UserMapperI接口的实现类对象由sqlSession.getMapper(UserMapperI.class)动态构建出来
        EventMapperI mapper = sqlSession.getMapper(EventMapperI.class);
        // return "/WEB-INF/index.jsp";
        //service ser = mapper.getServiceByID(1);
        int a=mapper.update(Integer.parseInt(eventid));
        sqlSession.close();
        SqlSession sqlSession1 = MyBatisUtil.getSqlSession(true);
        AccountMapperI amapper=sqlSession1.getMapper(AccountMapperI.class);
        System.out.println("----------------"+username);
        account acc=amapper.getByUsername(username);

        String email=acc.getEmail();
        sendEmail(email,username);

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
    public void sendEmail(String email,String username) throws GeneralSecurityException, MessagingException {
        //0.5，props和authenticator参数
        Properties props = new Properties();
        props.setProperty("mail.host", "smtp.qq.com");
        props.setProperty("mail.smtp.auth", "true");

        //QQ邮箱的SSL加密。
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.socketFactory", sf);

        //authenticator参数，登录自己的邮箱帐号密码，
        Authenticator authenticator = new Authenticator() {
            @Override
            public javax.mail.PasswordAuthentication getPasswordAuthentication() {
                /**
                 * 注意，QQ邮箱的规则是如果不是由腾讯的网页或者客户端打开登录的话，在其他任何地方
                 *登录邮箱，密码必须使用授权码，授权码下面会讲解，vlyvawibbsribgee
                 *xxxxxxx:自己的QQ邮箱登录帐号，也就是qq号
                 *yyyyyyy:密码，使用授权码登录，而不能使用原始的QQ密码
                 */
                return new javax.mail.PasswordAuthentication("12691613@qq.com","huzocdefxbjobhcd");

            }
        };
        //1、连接
        /**
         * props
         *         连接配置信息，邮件服务器的地址，是否进行权限验证
         * authenticator
         *         权限验证，也就是帐号密码验证
         * 所以需要先配置这两个参数
         */
        Session session = Session.getDefaultInstance(props, authenticator);

        //2、发送的内容对象Mesage
        Message message = new MimeMessage(session);
        //2.1、发件人是谁
        message.setFrom(new InternetAddress("12691613@qq.com"));
        // 2.2  , to:收件人 ; cc:抄送 ; bcc :暗送.
        /**
         * 收件人是谁？
         *         第一个参数：
         *             RecipientType.TO    代表收件人
         *             RecipientType.CC    抄送
         *             RecipientType.BCC    暗送
         *         比如A要给B发邮件，但是A觉得有必要给要让C也看看其内容，就在给B发邮件时，
         *         将邮件内容抄送给C，那么C也能看到其内容了，但是B也能知道A给C抄送过该封邮件
         *         而如果是暗送(密送)给C的话，那么B就不知道A给C发送过该封邮件。
         *     第二个参数
         *         收件人的地址，或者是一个Address[]，用来装抄送或者暗送人的名单。或者用来群发。
         */
//        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress("lei.jinhuan@uwlax.edu"));
        // 2.3 主题（标题）
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(email));
        message.setSubject("hello");
        // 2.4 正文
        String str = "Hi "+username +":<br/>Congratulations!<br/>"+
                "Your request has been approved.<br/>"+
                " Volunteer System";

        message.setContent(str, "text/html;charset=UTF-8");
        //3、发送
        Transport.send(message);
    }




}
