package mapping;

import domain.account;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface AccountMapperI {
    @Insert("insert into account(userid,username,password,type,email,phonenumber,city) values(#{userid},#{username}, #{password},#{type},#{email},#{phonenumber},#{city})")
    public int add(account act);


//    //使用@Update注解指明update方法要执行的SQL
//    @Update("update users set name=#{name},age=#{age} where id=#{id}")
//    public int update(account user);
//    //使用@Select注解指明getById方法要执行的SQL
    @Select("select * from account where username=#{username}")
    public account getByUsername(String username);

    @Select("select * from account")
    public List<account> getAllAccounts();
//    @Select("select * from seatsreserve where date=#{date}")
//    public List<account> getByDate(String date);
    //使用@Select注解指明getAll方法要执行的SQL
//    @Select("select * from seatsreserve")
//    public List<account> getAll();

}
