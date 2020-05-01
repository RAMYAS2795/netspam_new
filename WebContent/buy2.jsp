<%@ page  import="java.sql.*" import="databaseconnection.*" %>

<%@ include file="uheader.jsp"%>

<h3>Purchased Successfully..</h3>
<%String sub=request.getParameter("sub");%>
<%int cost=Integer.parseInt(request.getParameter("cost"));%>
<%String id=request.getParameter("id");%>
<%int tot=Integer.parseInt(request.getParameter("tot"));%>


<%
try{

Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();
st1.executeUpdate("insert into purchase(id, sub, cost, freq, tot_cost, user) values('"+id+"','"+sub+"','"+cost+"','"+tot+"','"+tot*cost+"','"+session.getAttribute("email")+"') ");
}catch(Exception e1)
{
out.println(e1.getMessage());
}

%>
<h3>
<table cellspacing="10" align="center">
<tr>
	<td>Item: <%=sub%></td>
<tr>
	<td>Cost per unit: <%=cost%></td>
<tr>
	<td>No. of Items: <%=tot%></td>
<tr>
	<td>Total Cost: <%=tot*cost%></td>
</tr>
</table>
	<center><A onclick="javascript:print();" style="cursor:hand">Print</A>
</center>
</h3>
<%@ include file="footer.jsp"%>