<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Product Edit</title>
<script type ="text/javascript">
	function deleteConfirm(id){
		if(confirm("Delete the product!") == true)
			location.href = "./deleteProduct.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
	<jsp:include page = "menu.jsp"/>
	<div class = "jumbotron">
		<div class="container" >
			<h1 class="display-3">Edit</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
			%>
			<div class="col-md-4">
				<img src="./upload2/<%=rs.getString("p_fileName") %>"
				style="width:100%">
				<h3><%= rs.getString("p_name") %></h3>
				<p><%= rs.getString("p_description") %></p>
				<p><%= rs.getString("p_UnitPrice") %></p>
				<p><a href="./updateProduct.jsp?id=<%=rs.getString("p_id") %>"
						class="btn btn-success" role="button"> Edit &raquo;</a>
				<a href="#" onclick = "deleteConfirm('<%=rs.getString("p_id") %>')"
				 		class ="btn btn-danger" role="button"> Remove &raquo;</a>						
			</div>
			<%
				}
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>