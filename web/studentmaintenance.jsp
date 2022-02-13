<%@ page import="enrollment.students" %>
<%@ page import="enrollment.students.student" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import= "java.lang.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Student Maintenance</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css"/>
</head>
<body>
<div class="container">
    <a href="index.jsp"><button type="button" class="btn btn-primary my-3">Go Back</button></a>
    <button type="button" class="btn btn-info mr-3" onclick="location.reload()">Refresh</button>
    <! --- View Students --->
    <div class="table-responsive">
        <table class="table table-fixed">
            <thead class="thead-light">
            <tr>
                <th scope="col" class="col-3">#</th>
                <th scope="col" class="col-3">ID</th>
                <th scope="col" class="col-3">Full Name</th>
                <th scope="col" class="col-3">Degree</th>
            </tr>
            </thead>
            <tbody>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                ArrayList<student> stds = students.viewRecord();
                int len = stds.size();
                for(int i=0; i < len; i++) {
                    student std = stds.get(i);
                %>
                <tr>

                    <th scope="row" class="col-3"><%=i+1%></th>
                    <td class="col-3"><%=std.studentid%></td>
                    <td class="col-3"><%=std.completename%></td>
                    <td class="col-3"><%=std.degreeid%></td>
                </tr>
                <%}
            } catch (Exception e) {
                out.println(e);
            }
        %>
            </tbody>
        </table>
    </div>
    <! --- Add Student --->
    <%
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String degree = request.getParameter("degree");
        if(id != null && name != null && degree != null) {
            students.addRecord(Integer.parseInt(id),name,degree);
        }
    %>
    <h1 class="text-center mt-5">Add Student</h1>
    <form action="#" method="post">
        <div class="form-row">
            <div class="col">
                <input type="text" class="form-control" name="id" placeholder="Student ID" required="true">
            </div>
            <div class="col">
                <input type="text" class="form-control" name="name" placeholder="Full Name" required="true">
            </div>
            <div class="col">
                <input type="text" class="form-control" name="degree" placeholder="Degree" required="true">
            </div>
        </div>
        <div class="mt-3 form-row d-flex w-100 justify-content-center">
            <input type="submit" class="btn btn-dark" value="Add"/>
        </div>
    </form>
    <! --- Mod Students --->
    <%
        id = request.getParameter("u_id");
        name = request.getParameter("u_name");
        degree = request.getParameter("u_degree");
        if(id != null && name != null && degree != null) {
            students.modRecord(Integer.parseInt(id),name,degree);
        }
    %>
    <h1 class="text-center mt-5">Update Student</h1>
    <form action="#" method="post">
        <div class="form-row">
            <div class="col">
                <input type="text" class="form-control" name="u_id" placeholder="Student ID" required="true">
            </div>
            <div class="col">
                <input type="text" class="form-control" name="u_name" placeholder="Updated Name" required="true">
            </div>
            <div class="col">
                <input type="text" class="form-control" name="u_degree" placeholder="Updated Degree" required="true">
            </div>
        </div>
        <div class="mt-3 form-row d-flex w-100 justify-content-center">
            <input type="submit" class="btn btn-warning" value="Update"/>
        </div>
    </form>
    <! --- Delete Student --->
    <%
        id = request.getParameter("d_id");
        if(id != null) {
            students.delRecord(Integer.parseInt(id));
        }
    %>
    <h1 action="#" class="text-center mt-5">Delete Student</h1>
    <form method="post" class="mb-5">
        <div class="form-row">
            <div class="col">
                <input type="text" class="form-control" name="d_id" placeholder="Student ID" required="true">
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
