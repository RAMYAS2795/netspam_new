

<%@ page  import="java.sql.*" import="CT.*" import="java.text.DecimalFormat" import="databaseconnection.*" %>
<%@ include file="aheader.jsp"%>

<H1>
	Review Linguistic Based Feature
</h3>
<br>
<H3>
<u>
	Ratio of Exclamation Sentences RL-RES, first Person Pronouns RL-PP1
</u>
	
<hr></h3>


<a href="#" onclick="window.open('rese.jsp?id=sajid', 'newwindow', 'width=950, height=500'); return false;"><img align="right" src="images/more.png" width="99" height="66" border="0" alt=""></a> 

	   <div class="bs-docs-example">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Sno</th>
                  <th>Review</th>
                  <th>Rating </th>
                  <th>Product Id</th>
                  <th>Userid</th>
				  <th>Score
					<th>Result

                </tr>
              </thead>

<%
String tab=(String)session.getAttribute("tab");
%>

<%
try{
String q1="select * from "+tab; 
//where menu3 ='"+request.getParameter("id")+"' ";	
int c=0;
DecimalFormat df2 = new DecimalFormat("#.##");

Connection con1 = databasecon.getconnection();
PreparedStatement ps=con1.prepareStatement("insert into metapath values (?,?,?,?)");

Statement st1 = con1.createStatement();
ResultSet rs=st1.executeQuery(q1);
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
                  <td><font size="3" color=""><%=rs.getString(3)%></td>
                  <td><font size="3" color=""><%=rs.getString(2)%></td>
                  <td><%=rs.getString("userid")%></td>
					<td><%double d1=RES.score(rs.getString("review"));
					out.println(d1);
					%>
				 <td><%String res=RES.main(rs.getString("review"));
if(res.equals("Spam")){out.println("<font color=red>"+res+"</font>");}else{out.println("<font color=blue>"+res+"</font>");}									
									
				ps.setInt(1,rs.getInt(1));
				  ps.setString(2,res);
					ps.setDouble(3,d1);
				  ps.setString(4,"RL-RES");
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

<form method="post" action="spacimity.jsp">
	<h3><input  type="submit" value="Spamicity Probability">
</form>


<%@ include file="footer.jsp"%>