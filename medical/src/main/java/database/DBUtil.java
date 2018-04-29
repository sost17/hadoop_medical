package database;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DBUtil {

    /*
    * 释放连接
    */
    public static void releasesConnection(Connection connection){
        try{
            if(connection != null){
//                System.out.println("start");
                connection.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private static DataSource dataSource = null;
    static{
        /*dataSource 资源只能释放一次*/
        dataSource = new ComboPooledDataSource("MySql");
    }

    /*
    * 获取连接
    */
    public static Connection getConnection() throws SQLException{
        return dataSource.getConnection();
    }

}
