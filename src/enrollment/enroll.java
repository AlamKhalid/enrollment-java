package enrollment;
import java.sql.*;
import java.util.*;

public class enroll {
    public static String term;
    public static String year;
    public static students.student                        Student         = new students.student();
    public static ArrayList<enrollment>    EnrollmentList  = new ArrayList<> ();
    public static ArrayList<coursedegree>  CourseList      = new ArrayList<> ();

    public enroll() {}
    public static void getStudent(String id, String t, String y) {
        clearEnrollment();
        term = t;
        year = y;
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from students where studentid=" + id);
            while(rs.next()) {
                Student.studentid = rs.getInt(1);
                Student.completename = rs.getString(2);
                Student.degreeid = rs.getString(3);
            }
            stmt = con.createStatement();
            rs = stmt.executeQuery("select e.courseid,coursename,term,schoolyear from enrollment e,courses c where studentid=" + id+" and e.courseid=c.courseid");
            while(rs.next()) {
                EnrollmentList.add(new enrollment(rs.getString(1),rs.getString(2), rs.getString(3),rs.getString(4) ));
            }
            con.close();
            loadCourses();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public static void clearEnrollment ()   {
        CourseList.clear();
        EnrollmentList.clear();
    }   // clears enrollment data of the student
    public static void loadCourses () {
        try {
            CourseList.clear();
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select c.courseid,coursename,degree from coursedegree cd, courses c where degree='" + enroll.Student.degreeid + "' and c.courseid=cd.courseid");
            while(rs.next()) {
                CourseList.add(new coursedegree(rs.getString(1), rs.getString(2),rs.getString(3)));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }   // load valid courses into the course list
    public static void confirmEnrollment(HashMap<String,String> hm)  {
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
            hm.forEach((k,v) -> {
                if(v != null) {
                    try {
                        PreparedStatement stmt = con.prepareStatement("insert into enrollment values(?,?,?,?)");
                        stmt.setInt(1, Student.studentid);
                        stmt.setString(2, k);
                        stmt.setString(3, term);
                        stmt.setString(4,year);
                        stmt.executeUpdate();
                    } catch (Exception e) {}
                }
            });
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }   // saves enrollment data into the Database

    public static void main(String args[]) {

    }
}
