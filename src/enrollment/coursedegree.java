package enrollment;
import java.sql.*;

public class coursedegree {

    public String courseid;
    public String coursename;
    public String degree;

    public coursedegree (String courseid, String coursename, String degree) {
        this.courseid = courseid;
        this.coursename = coursename;
        this.degree = degree;
    };
    public int modRecord()  { return 0; };
    public int delRecord()  { return 0; };
    public int addRecord()  { return 0; };
    public int viewRecord() { return 0; };

    public static void main(String args[]) {

    }
}
