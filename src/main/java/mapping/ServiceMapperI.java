package mapping;

import domain.service;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ServiceMapperI {
    @Insert("insert into service(serviceid,servicename,location,starttime,endtime,contactpersonname,contactinformation,introduction,peoplenum) values(#{serviceid},#{servicename}, #{location},#{starttime},#{endtime},#{contactpersonname},#{contactinformation},#{introduction},#{peoplenum})")
    public int add(service ser);


    @Select("select * from service where serviceid=#{serviceid}")
     public service getServiceByID(int serviceid);
    //    //使用@Update注解指明update方法要执行的SQL
//    @Update("update users set name=#{name},age=#{age} where id=#{id}")
//    public int update(account user);
//    //使用@Select注解指明getById方法要执行的SQL
    @Select("select * from service")
    public List<service> getAllServices();

    @Select("update service set peoplenum=peoplenum-1 where serviceid=#{serviceid}")
    public int deleteOneRequiredVolunteer(int serviceid);

    @Delete("delete from service where serviceid=#{serviceid}")
    public int deleteById(int serviceid);

//    @Select("select * from seatsreserve where date=#{date}")
//    public List<account> getByDate(String date);
    //使用@Select注解指明getAll方法要执行的SQL
//    @Select("select * from seatsreserve")
//    public List<account> getAll();
}
