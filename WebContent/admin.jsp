<%@ include file="header.jsp"%>

<form method="post" action="alogin.jsp">
	
		                  <%
                                                       String m=request.getParameter("m");                                                      
                                                       if(m!=null && m.equalsIgnoreCase("fail"))
                                                       {
                                                               out.println("<font  color='red'><blink><h3>&nbsp;&nbsp;&nbsp;Login Fail   !! </blink></font></h3>");
                                                       }
                                               %>

</div></div><div class="login">
		<div class="main-agileits">
				<div class="form-w3agile form1">
					<h3>Admin Login</h3>
						<div class="key">
							<i class="fa fa-user" aria-hidden="true"></i>
							<input  type="text" required value="Username" name="uid" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}">
							<div class="clearfix"></div>
						</div>
						<div class="key">
							<i class="fa fa-lock" aria-hidden="true"></i>
							<input  type="password" value="Password" name="pwd" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required>
							<div class="clearfix"></div>
						</div>
						<input type="submit" value="Submit">
					</form>
				</div>
				
			</div>
		</div>
<!--footer-->

</form>
<br><br><br><br>
<%@ include file="footer.jsp"%>