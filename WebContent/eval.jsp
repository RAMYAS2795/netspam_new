

<%@ page  import="java.sql.*"  import="java.io.*" import="CT.*" import="databaseconnection.*" %>
<%@ include file="aheader.jsp"%>
	<div class="spec ">
				<h3>Features weights</h3>
					<div class="ser-t">
						<b></b>
						<span><i></i></span>
						<b class="line"></b>
					</div>
			</div>

			<%
			File f=new File("E:/workspace/NetSpamUpdated/WebContent/images/g1.jpg");
		
			Evaluation1.main(f);
			 f=new File("E:/workspace/NetSpamUpdated/WebContent/images/g2.jpg");
			Evaluation2.main(f);

%>

			<div class="col-md-6 about-right">
			<img class="img-responsive" src="images/g1.jpg" alt="">
			</div>

			<div class="col-md-6 about-left">
			<img class="img-responsive" src="images/g2.jpg" alt="">
			</div>	</div>
<br><br><br>
<center>
<h2>Labeling:
</h3><br><br>
<%
try{
String q1="select avg(Weight) from weights"; 
int c=0;
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();
ResultSet rs=st1.executeQuery(q1);
	while(rs.next())
	{
		out.println("<h3>Spamicity probability is "+rs.getFloat(1));
}
}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>

</h3>
<br><br><br>
<%@ include file="footer.jsp"%>