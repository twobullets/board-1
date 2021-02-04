<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>write</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script language="javascript">
	
		function DataCheck()
		{
		
			if(document.form.title.value == "")
			{
				alert("please write the title");
				document.form.title.focus();
				return;
			}else if(document.form.content.value == "")
			{
				alert("please write the content");
				document.form.content.focus();
				return;
			}
			
			
			form.submit();
			
		}
		
	</script>
	<h1 class="text-center">Good Night Board</h1>
	<article>
		<div class="container" role="main">
			<form name="form" id="form" role="form" method="post"  action="writeok.jsp" >
				<div class="mb-3">
					<label for="title">Title(*)</label>
					<input type="text" class="form-control" name="title" id="title" placeholder="please write the title">
				</div>
				<div class="mb-3">
					<label for="content">Content(*)</label>
					<textarea class="form-control" rows="5" name="content" id="content" placeholder="please write the content" ></textarea>
				</div>
				<div class="mb-3">
					<label for="file">File</label>
					<input type="file" class="form-control" name="fileup" id="fileup">
				</div>
			</form>
			<div align="right">
				<button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="javascript:DataCheck()">Save</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href ='list.jsp';">Cancel</button>
			</div>
		</div>
	</article>
</body>
</html>