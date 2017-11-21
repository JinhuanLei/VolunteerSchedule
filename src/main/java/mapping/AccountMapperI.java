package mapping;

import domain.account;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface AccountMapperI {
    @Insert("insert into account(userid,username,password,type,email,phonenumber,city,firstname,lastname) values(#{userid},#{username}, #{password},#{type},#{email},#{phonenumber},#{city},#{firstname},#{lastname})")
    public int add(account act);


//    //使用@Update注解指明update方法要执行的SQL
//    @Update("update users set name=#{name},age=#{age} where id=#{id}")
//    public int update(account user);
//    //使用@Select注解指明getById方法要执行的SQL
    @Select("select * from account where username=#{username}")
    public account getByUsername(String username);

    @Select("select * from account")
    public List<account> getAllAccounts();

    @Delete("delete from account where username=#{accountname}")
    public int deleteByName(String accountname);

    @Update("update account set firstname=#{firstname}, lastname=#{lastname}, email=#{email}, city=#{city}, phonenumber=#{phonenumber} where username=#{username}")
    public int update(account a);
//    @Select("select * from seatsreserve where date=#{date}")
//    public List<account> getByDate(String date);
    //使用@Select注解指明getAll方法要执行的SQL
//    @Select("select * from seatsreserve")
//    public List<account> getAll();

}
