<%@ include file="aheader.jsp"%>
<br><br>

<%@ page   import="CT.*" %>


<%@ page  import="java.sql.*"  import="java.util.Date" import="databaseconnection.*" %>
<%@ page  import="java.text.SimpleDateFormat" %>

<%
String newDateString="";
try{
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();
st1.executeUpdate("delete from reviews2")	;
}


catch(Exception e1)
{
out.println(e1.getMessage());
}

%>



<%

String file = request.getParameter("file");
System.out.println(file);

try
{
	XLToDB.insertRecords(file);
	
	}
catch(Exception e1)
{
out.println(e1);
}

%>
<h2>Data Uploaded from Excel.
</h2>

	   <div class="bs-docs-example">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Sno</th>
                  <th>Review</th>
                  <th>Rating </th>
                  <th>Product Id</th>
                  <th>Userid Id</th>
                  <th>Date</th>
                </tr>
              </thead>
<%
try{
String q1="select * from reviews2"; 
//where menu3 ='"+request.getParameter("id")+"' ";	
int c=0;
String date="";
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();
Statement st2 = con1.createStatement();
ResultSet rs=st1.executeQuery(q1);
	while(rs.next())
	{
		date=rs.getString("date_");
		date=date.replace("T00:00:00.000Z","");
		date=date.replace("T00:00:00Z","");
		date=date.replace("T05:00:00Z","");

		String NEW_FORMAT = "dd/MM/yyyy";
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = sdf.parse(date);
		sdf.applyPattern(NEW_FORMAT);
		newDateString = sdf.format(d);

    // Format the date to Strings
    
 
		st2.executeUpdate("update reviews2 set date_= '"+newDateString+"' where sno='"+rs.getString(1)+"' ");
%>

              <tbody>
                <tr>
                  <td><%=++c%></td>
                  <td><font size="3" color=""><%=rs.getString(4)%></font></td>
                  <td><font size="3" color=""><%=rs.getString(3)%></td>
                  <td><font size="3" color=""><%=rs.getString(2)%></td>
                  <td><font size="3" color=""><%=rs.getString(5)%></td>


                  <td><%=newDateString%></td>

                </tr>


<%}
}
catch(Exception e1)
{
out.println(e1.getMessage());
}

%>


			</table>

	
<form method="post" action="burstiness.jsp?tab=reviews2">
	<h3><input  type="submit" value="Feature Types">
</form>
	</div>		
<br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%>