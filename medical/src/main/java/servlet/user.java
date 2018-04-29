package servlet;



import analysisdata.Data_process;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class user extends HttpServlet {

    private Data_process data_process = new Data_process();
    private Map<Object,String> userinfo = new HashMap<Object, String>();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");

        String usermanager = req.getParameter("usermanager");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        userinfo = data_process.select_userinfo(username);

        String sel_username = userinfo.get("username");
        String sel_password = userinfo.get("password");

        String msg = "test";

        if(usermanager.equals("login")){
            if(sel_username.equals("")){
                msg = "用户不存在！";
            } else if(!sel_password.equals(password)){
                msg = "密码错误！";
            } else if(sel_password.equals(password)){
                msg = "1";
            }
        } else if(usermanager.equals("register")){
            if(sel_username.equals(username)){
                msg = "用户已存在！";
            } else {
                if(data_process.insert_user(username,password)){
                    msg = "1";
                } else {
                    msg = "注册失败！";
                }
            }
        }

        PrintWriter out = resp.getWriter();
        out.write(msg);
    }

}
