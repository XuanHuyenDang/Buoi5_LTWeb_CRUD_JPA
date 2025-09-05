<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<html>
<head>
<title>Category List</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: #f4f6f9;
	margin: 0;
	padding: 20px;
}

.container {
	max-width: 800px;
	margin: 30px auto;
	background: #fff;
	padding: 25px 30px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #333;
}

.add-btn {
	display: inline-block;
	padding: 10px 15px;
	background: #28a745;
	color: #fff;
	text-decoration: none;
	border-radius: 6px;
	transition: 0.3s;
}

.add-btn:hover {
	background: #218838;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 15px;
}

th, td {
	padding: 12px 15px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

th {
	background: #007bff;
	color: #fff;
}

tr:hover {
	background: #f1f1f1;
}

.action-links {
	display: flex;
	justify-content: center;
	gap: 10px;
}

.edit-btn, .delete-btn {
	padding: 6px 12px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 14px;
	transition: 0.3s;
}

.edit-btn {
	background: #ffc107;
	color: #000;
	text-decoration: none;
}

.edit-btn:hover {
	background: #e0a800;
}

.delete-btn {
	background: #dc3545;
	color: #fff;
}

.delete-btn:hover {
	background: #c82333;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Category List</h2>
		<a href="${pageContext.request.contextPath}/category/create"
			class="add-btn">+ Add New</a>
		<table>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Icon</th>
				<th>Action</th>
			</tr>
			<c:forEach var="c" items="${categories}">
				<tr>
					<td>${c.cateid}</td>
					<td>${c.catename}</td>
					<td>${c.icon}</td>
					<td>
						<div class="action-links">
							<a
								href="${pageContext.request.contextPath}/category/edit/${c.cateid}"
								class="edit-btn">✏ Edit</a>
							<form action="${pageContext.request.contextPath}/category/delete"
								method="post" style="display: inline">
								<input type="hidden" name="cateid" value="${c.cateid}">
								<button type="submit" class="delete-btn">🗑 Delete</button>
							</form>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
