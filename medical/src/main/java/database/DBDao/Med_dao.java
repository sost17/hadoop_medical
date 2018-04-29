package database.DBDao;

import bean.Med_info;
import database.DBUtil;
import database.Interface.Med_Interface;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Med_dao implements Med_Interface {

    private Med_info med_info = null;
    private DBUtil dbUtil = null;
    private Connection conn = null;
    private PreparedStatement pst = null;
    private ResultSet rst = null;

    /**
    * 插入用户信息
    */
    @Override
    public boolean insert_userinfo(String username,String password) {
        boolean result = false;
        String sql = "INSERT INTO usermanager(`username`,`password`) values(?,?)";

        try {
            conn = dbUtil.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setString(1,username);
            pst.setString(2,password);
            int rs = pst.executeUpdate();
            if(rs == 1){
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbUtil.releasesConnection(conn);
        }

        return result;
    }

    /**
     * 插入搜索历史信息
     */
    @Override
    public boolean insert_searchhistory(String username,String content) {
        boolean result = false;
        String sql = "INSERT INTO searchhistory(`content`,`username`) values(?,?)";

        try {
            conn = dbUtil.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setString(1,content);
            pst.setString(2,username);
            int rs = pst.executeUpdate();
            if(rs == 1){
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbUtil.releasesConnection(conn);
        }

        return result;
    }

    /**
    *查询信息
    */
    @Override
    public List<Med_info> select_info(String name ,String table_name,String secondclass) {

        List<Med_info> infoList = new ArrayList<Med_info>();
        String sql = "select id,"+ name +" from "+ table_name +" where second_class='"+ secondclass +"'";

        try{
            conn = dbUtil.getConnection();
            pst = conn.prepareStatement(sql);
            rst = pst.executeQuery();
            while(rst.next()){
                med_info = new Med_info(rst.getInt("id"),rst.getString(name),"info?dbtype="+ name +"&id="+ rst.getInt("id"));
                infoList.add(med_info);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbUtil.releasesConnection(conn);
        }

        return infoList;
    }

    /**
    * 查询用户
    */
    @Override
    public Map<Object,String> select_user(String user) {
        Map<Object,String> userinfo = new HashMap<Object, String>();

        String sql = "select username,password from usermanager where username='"+ user +"'";

        try{
            conn = dbUtil.getConnection();
            pst = conn.prepareStatement(sql);
            rst = pst.executeQuery();
            int flag = 0;
            while(rst.next()){
                flag = 1;
                String username = rst.getString("username");
                String passwd = rst.getString("password");
                userinfo.put("username",username);
                userinfo.put("password",passwd);
            }
            if(flag == 0){
                userinfo.put("username","");
                userinfo.put("password","");
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            dbUtil.releasesConnection(conn);
        }

        return userinfo;
    }

    /**
     * 搜索结果
     * */
    public String[] select_search(String tablename,String[] id){
        String[] datainfo = new String[id.length];

        for(int i = 0; i < id.length ; i ++){
            String sql = "select "+ tablename +" from "+ tablename +"s where id='"+ id[i] +"'";

            try{
                conn = dbUtil.getConnection();
                pst = conn.prepareStatement(sql);
                rst = pst.executeQuery();
                while(rst.next()){
                    datainfo[i] = rst.getString(tablename);
                }
            } catch (SQLException e){
                e.printStackTrace();
            } finally {
                dbUtil.releasesConnection(conn);
            }
        }

        return datainfo;
    }

    /**
     *查询搜索历史
     */
    @Override
    public List select_searchhistory(String username) {

        List infoList = new ArrayList<>();
        String sql = "select distinct content from searchhistory where username = '"+ username +"' order by id desc";

        try{
            conn = dbUtil.getConnection();
            pst = conn.prepareStatement(sql);
            rst = pst.executeQuery();
            while(rst.next()){
                infoList.add(rst.getString("content"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbUtil.releasesConnection(conn);
        }

        return infoList;
    }

    /**
     *查询单个标签信息
     */
    @Override
    public String select_single(String table_name,String searchinfo) {

        String id_array = "";
        String sql = "select id from "+ table_name +"s where "+ table_name +" like '%"+ searchinfo +"%'";

        try{
            int flag = 0;
            conn = dbUtil.getConnection();
            pst = conn.prepareStatement(sql);
            rst = pst.executeQuery();
            while(rst.next()){
                flag = 1;
                id_array += " "+ rst.getInt("id");
            }
            if(flag == 0){
                id_array = "";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbUtil.releasesConnection(conn);
        }

        return id_array;
    }
}
