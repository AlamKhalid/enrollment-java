package enrollment;
import java.sql.*;
import java.util.ArrayList;

public class students {

    public static class student {
        public int studentid;
        public String completename;
        public String degreeid;
        public student() {}
        public student(int studentid, String completename, String degreeid) {
            this.studentid = studentid;
            this.completename = completename;
            this.degreeid = degreeid;
        }
    }

    public students () {}

    public static boolean modRecord(int id, String name, String degree)  {
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
            PreparedStatement stmt = con.prepareStatement("update students set completename=?,degreeid=? where studentid=?");
            stmt.setString(1,name);
            stmt.setString(2,degree);
            stmt.setInt(3,id);
            stmt.executeUpdate();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public static boolean delRecord(int id)  {
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
            PreparedStatement stmt1 = con.prepareStatement("delete from enrollment where studentid=?");
            PreparedStatement stmt2 = con.prepareStatement("delete from students where studentid=?");
            stmt1.setInt(1,id);
            stmt1.executeUpdate();
            stmt2.setInt(1,id);
            stmt2.executeUpdate();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public static boolean addRecord(int id, String name, String degree)  {
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
            PreparedStatement stmt = con.prepareStatement("insert into students values(?,?,?)");
            stmt.setInt(1,id);
            stmt.setString(2,name);
            stmt.setString(3,degree);
            stmt.executeUpdate();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public static ArrayList<student> viewRecord() {
        try {
            ArrayList<student> stds = new ArrayList<>();
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from students");
            while (rs.next()) {
                stds.add(new student(rs.getInt(1),rs.getString(2),rs.getString(3)));
            }
            return stds;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
    public static void main(String args[]) {
    }
}
