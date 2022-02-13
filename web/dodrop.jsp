<%@ page import="java.util.HashMap" %>
<%@ page import="enrollment.drop" %>
<%@page import="enrollment.coursedegree"%>
<!DOCTYPE html>
<html lang="en">
<head></head>
<body>
<%
    HashMap<String,String> hm = new HashMap<>();
    int len = drop.CourseList.size();
    for(int i=0; i < len; i++) {
        coursedegree cd = drop.CourseList.get(i);
        hm.put(cd.courseid,request.getParameter(cd.courseid));
    }
    drop.confirmDrop(hm);
    response.sendRedirect(request.getContextPath()+"/index.jsp");
%>

</body>
</html>

