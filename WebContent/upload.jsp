<%@ page  import="java.sql.*" import="CT.*" %>
<%@ include file="aheader.jsp"%>

<center><br><br><br>
<font size="" color=""><h2>Dataset Upload:</h2><br></font>
<form method="post" action="xlupload.jsp">
	<input type="file" name="file" required accept=".xlsx"><input type="submit" value="Upload">
</form>
<br><br><br><br><br>	
<%@ include file="footer.jsp"%>