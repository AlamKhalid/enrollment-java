<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="enrollment.students" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Drop</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css"/>
</head>
<body>
<div class="container">
    <a href="index.jsp"><button type="button" class="btn btn-primary my-3">Go Back</button></a>
    <button type="button" class="btn btn-info mr-3" onclick="location.reload()">Refresh</button>
    <h1>Enter data below to generate report</h1>
    <form action="#" method="post">
        <div class="form-row">
            <div class="col">
                <input type="text" class="form-control" name="term" placeholder="Term" required="true">
            </div>
            <div class="col">
                <input type="text" class="form-control" name="year" placeholder="School Year" required="true">
            </div>
        </div>
        <div class="mt-3 form-row d-flex w-100 justify-content-center">
            <input type="submit" class="btn btn-dark" value="Generate Report"/>
        </div>
    </form>
    <%
        String term = request.getParameter("term");
        String year = request.getParameter("year");
        if(term != null && year != null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/enrolldb", "root", "0803");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select COUNT(courseid),courseid,term,schoolyear from enrollment where term="+term+" and schoolyear="+year+" group by courseid");
                %>
    <table class="table table-striped my-5">
        <thead>
        <tr>
            <th scope="col">No of Students</th>
            <th scope="col">Course ID</th>
            <th scope="col">Term</th>
            <th scope="col">School Year</th>
        </tr>
        </thead>
        <tbody>



          <%      while (rs.next()) { %>
          <tr>
              <th scope="row"><%=rs.getInt(1)%></th>
              <td><%=rs.getString(2)%></td>
              <td><%=rs.getInt(3)%></td>
              <td><%=rs.getString(4)%></td>
          </tr>
                <%}%>
        </tbody>
    </table><%
                con.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    %>
</div>

</body>
</html>