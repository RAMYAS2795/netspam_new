package CT;
import databaseconnection.*;
import java.sql.*;

public class  Details
{

static Connection con1=null;
static Statement st1=null;
static String res=null;



public static String main(String lid, String menu) {
try{


con1 = databasecon.getconnection();
st1 = con1.createStatement();
 String sql=null;;
sql="select * from "+menu+" where "+menu+"='"+lid+"'";
System.out.println(sql);
ResultSet rs=null;
rs=st1.executeQuery(sql);

if(rs.next())
{
	res=rs.getString("subject_");
}
}
	catch(Exception e){
		System.out.println(e);
	}
	finally{
		try{
		con1.close();
		st1.close();
//		rs.close();
		}
		catch(Exception e){
		System.out.println(e);
		}
	}
	return res;
}


	
	
	public static void main(String[] args) 
	{
	}

}



