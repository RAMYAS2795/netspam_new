

<%@ page  import="java.sql.*" import="CT.*" import="databaseconnection.*" %>
<%@ include file="aheader.jsp"%>

<H1>
User Behavioral Based Feature
</h3>
<br>
<H3>
<u>Burstiness UB-BST
</u></h3>


<a href="#" onclick="window.open('bst.jsp?id=sajid', 'newwindow', 'width=950, height=500'); return false;"><img align="right" src="images/more.png" width="99" height="66" border="0" alt=""></a> 


	   <div class="bs-docs-example">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Sno</th>
                  <th>Review</th>
                  <th>Product Id</th>
				  <th>Userid </th>
                  <th>Date</th>
				  <th>RB-BST Score
  				  <th>Result
                </tr>
              </thead>
<%
try{

String tab=request.getParameter("tab");
session.setAttribute("tab",tab);

String q1="select * from "+tab; 
//where menu3 ='"+request.getParameter("id")+"' ";	
int c=0;
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();
st1.executeUpdate("delete from metapath ")	;

ResultSet rs=st1.executeQuery(q1);
PreparedStatement ps=con1.prepareStatement("insert into metapath values (?,?,?,?)");
	while(rs.next())
	{
%>

              <tbody>
                <tr>
                  <td><%=++c%></td>
                  <td><font size="3" color=""><%String sub=rs.getString(4);
				  try{
					  out.println(sub.substring(0,20)+"....");
				  }catch(Exception e){
				  	  out.println(sub);
				  }
				  %></font></td>
                  <td><font size="3" color=""><%=rs.getString(2)%></td>
                                   <td><font size="3" color=""><%=rs.getString("userid")%></td>

				  <td><%=rs.getString("date_")%></td>
					<td><% double d1=Bursiness.score(rs.getString("userid"),rs.getString("prodid"),tab);
					out.println(d1);
					%>
					<td><%String res=Bursiness.main(rs.getString("userid"),rs.getString("prodid"),tab);
					if(res.equals("Spam")){out.println("<font color=red>"+res+"</font>");}else{out.println("<font color=blue>"+res+"</font>");}
					%>
<%
				ps.setInt(1,rs.getInt(1));
				  ps.setString(2,res);
				ps.setDouble(3,d1);
				  ps.setString(4,"UB-BST");
				try{ ps.executeUpdate();
				}catch(Exception e){}
			  %>



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

<form method="post" action="negativeratio.jsp">
	<h3><input  type="submit" value="Negative Ratio">
</form>


<%@ include file="footer.jsp"%>