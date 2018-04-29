package analysisdata;

import bean.Med_info;
import com.google.gson.Gson;

public class ToJson {

    Gson gson = new Gson();

    public String ToJson(int id,String name,String url){
        Med_info info = new Med_info(id,name,url);
        String jsonobject = gson.toJson(info);
        return jsonobject;
    }
}
