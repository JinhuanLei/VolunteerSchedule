package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
        System.out.println("submit"+username+password);
        String x="0";
        pw.write(x);
    }
}