<%@ page import="enrollment.courses" %>
<%@ page import="enrollment.courses.course" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import= "java.lang.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Course Maintenance</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css"/>
</head>
<body>
<div class="container">
    <a href="index.jsp"><button type="button" class="btn btn-primary my-3">Go Back</button></a>
    <button type="button" class="btn btn-info mr-3" onclick="location.reload()">Refresh</button>
    <! --- View Courses --->
    <div class="table-responsive">
        <table class="table table-fixed">
            <thead class="thead-light">
            <tr>
                <th scope="col" class="col-3">#</th>
                <th scope="col" class="col-3">ID</th>
                <th scope="col" class="col-3">Course Name</th>
                <th scope="col" class="col-3">Department</th>
            </tr>
            </thead>
            <tbody>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    ArrayList<course> crs = courses.viewRecord();
                    int len = crs.size();
                    for(int i=0; i < len; i++) {
                        course cr = crs.get(i);
            %>
            <tr>
                <th scope="row" class="col-3"><%=i+1%></th>
                <td class="col-3"><%=cr.courseid%></td>
                <td class="col-3"><%=cr.coursename%></td>
                <td class="col-3"><%=cr.department%></td>
            </tr>
            <%}
            } catch (Exception e) {
                out.println(e);
            }
            %>
            </tbody>
        </table>
    </div>
    <! --- Add Course --->
    <%
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String degree = request.getParameter("dep");
        if(id != null && name != null && degree != null) {
            courses.addRecord(id,name,degree);
        }
    %>
    <h1 class="text-center mt-5">Add Course</h1>
    <form action="#" method="post">
        <div class="form-row">
            <div class="col">
                <input type="text" class="form-control" name="id" placeholder="Course ID" required="true">
            </div>
            <div class="col">
                <input type="text" class="form-control" name="name" placeholder="Course Name" required="true">
            </div>
            <div class="col">
                <input type="text" class="form-control" name="dep" placeholder="Department" required="true">
            </div>
        </div>
        <div class="mt-3 form-row d-flex w-100 justify-content-center">
            <input type="submit" class="btn btn-dark" value="Add"/>
        </div>
    </form>
    <! --- Mod Course --->
    <%
        id = request.getParameter("u_id");
        name = request.getParameter("u_name");
        degree = request.getParameter("u_dep");
        if(id != null && name != null && degree != null) {
            courses.modRecord(id,name,degree);
        }
    %>
    <h1 class="text-center mt-5">Update Student</h1>
    <form action="#" method="post">
        <div class="form-row">
            <div class="col">
                <input type="text" class="form-control" name="u_id" placeholder="Course ID" required="true">
            </div>
            <div class="col">
                <input type="text" class="form-control" name="u_name" placeholder="Updated Name" required="true">
            </div>
            <div class="col">
                <input type="text" class="form-control" name="u_dep" placeholder="Updated Department" required="true">
            </div>
        </div>
        <div class="mt-3 form-row d-flex w-100 justify-content-center">
            <input type="submit" class="btn btn-warning" value="Update"/>
        </div>
    </form>
    <! --- Delete Course --->
    <%
        id = request.getParameter("d_id");
        if(id != null) {
            courses.delRecord(id);
        }
    %>
    <h1 action="#" class="text-center mt-5">Delete Course</h1>
    <form method="post" class="mb-5">
        <div class="form-row">
            <div class="col">
                <input type="text" class="form-control" name="d_id" placeholder="Course ID" required="true">
            </div>
        </div>
        <div class="mt-3 form-row d-flex w-100 justify-content-center">
            <input type="submit" class="btn btn-danger" value="Delete"/>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
