<?php session_start(); /* Starts the session */
if(!isset($_SESSION['UserData']['Username'])){
header("location:index.php"); 
exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Easy Console</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<style>
nav ul.menu-area{
padding: 20px 20px 0 20px;
background:transparent;
 justify-content: space-between;
 box-shadow: none;
    flex-direction: column;

position:absolute;

display: flex;
flex-wrap:wrap;
width:100%;
top:-9999px;
left:0;
}
nav ul li:hover ul.menu-area{
top:auto;
}




</style>
<body>
  <nav>
    <div class="wrapper">
      <div class="logo"><a href="#" class="navbar-brand"> <img src="images/logo12.jpg" style="margin-top:20px;" width="45"></a></div>
      <input type="radio" name="slider" id="menu-btn">
      <input type="radio" name="slider" id="close-btn">
      <ul class="nav-links">
        <label for="close-btn" class="btn close-btn"><i class="fas fa-times"></i></label>
       

		
		   <li>
         
          <a href="#"  class="dropdown-toggle" data-toggle="dropdown" >Butler</a>
          <div class="mega-box">
		   <ul class="menu-area"  style="list-style:circle;">
            <div class="content">
              <div class="row">
                <img src="images/butler.png" alt="">
              </div>
              <div class="row">
                
                <ul class="mega-links">
                  <li><a href="#">* Get Butler Info</a></li>
                  <li><a href="#">* Pause a Butler</a></li>
                  <li><a href="#">* UnPause a Butler</a></li>
                  <li><a href="#">* Purge a Butler</a></li>
                </ul>
              </div>
              <div class="row">
             
                <ul class="mega-links">
                  <li><a href="#">* Unlimited Loop Test</a></li>
                  <li><a href="#">* Unlimited Lift Test</a></li>
                  <li><a href="#">* Stop a loop test</a></li>
                  <li><a href="#">* Remrestart a Butler</a></li>
                </ul>
              </div>
              <div class="row">
               
                <ul class="mega-links">
                  <li><a href="#">* Get Camera Information</a></li>
                  <li><a href="#">* Sending Init to All Butler</a></li>
                  <li><a href="#">* MDU Update of any Butler</a></li>
                  <li><a href="#">* Reservation Info</a></li>
                </ul>
              </div>
            </div></br>
			</ul>
          </div>
        </li>
		
		
		
		
		
		
		   <li>
          <a href="#" class="desktop-item">Task Manager</a>
           <input type="checkbox" id="showMega">
          <a href="#" class="mobile-item">Task Manager</a>
		  
          <div class="mega-box">
		  <ul class="menu-area">
            <div class="content">
			
              <div class="row">
                <img src="images/task.png" alt="">
              </div>
              <div class="row">
                <ul class="mega-links">
                  <li><a href="nextPage.php"> * Specific PPS taskrec </a></li>
                  <li><a href="#"> *  All pending pick task on PPS </a></li>
                  <li><a href="#"> * All pending pick task on PPS with Order id details</a></li>
				  <li><a href="#">   * All pending pick task in the system</a></li>
				   <li><a href="#">    * Specific audit rec </a></li>
                  <li><a href="#">   * Audit rec by Display id</a></li>
				  <li><a href="#">    * Get all auditrec not complete </a></li>
                  <li><a href="#">   * Get all auditrec on PPS </a></li>
				  <li><a href="#"> * Get all auditlinerec associated to auditrec</a></li>
				  
				  
				 
                </ul>
              </div>
              <div class="row">
                <ul class="mega-links">
                 
                  
				 
				 <li><a href="#">  *   Specific audit taskrec </a></li>
                  <li><a href="#">   *  All audit task pending in the system </a></li>
                  <li><a href="#">  *  All pending audit task on PPS </a></li>
				  <li><a href="#">  * Get all blocked storage node because of Audit  </a></li>
				   <li><a href="#">    *  Audit/Auditline Cycle</a></li>
				   <li><a href="#"> *    Specific move taskrec </a></li>
                  <li><a href="#">     * All move task pending in the system  </a></li>
                  <li><a href="#">  *  All move task pending on one butler  </a></li>
				    <li><a href="#"> *   Butler on which task is assigned  </a></li>
				  
				
                </ul>
              </div>
			   <div class="row">
                <ul class="mega-links">
				
                  
                 
                
				  <li><a href="#"> *      All task on one MSU</a></li>
				<li><a href="#">  *     Change Task status to storing  </a></li>
				 <li><a href="#"> *        Change Task status to complete </a></li>
				  <li><a href="#">  *       Change Butler status to Error </a></li>
				   <li><a href="#">*Clear Task of Butler and make status ready  </a></li>
				 <li><a href="#"> *Clear Task of Butler and make status dead </a></li>
				  <li><a href="#">    *    Clear Sub Task of Butler </a></li>
				  <li><a href="#">     *  Storing task to created / complete</a></li>
				  
				 
                </ul>
              </div>
			   </div></br>
			</ul>
          </div>
             
        </li>
		
		
		
		
		
		
		
		
		 <li>
         
          <a href="#"  class="dropdown-toggle" data-toggle="dropdown" >Orders</a>
          <div class="mega-box">
		   <ul class="menu-area"  style="list-style:circle;">
            <div class="content">
              <div class="row">
                <img src="images/order.png" alt="">
              </div>
              <div class="row">
                
                <ul class="mega-links">
                  <li><a href="#">* All Created Order</a></li>
                  <li><a href="#">* All Pending Order</a></li>
                  <li><a href="#">*  All Temp_unfullilable order</a></li>
                  <li><a href="#">* Temporary unfulfillable order detail</a></li>
				  <li><a href="#">* Call Order Manager</a></li>
                </ul>
              </div>
              <div class="row">
             
               <ul class="mega-links">
                  <li><a href="#">* Order Details (External Id from Internal Id)</a></li>
                  <li><a href="#">* Get Pick Instruction from Order Id</a></li>
                  <li><a href="#">*  All PBT breach order</a></li>
                  <li><a href="#">* Add Order</a></li>
				  
                </ul>
              </div>
              <div class="row">
               
               <ul class="mega-links">
                  <li><a href="#">* Sideline Any Order</a></li>
                  <li><a href="#">* Resume Any Order</a></li>
                  <li><a href="#">*  Get Internal Order Id</a></li>
                  <li><a href="#">* Get Order Status From Core And Platform</a></li>
                </ul>
              </div>
            </div></br>
			</ul>
          </div>
        </li>
		
		
		
		
		
		
		
		
		
		 <li>
         
          <a href="#"  class="dropdown-toggle" data-toggle="dropdown" >Msu</a>
          <div class="mega-box">
		   <ul class="menu-area"  style="list-style:circle;">
            <div class="content">
              <div class="row">
                <img src="images/msu.png" alt="">
              </div>
              <div class="row">
                
                <ul class="mega-links">
                  <li><a href="#">* Get Rack Info </a></li>
                  <li><a href="#">* Get Rack CG </a></li>
                  <li><a href="#">* Update Rack Location </a></li>
                  
                </ul>
              </div>
              <div class="row">
             
                <ul class="mega-links">
				
                  <li><a href="#">* Rack Details from Coordinates </a></li>
                  <li><a href="#">* Get Inventory Information from SKUID</a></li>
                  <li><a href="#">* Specific storage Info</a></li>
                  <li><a href="#">* Available Storage Info </a></li>
                 
                </ul>
              </div>
              <div class="row">
               
                <ul class="mega-links">
                  <li><a href="#">* Block rack from Put</a></li>
                  <li><a href="#">*  Unblock rack from Put</a></li>
                  <li><a href="#">* Get all put block slots report </a></li>
                  <li><a href="#">*  Unblock all put block slots</a></li></ul>
              </div>
            </div></br>
			</ul>
          </div>
        </li>
		
		
		
		
		
		
		
		
		
		
		
		
		 <li>
         
          <a href="#"  class="dropdown-toggle" data-toggle="dropdown" >Charger</a>
          <div class="mega-box">
		   <ul class="menu-area"  style="list-style:circle;">
            <div class="content">
              <div class="row">
                <img src="images/charger.png" alt="">
              </div>
              <div class="row">
                
                 <ul class="mega-links">
                  <li><a href="#">* Get Charfer info</a></li>
                  <li><a href="#">* Get all Charger info</a></li>
                  <li><a href="#">* Get all Charge Task</a></li>
                  <li><a href="#">* Delete a Charge Task</a></li>
                </ul>
              </div>
              <div class="row">
             
                <ul class="mega-links">
                  <li><a href="#">* Fix Charger Error </a></li>
                  <li><a href="#">* Send Init to Charger </a></li>
                  <li><a href="#">* Get Commit ID for all chargers</a></li>
                  <li><a href="#">* Clear attached Buttler from Charger</a></li>
                </ul>
              </div>
             
            </div></br>
			</ul>
          </div>
        </li>
		
		
		
		
		
		
		
		
		
		
		
		
		 <li>
         
          <a href="#"  class="dropdown-toggle" data-toggle="dropdown" >Station Recovery</a>
          <div class="mega-box">
		   <ul class="menu-area"  style="list-style:circle;">
            <div class="content">
              <div class="row">
                <img src="images/pps.png" alt="">
              </div>
              <div class="row">
                
                <ul class="mega-links">
                  <li><a href="#">* Get All Active / Online PPS</a></li>
                  <li><a href="#">* All Empty Bin In System </a></li>
                  <li><a href="#">* All PPS Bin on PPS</a></li>
                  <li><a href="#">* All PPSbinrec on PPS</a></li>
					
			   </ul>
              </div>
              <div class="row">
             
                <ul class="mega-links">
                  <li><a href="#">* Specific PPSbinrec</a></li>
				  <li><a href="#">* PPS Info by ID</a></li>
                  <li><a href="#">* Restart PPS Organise</a></li>
                  <li><a href="#">* Specific PPS Bin</a></li>
                  <li><a href="#">* Reset Any PPS Bin</a></li>
                </ul>
              </div>
              <div class="row">
               
                <ul class="mega-links">
                  <li><a href="#">* Reset PPS Seat </a></li>
                  <li><a href="#">* PPS Crash report for any PPS</a></li>
                  <li><a href="#">* Check PPS Sanity For any PPS</a></li>
                  <li><a href="#">* Station Recovery Help </a></li>
				  <li><a href="#">* Check System Idle</a></li>
                </ul>
              </div>
            </div></br>
			</ul>
          </div>
        </li>
        <li>
         
          <a href="logout.php"  class="dropdown-toggle" data-toggle="dropdown" >Log Out</a>
          <div class="mega-box">
       
          </div>
        </li>
    
		
		
		
		
		
		
		
		
		
		
		
		
		
		<!--
		 <li>
         
          <a href="#"  class="dropdown-toggle" data-toggle="dropdown" >Others</a>
          <div class="mega-box">
		   <ul class="menu-area"  style="list-style:circle;">
            <div class="content">
              <div class="row">
                <img src="pps.png" alt="">
              </div>
              <div class="row">
                <ul class="mega-links">
                  <li><a href="#">* </a></li>
                  <li><a href="#">* </a></li>
                  <li><a href="#">* </a></li>
                  <li><a href="#">* </a></li>
                </ul>
              </div>
              <div class="row">
             
                <ul class="mega-links">
                  <li><a href="#">* </a></li>
                  <li><a href="#">* </a></li>
                  <li><a href="#">* </a></li>
                  <li><a href="#">* </a></li>
                </ul>
              </div>
            </div></br>
			</ul>
          </div>
        </li>
		-->
		
		
		
		
		

      </ul>
      <label for="menu-btn" class="btn menu-btn"><i class="fas fa-bars"></i></label>
    </div>
  </nav>
<section id="header">
</section>
  <div id="hero">

<video loop muted autoplay poster="">

<source src="go.mp4" type="video/mp4">

</video>
</div>



</body>
</html>