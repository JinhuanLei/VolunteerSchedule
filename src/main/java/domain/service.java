package domain;

public class service {
    private  int serviceid;
    private String servicename;
    private  String location;
    private String starttime;
    private String endtime;
    private String contactpersonname;
    private String contactinformation;
    private String introduction;
    private int peoplenum;

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public int getPeoplenum() {
        return peoplenum;
    }

    public void setPeoplenum(int peoplenum) {
        this.peoplenum = peoplenum;
    }

    public int getServiceid() {
        return serviceid;
    }

    public void setServiceid(int serviceid) {
        this.serviceid = serviceid;
    }

    public String getServicename() {
        return servicename;
    }

    public void setServicename(String servicename) {
        this.servicename = servicename;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }



    public String getContactpersonname() {
        return contactpersonname;
    }

    public void setContactpersonname(String contactpersionname) {
        this.contactpersonname = contactpersionname;
    }

    public String getContactinformation() {
        return contactinformation;
    }

    public void setContactinformation(String contactinformation) {
        this.contactinformation = contactinformation;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    @Override
    public String toString() {
        return "id"+serviceid+"name"+servicename+"time";
    }
}
