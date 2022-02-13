<%@ page import="enrollment.drop" %>
<%@page import="enrollment.coursedegree"%>
<%@page import="enrollment.enrollment"%>
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
    <%
        Class.forName("com.mysql.jdbc.Driver");
        boolean isEmpty = true;
        String id = request.getParameter("id");
        String term = request.getParameter("term");
        String year = request.getParameter("year");
        if(id != null && term != null && year != null) {
            drop.getStudent(id,term,year);
            isEmpty = false;
        }
    %>
    <h1>Load Data of Student by entering values below</h1>
    <form action="#" method="post">
        <div class="form-row">
            <div class="col">
                <input type="text" class="form-control" name="id" placeholder="Student ID" required="true">
            </div>
            <div class="col">
                <input type="text" class="form-control" name="term" placeholder="Current Term" required="true">
            </div>
            <div class="col">
                <input type="text" class="form-control" name="year" placeholder="School Year" required="true">
            </div>
        </div>
        <div class="mt-3 form-row d-flex w-100 justify-content-center">
            <input type="submit" class="btn btn-dark" value="Load Data"/>
        </div>
    </form>
    <% if(!isEmpty) { %>
    <div class="row mt-4">
        <h3 class="col-4">Student ID</h3>
        <h3 class="col-4"><%=drop.Student.studentid%></h3>
    </div>
    <div class="row">
        <h3 class="col-4">Student Name</h3>
        <h3 class="col-4"><%=drop.Student.completename%></h3>
    </div>
    <div class="row">
        <h3 class="col-4">Student Degree</h3>
        <h3 class="col-4"><%=drop.Student.degreeid%></h3>
    </div>
    <h3>User Enrolled Courses Table</h3>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Course ID</th>
            <th scope="col">Course Name</th>
            <th scope="col">Term</th>
            <th scope="col">School Year</th>
        </tr>
        </thead>
        <tbody>
        <%
            int len = drop.EnrollmentList.size();
            for(int i=0; i < len; i++) {
                enrollment en = drop.EnrollmentList.get(i);
        %>
        <tr>
            <th scope="row"><%=en.courseid%></th>
            <td><%=en.coursename%></td>
            <td><%=en.term%></td>
            <td><%=en.year%></td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <h2 class="my-3">Check subjects you want to drop</h2>

    <form action="dodrop.jsp" method="post" class="mb-4">
        <%
            len = drop.CourseList.size();
            for(int i=0; i < len; i++) {
                coursedegree cd = drop.CourseList.get(i);
        %>
        <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" name="<%=cd.courseid%>">
            <label class="form-check-label"><%=cd.coursename%></label>
        </div>  <%}%>
        <button type="submit" class="btn btn-dark">Drop</button>
    </form>
    <%}%>

</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>