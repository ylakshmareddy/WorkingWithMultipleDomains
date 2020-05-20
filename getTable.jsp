<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
<body>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
try{
	Connection con = null;
	String databaseName =request.getParameter("DatabaseName");
	String tableName = request.getParameter("TableName");
	String connectionURL = "jdbc:mysql://localhost/"+databaseName;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection(connectionURL, "LakshmaReddy", "LakshmaReddy");
	String sql = "SELECT * FROM "+tableName;
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	ResultSetMetaData rsmd = rs.getMetaData();
	int columnCount = rsmd.getColumnCount();
	out.println("<table class = 'table table-bordered table-hover'>");
	out.println("<thead>");
	out.println("<tr>");
	for(int i=1; i<=columnCount; i++)
	{
		out.println("<th>");
		out.println(rsmd.getColumnName(i));
		out.println("</th>");
	}
	out.println("</tr>");
	out.println("</thead>");
	out.println("<tbody>");
	while(rs.next())
	{
		out.println("<tr>");
		for(int i=1; i<=columnCount; i++)
		{
			out.println("<td>");
			out.println(rs.getString(i));
			out.println("</td>");
		}
		out.println("</tr>");
	}
	out.println("</tbody>");
	out.println("</table>");
	if(con != null)
	{
		con.close();
	}
}
catch(SQLException e)
{
	out.println(e.getMessage());
}
%>
</body>
</html>





