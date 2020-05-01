

<%@ page  import="java.sql.*" import="CT.*" import="java.text.DecimalFormat" import="databaseconnection.*" %>

<%@ include file="aheader.jsp"%>

<H1>
Semi-Supervised mode
</h3>

<br>
<H3>
</h3>
	   <%
try{
String q1="select * from spacimity "; 
Connection con1 = databasecon.getconnection();
int c=0;
Statement st1 = con1.createStatement();
Statement st2 = con1.createStatement();
ResultSet rs=st1.executeQuery(q1);
ResultSet rs2=null;
	if(rs.next())
	{
		rs2=st2.executeQuery(q1);
%>
	
	
	<div class="bs-docs-example">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Sno</th>
                  <th>Metapath</th>
                  <th>Probability</th>

                </tr>
              </thead>

	<%

	while(rs.next())
	{
%>

              <tbody>
                <tr>
                  <td><%=++c%></td>
                  <td><font size="3" color=""><%=rs.getString(1)%></font></td>
                  <td><font size="3" color=""><%=rs.getString(2)%></td>
		
<%}
%>	</table>
	</div>		

<form method="post" action="weightcalc.jsp">
	<h3><input  type="submit" value="Weight Calculation">
</form>
<%

	}else{
			out.println("<h3>Pre Labeled Reviews are not available, go with Unsupervised mode..</h3>");
	}
}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>

<br><br><br><br>
<%@ include file="footer.jsp"%>