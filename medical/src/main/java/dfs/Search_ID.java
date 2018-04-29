package dfs;

import analysisdata.Data_process;
import datamining.Data_cleaning;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Search_ID {
    static FileSystem fileSystem = null;
    static String hdfspath = "/maininfo/";

    /**
     * 获取namenode url
     * */
    public static String hdfsUrl = "hdfs://master:9000";

    /**
     * 获取hdfs的句柄
     * */
    public static FileSystem getHdfs() throws Exception{
        //获取配置文件信息
        Configuration conf = new Configuration();
        //获取文件系统
        fileSystem = FileSystem.get(URI.create(hdfsUrl),conf);

        return fileSystem;
    }

    /**
     * 获取文件路径
     * */
    public static String getfile(String dbtype,String data) throws Exception{
        int i_length = 0;
        if(dbtype.equals("disease")){
            i_length = 3113;
        } else if (dbtype.equals("drug")){
            i_length = 2117;
        } else if (dbtype.equals("examination")){
            i_length = 1564;
        }
        if(data.indexOf(' ') < 1){
            Data_process data_process = new Data_process();
            String id_strarray = "";
            String tempid = "";
            id_strarray = data_process.select_singleinfo(dbtype,data);
            if(!id_strarray.equals("")){
                id_strarray = id_strarray.substring(1,id_strarray.length()) +"\n";
            }
            for (int i = 1; i <= i_length; i ++){
                String fullpath = hdfspath + dbtype +"/"+ i +".html";
                tempid += searchfile(data,fullpath,i);
            }
            id_strarray += tempid.substring(1,tempid.length());
            /**
             * datacleaning
             * */
            String put_data = "";
            Data_cleaning data_cleaning = new Data_cleaning();
            put_data = data_cleaning.single_data(id_strarray);
            return put_data;
        }else{
            List datainfo = new ArrayList();
            String[] data_arrary = data.split("\\s");
            String datatag = "tag";

            for(int j = 0; j < data_arrary.length ; j ++) {
                Map<Object,String> map = new HashMap<Object, String>();
                String id_strarray = "";
                for (int i = 1; i <= i_length; i ++){
                    String fullpath = hdfspath + dbtype +"/"+ i +".html";
                    id_strarray += searchfile(data_arrary[j],fullpath,i);
                }
                map.put(datatag+String.valueOf(j),id_strarray);
                datainfo.add(map);

            }
            /**
             * datacleaning
             * */
            Data_cleaning data_cleaning = new Data_cleaning();
            return data_cleaning.moredata(datainfo);
        }
    }

    /**
     * 打开文件搜索关键字
     * */
    public static String searchfile(String data,String path,int id) throws Exception{
        fileSystem = getHdfs();

            int tag = 0;

            FSDataInputStream inFile = fileSystem.open(new Path(path));

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inFile,"utf-8"));

            String line = new String();
            while((line = bufferedReader.readLine()) != null){
                if(line.indexOf(data) != -1){
                    tag = 1;
                    break;
                }
            }

            if(tag == 1){
                return " "+id;
            }
            inFile.close();

            return "";
    }
}
