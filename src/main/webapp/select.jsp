<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Store" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.LinkedHashMap" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品選択</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@include file = "header-navi.jsp"%>

	<%
		List<Product> listProd;
		Store store = (Store) session.getAttribute("store");
		if (store == null) {
			listProd = new ArrayList<Product>();
		} else {
			listProd = store.getListProd();
		}
		
		//make category map
	    Map<String, List<Product>> categoryMap = new LinkedHashMap<>();
	    for (Product prod : listProd) {
	        String cat = prod.getCategory(); // change enum to string
	        if (!categoryMap.containsKey(cat)) {
	            categoryMap.put(cat, new ArrayList<>()); // if check it is new add list
	        }
	        categoryMap.get(cat).add(prod); // add product that category
	    }
	    
		//if (listProd.size() > 0) {
	%>

			<h2>商品選択</h2>
			
	<%
			// use entrySet() and get them as one n one
    	for (Map.Entry<String, List<Product>> entry : categoryMap.entrySet()) {
        	String category = entry.getKey();
        	List<Product> products = entry.getValue();
	%>
			
		<div class="category-section">
			<h3 class="category-title"><%=category %></h3>

			<table class="select-list category-table">
			<tr>
				<th></th><th>商品分流</th><th>商品ID</th><th>商品名</th><th>価格</th>
			</tr>
				
	<%
		 for (Product prod : products) {
             int idx = listProd.indexOf(prod); // ← 전체 리스트 기준 idx 계산
	%>
				<tr>
					<td>
						<form action="add-prod-servlet" method="POST">
							<input type="hidden" name="idx" value="<%=idx%>">
							<input type="submit" value="選択">
						</form>
					</td>
					<td><%=prod.getId() %></td>
					<td><%=prod.getName() %></td>
					<td><%=prod.getPriceString() %></td>
				</tr>			
	<%
			}
	%>
			</table>
</div>
	<%
		}
	%>
	
<script>
document.addEventListener("DOMContentLoaded", function() {
    const titles = document.querySelectorAll(".category-title");
    titles.forEach(title => {
        title.addEventListener("click", function() {
            const table = this.nextElementSibling;
            if (table.style.display === "none" || table.style.display === "") {
                table.style.display = "table";
            } else {
                table.style.display = "none";
            }
        });
    });
});
</script>

</body>
</html>