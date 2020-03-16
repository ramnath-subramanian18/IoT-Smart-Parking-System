  
<?php 

session_start();
	if(!isset($_SESSION['userlogin'])){
		header("Location: bookings.php");
	}

	if(isset($_GET['logout'])){
		session_destroy();
		unset($_SESSION);
		header("Location: login.php");
	}

?>
<html>
<body>
<div class="first">
<p>Welcome to parking system</p>
<button class="button1"><a href="bookings.php">booking</a></button>


<button class="button2"><a href="booking1.php" >booking history</a></button>
<button class="button4"><a href="feedback1.html" >Feedbacks</a></button>
<button class="button3"><a href="index.php?logout=true">Logout</a></button>
</div>
</body>
</html>
<style>
.first{
	height: 460px;
	width: 350px;
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
	left:600px;
	top:200px;
}
body
{background-color:lightblue;
}
p
{
	font-size:29px;
	font-weight: bold;
	position:relative;
	top:-70px;
}
.button1
{border: white;
  padding: 18px;
  color: white;
  background-color:#4CAF50;
  text-align: center;
  cursor: pointer;
  width: 77%;
  font-size: 20px;
  position:relative;
  top:-10px;
  left:37px;
  

}
.button2
{border: white;
  padding: 18px;
  color: white;
  background-color:#4CAF50;
  text-align: center;
  cursor: pointer;
  width: 77%;
  font-size: 20px;
  position:relative;
  top:-0px;
  left:37px;

}
.button3
{border: white;
  padding: 18px;
  color: white;
  background-color:#4CAF50;
  text-align: center;
  cursor: pointer;
  width: 77%;
  font-size: 20px;
  position:relative;
  top:20px;
  left:37px;

}
.button4
{border: white;
  padding: 18px;
  color: white;
  background-color:#4CAF50;
  text-align: center;
  cursor: pointer;
  width: 77%;
  font-size: 20px;
  position:relative;
  top:10px;
  left:37px;

}
</style>