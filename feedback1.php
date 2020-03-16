
<!DOCTYPE html>
<html>
<head>
	<title>User Registration | PHP</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>



<div>
	<form action="registration.php" method="post">
		<div class="container">
			
			<div class="row">
				<div class="col-sm-3">
					<h1>Feedback</h1>
					<hr class="mb-3">
					<label for="firstname"><b>Name</b></label>
					<input class="form-control" id="firstname" type="text" name="firstname" required>
					<label for="email"><b>email</b></label>
					<input class="form-control" id="email"  type="text" name="email" required>
					<label for="Review"><b>review</b></label>
					<textarea rows="6" cols="40" placeholder="Your review" ></textarea>
					<div class="button">
					<input class="btn" type="submit" id="register" name="create" value="submit">
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<style>
h2{
	text-align:center;
}
body
{background-color:lightblue;
}
.row
{
	position:relative;
	left:1000px;
	top:60px;
}	
.col-sm-3
{
	height: 520px;
	width: 1050px;
	margin-top: auto;
	margin-bottom: auto;
	background: #f39c12;
	position: relative;
	display: flex;
	justify-content: center;
	flex-direction: column;
	padding: 10px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	-webkit-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	-moz-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	border-radius: 5px;
	position:relative;
	left:300px;
	top:60px;
}
h1{
	position:relative;
	top:10px;
left:40px;}
.btn
{
	padding: 15px 32px;
	width:250px;
	background-color:DodgerBlue;
	 font-weight: bold;
	
}

.button
{
position:relative;
	left:10px;
	top:20px;
	
	
	

}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script type="text/javascript">
	
	
</script>
</body>
</html>