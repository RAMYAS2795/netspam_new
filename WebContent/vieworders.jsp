<%@ page   import="databaseconnection.*" %>
<%@ page   import="java.sql.*" %>
<%@ include file="uheader.jsp"%>

	 <div class="spec ">
				<h3>View Your Order Deatils</h3>
					<div class="ser-t">
						<b></b>
						<span><i></i></span>
						<b class="line"></b>
					</div>
			</div>



<br>
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>
<%
int i=10000;
Connection con = databasecon.getconnection();
 st=con.createStatement();





 rs=st.executeQuery("select * from purchase where user='"+session.getAttribute("email")+"' ");

%>

      <table class="table ">
		  <tr>
			<th class="t-head ">Sno</th>
			<th class="t-head ">Product</th>
			<th class="t-head">Cost</th>
		<th class="t-head">Total Purchase</th>
			<th class="t-head">Total Cost</th>
		  </tr>
		  <tr class="cross">

<%
int c=0;
while(rs.next()){
%>

			<td class="t-data">
				<%=++c%>
			<td class="ring-in t-data">
				<%=rs.getString(3)%>
			<td class="t-data">
				<%=rs.getString(4)%>/-
			<td class="ring-in t-data">
				<%=rs.getString(5)%>
			<td class="ring-in t-data">
				<%=rs.getString(6)%>/-
<%
}
%>
	</table>
<br><br><br><br>
<%@ include file="footer.jsp"%>