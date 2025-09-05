<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<html>
<head>
<title>Category Form</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: #f4f6f9;
	margin: 0;
	padding: 20px;
}

.container {
	max-width: 450px;
	margin: 40px auto;
	background: #fff;
	padding: 25px 30px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
}

label {
	font-weight: bold;
	display: block;
	margin-bottom: 6px;
	color: #444;
}

input[type="text"] {
	width: 100%;
	padding: 10px 12px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 6px;
	box-sizing: border-box;
	transition: 0.3s;
}

input[type="text"]:focus {
	border-color: #007bff;
	outline: none;
	box-shadow: 0 0 6px rgba(0, 123, 255, 0.3);
}

button {
	width: 100%;
	padding: 12px;
	background: #007bff;
	color: #fff;
	font-size: 16px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: 0.3s;
}

button:hover {
	background: #0056b3;
}

.back-link {
	display: block;
	margin-top: 15px;
	text-align: center;
	text-decoration: none;
	color: #007bff;
	font-size: 14px;
}

.back-link:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Category Form</h2>
		<form
			action="${pageContext.request.contextPath}/category/${cate == null ? 'create' : 'update'}"
			method="post">
			<input type="hidden" name="cateid" value="${cate.cateid}"> <label
				for="catename">Name:</label> <input type="text" id="catename"
				name="catename" value="${cate.catename}" required> <label
				for="icon">Icon:</label> <input type="text" id="icon" name="icon"
				value="${cate.icon}" required>

			<button type="submit">💾 Save</button>
		</form>
		<a href="${pageContext.request.contextPath}/category"
			class="back-link">⬅ Back to List</a>
	</div>
</body>
</html>
