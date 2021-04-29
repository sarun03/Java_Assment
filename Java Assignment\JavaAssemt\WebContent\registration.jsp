<%@ page import ="java.sql.*" %>
<%@ page import ="com.microsoft.sqlserver.jdbc.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
    Connection con = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;databaseName=melogin;user=sa;password=root");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into members(first_name, last_name, email, uname, pass) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
%>