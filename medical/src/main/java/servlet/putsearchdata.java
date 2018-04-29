package servlet;

import analysisdata.Data_process;
import dfs.Search_ID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class putsearchdata extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        Data_process data_process = new Data_process();
        List datainfo = new ArrayList();
        List searchhistoryinfo = new ArrayList();

        String dbtype = req.getParameter("dbtype");
        String data = req.getParameter("data");
        String str_pagenum = req.getParameter("pagenum");
        String searchid = req.getParameter("searchidinfo");
        String username = req.getParameter("username");
        int begin = Integer.parseInt(req.getParameter("begin"));
        int end = Integer.parseInt(req.getParameter("end"));
        String dbtag = "test";
        String id = "";
        int pagenum = Integer.valueOf(str_pagenum);

        if(pagenum == 0){
            /**
             * hadoop接口
             * */
            try{
                Search_ID search_id = new Search_ID();
                id = search_id.getfile(dbtype,data);
            } catch (Exception e){
                e.printStackTrace();
            }
            pagenum = 1;
        } else if(pagenum > 0){
            id = searchid;

        }
        String[] id_array = id.substring(1,id.length()).split(",");
        String[] name_data = data_process.select_searchinfo(dbtype,id_array);
//        if((Math.ceil(id_array.length/10.0)) <= 10){
//            end = (int) Math.ceil(id_array.length/10.0);
//        }
        if(end != (int) (Math.ceil(id_array.length/10.0))){
            if(pagenum == end){
                begin = end;
                if((Math.ceil(id_array.length/10.0)-end)/10 >= 1){
                    end = begin + 9;
                } else {
                    end = (int) (Math.ceil(id_array.length/10.0));
                }

            }
        } else if(end != 10){
            if(pagenum == begin){
                end = begin ;
                begin = end - 9;

            }
        }

        int beginpagenum = 0;
        int endpagenum = 0;

        if(pagenum == Math.ceil(id_array.length/10.0)){
            beginpagenum = (int) (Math.floor(id_array.length/10.0))*10;
            endpagenum = id_array.length;
        } else{
            endpagenum = pagenum*10;
            beginpagenum = endpagenum-10;
        }

        for(int i = beginpagenum; i < endpagenum; i ++){
            Map<Object,String> map = new HashMap<Object, String>();
            String subpage = "'maininfo/"+ dbtype +"/"+ id_array[i] +".html'";
            String hrefinfo ="info?dbtype="+ dbtype +"&id="+ id_array[i];
            map.put("id",id_array[i]);
            map.put("name",name_data[i]);
            map.put("hrefinfo",hrefinfo);
            map.put("subpage",subpage);

            datainfo.add(map);
        }
        data_process.insert_searchhistoryinfo(username,data);
        searchhistoryinfo = data_process.select_searchhistoryinfo(username);

        if(dbtype.equals("disease")){
            dbtag = "疾病";
        } else if (dbtype.equals("drug")){
            dbtag = "药品";
        } else if (dbtype.equals("examination")){
            dbtag = "检查";
        }

        HttpSession session = req.getSession();
        session.setAttribute("datainfo",datainfo);
        session.setAttribute("username",username);
        session.setAttribute("dbtype",dbtype);
        session.setAttribute("searchhistoryinfo",searchhistoryinfo);
        session.setAttribute("searchidinfo",id);
        session.setAttribute("searchcount",id_array.length);
        session.setAttribute("pagenum",pagenum);
        session.setAttribute("begin",begin);
        session.setAttribute("end",end);
        session.setAttribute("data",data);
        session.setAttribute("dbtag",dbtag);

        resp.sendRedirect("search.jsp");
    }
}
