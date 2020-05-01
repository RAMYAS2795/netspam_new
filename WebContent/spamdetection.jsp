

<%@ page  import="java.sql.*" import="CT.*" import="databaseconnection.*" %>
<%@ include file="aheader.jsp"%>
<h1>Unsupervised Mode
</h1><br>
<h2>Goal to  Calculate spamicity</h1>
<br>
<a href="upload.jsp"><font size="+1" color="#fe1052">Upload Dataset</font></a>
<br>
<br>



<H3>
Loaded all application reviews
</h3>
	   <div class="bs-docs-example">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Sno</th>
                  <th>Review</th>
                  <th>Rating </th>
                  <th>Product Id</th>
                  <th>User</th>
                  <th>Date</th>
                </tr>
              </thead>
<%
try{
String q1="select * from reviews"; 
//where menu3 ='"+request.getParameter("id")+"' ";	
int c=0;
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();
ResultSet rs=st1.executeQuery(q1);
	while(rs.next())
	{
%>

              <tbody>
                <tr>
                  <td><%=++c%></td>
                  <td><font size="3" color=""><%=rs.getString(4)%></font></td>
                  <td><font size="3" color=""><%=rs.getString(3)%></td>
                  <td><font size="3" color=""><%=rs.getString(2)%>:&nbsp;<%=Details.main(rs.getString(2),"menu3")%></td>
                  <td><%=rs.getString(7)%></td>
                  <td><%=rs.getString(6)%></td>

                </tr>


<%}
}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>


			</table>
	</div>		

<form method="post" action="burstiness.jsp?tab=reviews">
	<h3><input  type="submit" value="Feature Types">
</form>


<%@ include file="footer.jsp"%>