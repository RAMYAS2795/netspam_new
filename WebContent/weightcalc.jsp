

<%@ page  import="java.sql.*" import="CT.*" import="java.text.DecimalFormat" import="databaseconnection.*" %>

<%@ include file="aheader.jsp"%>

<H1>
Weight Calculation</h3>
<br>
<H3>
</h3>
	   <div class="bs-docs-example">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Sno</th>
                  <th>Metapath </th>
                  <th>Weight</th>

                </tr>
              </thead>
<%
try{
String q1="select* from spacimity"; 
Connection con1 = databasecon.getconnection();
PreparedStatement ps=con1.prepareStatement("insert into weights values (?,?)");
int c=0;
Statement st1 = con1.createStatement();
Statement st2 = con1.createStatement();
st1.executeUpdate("delete from weights");
ResultSet rs=st1.executeQuery(q1);
ResultSet rs2=null;
double up=0.0;
double down=0.0;
double we=0.0;
double spam=0;
	while(rs.next())
	{ 
		 up=0.0;
		 down=0.0;
		
		String feature=rs.getString(1);//1111111111111111111111111111
		rs2=st2.executeQuery("select * from metapath where feature='"+feature+"'  ");	
		while(rs2.next()){
			String temp=rs2.getString("spam");
			if(temp.equals("Spam"))
				spam=1;
			else
				 spam=0;

			down=down+rs2.getDouble("score");	
			up=up+(rs2.getDouble("score")*rs.getDouble("score")*spam);

		}
				we=up/down;//2222222222222222
				ps.setString(1,feature);
				ps.setDouble(2,we);

				
				try{ ps.executeUpdate();
				}catch(Exception e){
				System.out.println(e);
				}

											%>

              <tbody>
                <tr>
                  <td><%=++c%></td>
                  <td><font size="3" color=""><%=feature%></font></td>
                  <td><font size="3" color=""><%=we%></td>


<%}
}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>
	</table>
	</div>		

<a href="eval.jsp">Next</a>

<%@ include file="footer.jsp"%>