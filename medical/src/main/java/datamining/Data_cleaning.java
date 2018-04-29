package datamining;

import java.util.*;

public class Data_cleaning {
    static int min_support = 1;

    /**
     * 多条数据
     * */
    public static String moredata(List datainfo){

        String Str_data = "";
        String return_data = "";
        min_support=datainfo.size();

        for(int i = 0 ; i < datainfo.size() ; i ++){
            Map<Object,String> map = (Map<Object, String>) datainfo.get(i);
            Str_data += map.get("tag"+i).substring(1,map.get("tag"+i).length()) +"\n";
        }

        /**
         * hadoop接口
         */
        try{
            HDFS_API hdfs_api = new HDFS_API();
            return_data = hdfs_api.writefile(Str_data,min_support-1);
        } catch (Exception e){
            e.printStackTrace();
        }

        return return_data.substring(1,return_data.length());

    }

    /**
     * 单条数据
     * */
    public static String single_data(String data){
        String Str_data = "";
        /**
         * hadoop接口
         */
        try{
            HDFS_API hdfs_api = new HDFS_API();
            Str_data = hdfs_api.writefile(data,min_support);
        } catch (Exception e){
            e.printStackTrace();
        }
        return Str_data;
    }

}
