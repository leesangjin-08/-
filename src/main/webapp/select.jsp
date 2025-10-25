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
	    <div class="product-list" style="display:none;">
        <% for (int idx = 0; idx < products.size(); idx++) {
               Product prod = products.get(idx);
        %>
        <div class="product-card">
            <img src="images/<%=prod.getId()%>.png" alt="<%=prod.getName()%>">
            <h4><%=prod.getName()%></h4>
            <p><%=prod.getPriceString()%></p>
            <form action="add-prod-servlet" method="POST">
                <input type="hidden" name="idx" value="<%=idx%>">
                <input type="submit" value="選択">
            </form>
        </div>
        <% } %>
    </div>
    
    <%--      ***this is past table mode***

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
			</table> --%>
</div>
	<%
		}
	%>
	
<script>
document.addEventListener("DOMContentLoaded", function() {
    const titles = document.querySelectorAll(".category-title");
    titles.forEach(title => {
        title.addEventListener("click", function() {
            const list = this.nextElementSibling;
            if (list.style.display === "none" || list.style.display === "") {
                list.style.display = "flex";
            } else {
                list.style.display = "none";
            }
        });
    });
});
</script>

</body>
</html>