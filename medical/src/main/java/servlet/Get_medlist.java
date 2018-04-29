package servlet;

import analysisdata.Data_process;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class Get_medlist extends HttpServlet {

    private Data_process data_process = new Data_process();
    private String json_Arr = "";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");

        String secondclass = req.getParameter("secondclass");
        String tablename = req.getParameter("dbtype");

        /*
        输出jsonArr
        */
        data_process = new Data_process();
        json_Arr = data_process.listmed(secondclass,tablename);

        PrintWriter out = resp.getWriter();
        out.write(json_Arr);
    }
}
