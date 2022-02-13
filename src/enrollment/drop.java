/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enrollment;
import java.sql.*;
import java.util.*;

public class drop {
    public static int term;
    public static int year;
    public static students.student  Student         = new students.student();
    public static ArrayList<enrollment>    EnrollmentList  = new ArrayList<> ();
    public static ArrayList<coursedegree>  CourseList      = new ArrayList<> ();

    public drop() {};                                   // perform all the necessary data loading from DB
    public static void getStudent(String id, String t, String y) {
        clearDrop();
        term = Integer.parseInt(t);
        year = Integer.parseInt(y);
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
            con.close();
            loadEnrollment();
            loadCourses();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void clearDrop ()         {
        EnrollmentList.clear();
        CourseList.clear();
    }   // clears dropping data of the student
    public static void loadEnrollment ()    {
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select e.courseid,coursename,term,schoolyear from enrollment e,courses c where studentid=" + Student.studentid+" and e.courseid=c.courseid");
            while(rs.next()) {
                EnrollmentList.add(new enrollment(rs.getString(1),rs.getString(2), rs.getString(3),rs.getString(4) ));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }   // load enrollment data of the student
    public static void loadCourses () {
        try {
            CourseList.clear();
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select c.courseid,coursename,degree from coursedegree cd, courses c where degree='" + Student.degreeid + "' and c.courseid=cd.courseid");
            while(rs.next()) {
                CourseList.add(new coursedegree(rs.getString(1), rs.getString(2),rs.getString(3)));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public static void confirmDrop(HashMap<String,String> hm)        {
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
            hm.forEach((k,v) -> {
                if(v != null) {
                    try {
                        PreparedStatement stmt = con.prepareStatement("delete from enrollment where studentid=? and courseid=? and term=? and schoolyear=?");
                        stmt.setInt(1, Student.studentid);
                        stmt.setString(2, k);
                        stmt.setInt(3, term);
                        stmt.setInt(4,year);
                        stmt.executeUpdate();
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                }
            });
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }   // saves dropping data into the Database
    
}
