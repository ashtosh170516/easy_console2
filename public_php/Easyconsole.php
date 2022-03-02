<?php session_start(); /* Starts the session */
/* Check Login form submitted */if(isset($_POST['Submit'])){
/* Define username and associated password array */$logins = array('support' => 'apj0702','username1' => 'password1','username2' => 'password2');

/* Check and assign submitted Username and Password to new variable */$Username = isset($_POST['Username']) ? $_POST['Username'] : '';
$Password = isset($_POST['Password']) ? $_POST['Password'] : '';

/* Check Username and Password existence in defined array */if (isset($logins[$Username]) && $logins[$Username] == $Password){
/* Success: Set session variables and redirect to Protected page  */$_SESSION['UserData']['Username']=$logins[$Username];
header("location:home_page.php");
exit;
} else {
/*Unsuccessful attempt: Set error message */$msg="<span style='color:red'>Invalid Login Details</span>";
}
}
?>



<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Easy Console</title>
    <style>
      *{

        padding: 0;
        margin: 0;
        box-sizing: border-box;
      }
      
      body{
        background: rgb(219, 226, 226);
      }
      .row{
        background: white;
        border-radius: 30px;
        box-shadow: 12px  12px 22px grey;
      }
      img{
        border-top-left-radius: 30px;
        border-bottom-left-radius: 30px;
        }

        .btn1{
          border: none;
          outline: none;
          height: 50px;
          width: 100%;
          background-color: black;
          color: white;
          border-radius: 4px;
          font-weight: bold;


        }

        .btn1:hover{
          background: white;
          border: 1px;
          color: black;
        }






    </style>







  </head>
  <body>
  
  

    <section class="form my-4 mx-5">
      <div class="container">
           <div class="row no-gutters">
               <div class="col-lg-5">
                <img src="images/GO_White_Vertical.jpg" class="img-fluid" alt="">
                 
               </div>
                 <div class="col-lg-7 px-5 pt-4">
                  <h1 class="font-weight-bold py-3">Easy Console</h1>
                 <!-- <h4>Enter credentials to login</h4> -->
                  <form action="" method="POST">
                    <div class="form-row">
                      <div class="col-lg-7">

                         <tr>
      <!-- <td align="right" valign="top">Username</td> -->
      <td><input name="Username" type="text" class ="form-control my-3 p-4" placeholder="username" ></td>
    </tr>
                        <!-- <input  name = "id" type="username" placeholder="username"  class ="form-control my-3 p-4"> -->
                        
                      </div>
                    </div>
                     <div class="form-row">
                      <div class="col-lg-7">

                         <tr>
      <!-- <td align="right">Password</td> -->
      <td><input name="Password" type="password" class ="form-control my-3 p-4" placeholder="password"  ></td>
    </tr>
                      <!--  <input name = "pass" type="password" placeholder="password" class ="form-control my-3 p-4" > -->
                        
                      </div>
                    </div>
                     
                     <div class="form-row">
                      <div class="col-lg-7">
                        <tr>
      
      <td><input name="Submit" type="submit" value="Login" class="btn1 mt-2 mb-5"></td>
    </tr>
                        <!-- <button type="Submit" name="Submit" value="login" class="btn1 mt-2 mb-5" >Login</button> -->
                        
                      </div>
                    </div>  







                  </form>

                 </div>

      </div>

       </div>
    </section>







    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>





