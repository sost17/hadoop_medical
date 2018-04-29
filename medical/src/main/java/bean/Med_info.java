package bean;

public class Med_info {
    private int id;
    private String name;
    private String url;

    public Med_info(int id , String name, String url){
        this.setId(id);
        this.setName(name);
        this.setUrl(url);
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
