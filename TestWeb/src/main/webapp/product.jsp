<%@ page contentType="text/html; charset=utf-8"%>
<%-- <%@ page import="dto.Product"%> --%>
<%-- <%@ page import="dao.ProductRepository"%> --%>
<%@ page errorPage ="exceptionNoProductId.jsp"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>More Information</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("Would you like to add the product to your shopping cart?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">Information</h1>
		</div>
	</div>
<%-- 	<% --%>
<!--  		String id = request.getParameter("id"); -->
<!--  		ProductRepository dao = ProductRepository.getInstance(); -->
<!--  		Product product = dao.getProductById(id); -->
<%-- 	%> --%>

	 <%@ include file="dbconn.jsp"%>
	<%
		String id = request.getParameter("id");
		String sql = "select * from product where p_id = '"+id+"'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next())
		{
	%>
	<div class="container">
		<div class="row">
			<div class ="col-md-5">
				<img src="./upload2/<%=rs.getString("p_filename")%>" style="width: 100%" />
			</div>
			<div class="col-md-6">
<%-- 				<h3><%=product.getPname()%></h3> --%>
<%-- 				<p><%=product.getDescription()%> --%>
<%-- 				<p><b>상품 코드 : </b><span class="badge badge-danger"> <%=product.getProductId()%></span> --%>
<%-- 				<p><b>제조사</b> : <%=product.getManufacturer()%> --%>
<%-- 				<p><b>분류</b> : <%=product.getCategory()%> --%>
<%-- 				<p><b>재고 수</b> : <%=product.getUnitsInStock()%> --%>
<%-- 				<h4><%=product.getUnitPrice()%>원</h4> --%>
<%-- 				<p><form name="addForm" action="./addCart.jsp?id=<%=product.getProductId()%>" method="post"> --%>

				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%></p>
				<p><b>Product Code : </b><span class="badge badge-danger" style="color:Red"> <%=rs.getString("p_id")%></span>
				<p><b>Brand</b> : <%=rs.getString("p_manufacturer")%>
				<p><b>Category</b> : <%=rs.getString("p_category")%>
				<p><b>Units</b> : <%=rs.getString("p_unitsInStock")%>
				<h4><%=rs.getString("p_unitprice")%>원</h4>
				<p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> Order &raquo;</a> 
					<a href="./cart.jsp" class="btn btn-warning"> Cart &raquo;</a>
					<a href="./Ring.jsp" class="btn btn-secondary"> List &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
		<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>
	<jsp:include page="footer.jsp" />
</body>
</html>
