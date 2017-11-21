package mapping;

import domain.event;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface EventMapperI {

    @Select("select * from event where username=#{username}")
    public List<event> getEventByUsername(String username);


    @Delete("delete from event where eventid=#{eventid}")
    public int deleteById(int eventid);

    @Select("select * from event where status=0")
    public List<event> getEventBystatus();

    @Insert("insert into event(eventid,username,servicename,status) values(#{eventid},#{username}, #{servicename},#{status})")
    public int add(event e);

    @Update("update event set status=1 where eventid=#{eventid}")
    public int update(int eventid);

}
