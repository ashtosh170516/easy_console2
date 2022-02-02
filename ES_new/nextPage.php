<?php session_start(); /* Starts the session */
if(!isset($_SESSION['UserData']['Username'])){
header("location:index.php"); 
exit;
}
?>

<!DOCTYPE html>

<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="nextPage.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
  <div class="container" >
  	 <div class="title">
	  <div class="logo"><a href="Easyconsole.php" class="navbar-brand">  <img src="images/logo12.jpg" style="margin-top:20px;" width="45" /></a></div>
   
   </div>


	
    <div class="content">
      <form action="#">
        <div class="user-details">
          <div class="input-box">
            <span class="details">PPS_ID</span>
            <input type="text" placeholder="Enter PPS_ID" required>
          </div>
          <div class="input-box">
            <span class="details">Type 1 for key and 2 for record</span>
            <input type="number" min="1" max="2" placeholder="Enter 1 or 2" required>
          </div>
          
        <div class="button" style="width:100%;">
          <input type="submit" value="Search"  onclick="showHide()">
        </div>
		
      </form>
    </div>
  </div>
  

  
	<div class="container" style="position:absolute; width:88%; display: none;" id="hidden_div">
	<hr>
     <h3 align="center">RESPONSE</h3>
	 <hr>
		Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

Why do we use it?
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).


			<!--    DISPLAY RESPONSE HERE   --->

	</div>
  
   </div>
   
 <script type="text/javascript">
    function showHide() {
            document.getElementById("hidden_div").style.display = "block";
    }
</script>    

</body>
</html>
