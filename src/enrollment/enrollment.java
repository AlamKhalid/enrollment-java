package enrollment;
import java.sql.*;

public class enrollment {
    public String courseid;
    public String coursename;
    public String term;
    public String year;
    public enrollment (String courseid, String coursename, String term, String year) {
        this.courseid = courseid;
        this.coursename = coursename;
        this.term = term;
        this.year = year;
    };
    public int modRecord()  { return 0; };
    public int delRecord()  { return 0; };
    public int addRecord()  { return 0; };
    public int viewRecord() { return 0; };
    
    public static void main(String args[]) {
       
    }
}
