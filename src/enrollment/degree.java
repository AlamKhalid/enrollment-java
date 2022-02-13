package enrollment;
import java.sql.*;

public class degree {
     public String degreeid;
     public String degreename;

    public degree (String degreeid, String degreename) {
        this.degreeid = degreeid;
        this.degreename = degreename;
    }
    public int modRecord()  { return 0; };
    public int delRecord()  { return 0; };
    public int addRecord()  { return 0; };
    public int viewRecord() { return 0; };
    
    public static void main(String args[]) {
        
    }
}
