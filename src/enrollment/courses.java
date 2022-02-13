package enrollment;
import java.sql.*;
import java.util.ArrayList;

public class courses {

    public static class course {
        public String courseid;
        public String coursename;
        public String department;

        public course(String courseid, String coursename, String department) {
            this.courseid = courseid;
            this.coursename = coursename;
            this.department = department;
        }
    }

    public courses () {};

    public static boolean modRecord(String id, String name, String dep)  {
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
            PreparedStatement stmt = con.prepareStatement("update courses set coursename=?,department=? where courseid=?");
            stmt.setString(1,name);
            stmt.setString(2,dep);
            stmt.setString(3,id);
            stmt.executeUpdate();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public static boolean delRecord(String id)  {
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
            PreparedStatement stmt1 = con.prepareStatement("delete from enrollment where courseid=?");
            PreparedStatement stmt2 = con.prepareStatement("delete from courses where courseid=?");
            stmt1.setString(1,id);
            stmt1.executeUpdate();
            stmt2.setString(1,id);
            stmt2.executeUpdate();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public static boolean addRecord(String id, String name, String dep)  {
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
            PreparedStatement stmt = con.prepareStatement("insert into courses values(?,?,?)");
            stmt.setString(1,id);
            stmt.setString(2,name);
            stmt.setString(3,dep);
            stmt.executeUpdate();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public static ArrayList<course> viewRecord() {
        try {
            ArrayList<course> crs = new ArrayList<>();
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from courses");
            while (rs.next()) {
                crs.add(new course(rs.getString(1),rs.getString(2),rs.getString(3)));
            }
            return crs;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
    public static void main(String args[]) {
        
    }
}
