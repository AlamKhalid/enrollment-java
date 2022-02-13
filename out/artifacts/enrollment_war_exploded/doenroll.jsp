<%@ page import="java.util.HashMap" %>
<%@ page import="enrollment.enroll" %>
<%@page import="enrollment.coursedegree"%>
<!DOCTYPE html>
<html lang="en">
<head></head>
<body>
    <%
        HashMap<String,String> hm = new HashMap<>();
        int len = enroll.CourseList.size();
        for(int i=0; i < len; i++) {
            coursedegree cd = enroll.CourseList.get(i);
            hm.put(cd.courseid,request.getParameter(cd.courseid));
        }
        enroll.confirmEnrollment(hm);
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    %>

</body>
</html>

