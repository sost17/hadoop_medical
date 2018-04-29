package analysisdata;

import bean.Med_info;
import database.DBDao.Med_dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Data_process {
    private Med_dao med_dao = null;
    private String json_Arr = "";
    private ToJson toJson = null;

    public String Single_data(int id, String name,String url) {
        toJson = new ToJson();
        String json_data = toJson.ToJson(id, name,url);

        return json_data;
    }

    public String listmed(String secondclass,String tablename){

        /*
        输出jsonArr
        */
        med_dao = new Med_dao();

        List<Med_info> info = med_dao.select_info(tablename, tablename+"s",secondclass);
        String[] Arr_data = new String[4000];
        for (int i = 0; i < info.size(); i++) {
            String single_data = Single_data(info.get(i).getId(),info.get(i).getName(),info.get(i).getUrl());
            Arr_data[i] = single_data;
            String fu = i == info.size() - 1 ? "" : ",";
            json_Arr += Arr_data[i].toString() + fu;
        }
        json_Arr = "[" + json_Arr + "]";

        return json_Arr;
    }

    public Map<Object,String> select_userinfo(String user){
        Map<Object,String> userinfo = new HashMap<Object, String>();
        med_dao = new Med_dao();
        userinfo = med_dao.select_user(user);

        return userinfo;
    }

    public boolean insert_user(String user,String passwd){
        boolean result = false;
        med_dao = new Med_dao();
        result = med_dao.insert_userinfo(user,passwd);

        return result;
    }

    public String[] select_searchinfo(String tablename,String[] id){
        med_dao = new Med_dao();
        return med_dao.select_search(tablename,id);
    }

    public boolean insert_searchhistoryinfo(String username,String content){
        med_dao = new Med_dao();
        return med_dao.insert_searchhistory(username, content);
    }

    public List select_searchhistoryinfo(String username) {
        med_dao = new Med_dao();
        return med_dao.select_searchhistory(username);
    }

    public String select_singleinfo(String table_name,String searchinfo) {
        med_dao = new Med_dao();
        return med_dao.select_single(table_name,searchinfo);
    }

}
