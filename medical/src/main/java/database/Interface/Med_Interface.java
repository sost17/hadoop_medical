package database.Interface;

import bean.Med_info;

import java.util.List;
import java.util.Map;

public interface Med_Interface {

    /**
    * 插入信息
    */
    public boolean insert_userinfo(String username,String password);

    /**
     * 插入搜索历史信息
     */
    public boolean insert_searchhistory(String username,String content);

    /**
    * 查询信息
    */
    public List<Med_info> select_info(String name,String table_name,String secondclass);

    /**
    * 查询user
    */
    public Map<Object,String> select_user(String user);

    /**
     * 搜索结果
     * */
    public String[] select_search(String tablename,String[] id);

    /**
     *查询搜索历史
     */
    public List select_searchhistory(String username);

    /**
     *查询单个标签信息
     */
    public String select_single(String table_name,String searchinfo);

}
