<?php session_start(); /* Starts the session */
if(!isset($_SESSION['UserData']['Username'])){
header("location:Easyconsole.php"); 
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
                 <li><a href="/cgi-bin/butler/get_butler.sh">* Get Butler Info</a></li>
                  <li><a href="/cgi-bin/butler/pause_butler.sh">* Pause a Butler</a></li>
                  <li><a href="/cgi-bin/butler/UnPause_butler.sh">* UnPause a Butler</a></li>
                  <li><a href="/cgi-bin/butler/Purge_butler.sh">* Purge a Butler</a></li>
                </ul>
              </div>
              <div class="row">
             
                <ul class="mega-links">
                <li><a href="/cgi-bin/butler/loop_test_without_count.sh">* Unlimited Loop Test</a></li>
                  <li><a href="/cgi-bin/butler/unlimited_lift_test.sh">* Unlimited Lift Test</a></li>
                  <li><a href="/cgi-bin/butler/stop_loop.sh">* Stop a loop test</a></li>
                  <li><a href="/cgi-bin/butler/remrestart.sh">* Remrestart a Butler</a></li>
                </ul>
              </div>
              <div class="row">
               
                <ul class="mega-links">
                   <li><a href="/cgi-bin/butler/get_camera.sh">* Get Camera Information</a></li>
                  <li><a href="/cgi-bin/butler/init_all_butler.sh">* Sending Init to All Butler</a></li>
                  <li><a href="/cgi-bin/butler/mdu_update.sh">* MDU Update of any Butler</a></li>
                  <li><a href="/cgi-bin/butler/reservation_info.sh">* Reservation Info</a></li>
				  <li><a href="/cgi-bin/butler/clear_exclusive_reservation.sh">* Clear Butler Reservation</a></li>
				  <li><a href="/cgi-bin/butler/ods_excluded.sh">*  Ods Table Update</a></li>
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
                  <li><a href="/cgi-bin/Task/ppstaskrec_id.sh"> * Specific PPS taskrec </a></li>
                  <li><a href="/cgi-bin/Task/pick_task_pending_pps.sh"> *  All pending pick task on PPS </a></li>
                  <li><a href="/cgi-bin/Task/pick_task_on_pps_with_order_id.sh"> * All pending pick task on PPS with Order id details</a></li>
				  <li><a href="/cgi-bin/Task/pps_task_pending_system.sh">   * All pending pick task in the system</a></li>
				   <li><a href="/cgi-bin/Task/auditrec_id.sh">    * Specific audit rec </a></li>
                  <li><a href="/cgi-bin/Task/auditrec_display_id.sh">   * Audit rec by Display id</a></li>
				  <li><a href="/cgi-bin/Task/all_auditrec.sh">    * Get all auditrec not complete </a></li>
                  <li><a href="/cgi-bin/Task/auditrec_pps.sh">   * Get all auditrec on PPS </a></li>
				  <li><a href="/cgi-bin/Task/auditlinerec_pending.sh"> * Get all auditlinerec associated to auditrec</a></li>
				  
				  
				 
                </ul>
              </div>
              <div class="row">
                <ul class="mega-links">
                 
                  
				 
				 <li><a href="/cgi-bin/Task/audittaskrec_id.sh"> *   Specific audit taskrec </a></li>
				 <li><a href="/cgi-bin/Task/auditrec_display_id.sh"> * Auditrec by Display id </a></li>
				 <li><a href="/cgi-bin/Task/all_auditrec.sh"> * Get all auditrec not complete </a></li>
                  <li><a href="/cgi-bin/Task/audittaskpending_system.sh">   *  All audit task pending in the system </a></li>
                  <li><a href="/cgi-bin/Task/auditrec_pps.sh">  *  All pending audit task on PPS </a></li>
				  <li><a href="/cgi-bin/Task/block_storage_node.sh">  * Get all blocked storage node because of Audit  </a></li>
				   <li><a href="/cgi-bin/Task/audit_help.sh">    *  Audit/Auditline Cycle</a></li>
				   <li><a href="/cgi-bin/Task/movetaskrec_id.sh"> *    Specific move taskrec </a></li>
                  <li><a href="/cgi-bin/Task/move_task_pending_system.sh">     * All move task pending in the system  </a></li>
                  <li><a href="/cgi-bin/Task/move_task_pending_butler.sh">  *  All move task pending on one butler  </a></li>
				    <li><a href="/cgi-bin/Task/butler_associated_to_task.sh"> *   Butler on which task is assigned  </a></li>
				  
				
                </ul>
              </div>
			   <div class="row">
                <ul class="mega-links">
				
                  
                 
                
				<li><a href="/cgi-bin/Task/task_associated_to_rack.sh"> *      All task on one MSU</a></li>
				<li><a href="/cgi-bin/Task/change_status_to_storing.sh">  *     Change Task status to storing  </a></li>
				 <li><a href="/cgi-bin/Task/change_status_to_complete.sh"> *        Change Task status to complete </a></li>
				  <li><a href="/cgi-bin/Task/butlerstatus_error.sh">  *       Change Butler status to Error </a></li>
				   <li><a href="/cgi-bin/Task/clear_task_butler_ready.sh">*Clear Task of Butler and make status ready  </a></li>
				 <li><a href="/cgi-bin/Task/clear_task_butler_dead.sh"> *Clear Task of Butler and make status dead </a></li>
				  <li><a href="/cgi-bin/Task/clear_subtask_butler.sh">    *    Clear Sub Task of Butler </a></li>
				  <li><a href="/cgi-bin/Task/change_status_to_created.sh">     *  Change Task status to created</a></li>
				  <li><a href="/cgi-bin/Task/clear_task_from_butler.sh">     *  Clear complete task from Butler</a></li>
				  
				 
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
                  <li><a href="/cgi-bin/order/all_created_order.sh">* All Created Order</a></li>
                  <li><a href="/cgi-bin/order/all_pending_order.sh">* All Pending Order</a></li>
                  <li><a href="/cgi-bin/order/all_temp_unfullilable_order.sh">*  All Temp_unfullilable order</a></li>
                  <li><a href="/cgi-bin/order/temp_unfulfillable_order.sh">* Temporary unfulfillable order detail</a></li>
				  <li><a href="/cgi-bin/order/call_order.sh">* Call Order Manager</a></li>
                </ul>
              </div>
              <div class="row">
             
               <ul class="mega-links">
                 <li><a href="/cgi-bin/order/specific_order.sh">* Order Details (External Id from Internal Id)</a></li>
                  <li><a href="/cgi-bin/order/pick_instruction.sh">* Get Pick Instruction from Order Id</a></li>
                  <li><a href="/cgi-bin/order/pbt_breached.sh">*  All PBT breach order</a></li>
                  <li><a href="/cgi-bin/order/add_order.sh">* Add Order</a></li>
				  
                </ul>
              </div>
              <div class="row">
               
               <ul class="mega-links">
                 <li><a href="/cgi-bin/order/sideline_order.sh">* Sideline Any Order</a></li>
                  <li><a href="/cgi-bin/order/resume_order.sh">* Resume Any Order</a></li>
                  <li><a href="/cgi-bin/order/internal_order_id.sh">*  Get Internal Order Id</a></li>
                  <li><a href="'/cgi-bin/order/order_from_core_platform.sh">* Get Order Status From Core And Platform</a></li>
                  <li><a href="'/cgi-bin/order/current_order_on_pps.sh">* Current order on PPS</a></li>
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
                  <li><a href="/cgi-bin/MSU/rackinfo.sh">* Get Rack Info </a></li>
                  <li><a href="/cgi-bin/MSU/check_rack_CG.sh">* Get Rack CG </a></li>
                  <li><a href="/cgi-bin/MSU/update_rack.sh">* Update Rack Location </a></li>
				  <li><a href="/cgi-bin/MSU/rack_details_from_coordinates.sh">* Rack Details from Coordinates </a></li>
				  
                  
                </ul>
              </div>
              <div class="row">
             
                <ul class="mega-links">
				
                  
                  <li><a href="/cgi-bin/MSU/sku_inventory.sh">* Get Inventory Information from SKUID</a></li>
                  <li><a href="/cgi-bin/MSU/sku_inventory_transaction.sh">*  Inventory transactions against any SKU</a></li>
                  <li><a href="/cgi-bin/MSU/storage_info.sh">* Specific storage Info</a></li>
                  <li><a href="/cgi-bin/MSU/available_storage.sh">* Available Storage Info </a></li>
                 
                </ul>
              </div>
              <div class="row">
               
                <ul class="mega-links">
                   <li><a href="/cgi-bin/MSU/put_block.sh">* Block rack from Put</a></li>
                  <li><a href="/cgi-bin/MSU/put_unblock.sh">*  Unblock rack from Put</a></li>
                  <li><a href="/cgi-bin/MSU/all_put_block_slot.sh">* Get all put block slots report </a></li>
                
                 
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
                   <li><a href="/cgi-bin/charger/get_charger.sh">* Get Charfer info</a></li>
                  <li><a href="/cgi-bin/charger/charger_all.sh">* Get all Charger info</a></li>
                  <li><a href="/cgi-bin/charger/chargertaskrec.sh">* Get all Charge Task</a></li>
                  <li><a href="/cgi-bin/charger/delete_chargetask.sh">* Delete a Charge Task</a></li>
                </ul>
              </div>
              <div class="row">
             
                <ul class="mega-links">
                <li><a href="/cgi-bin/charger/fix_charger.sh">* Fix Charger Error </a></li>
                  <li><a href="/cgi-bin/charger/send_charger_init.sh">* Send Init to Charger </a></li>
                  <li><a href="/cgi-bin/charger/check_commit_id.sh">* Get Commit ID for all chargers</a></li>
                  <li><a href="/cgi-bin/charger/clear_attached_butler.sh">* Clear attached Buttler from Charger</a></li>
                  <li><a href="/cgi-bin/charger/clear_butler_block.sh">* Clear blocked Butler from Charger</a></li>
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
                 <li><a href="/cgi-bin/pps/active_pps.sh">* Get All Active / Online PPS</a></li>
                  <li><a href="/cgi-bin/pps/all_empty_bin.sh">* All Empty Bin In System </a></li>
                  <li><a href="/cgi-bin/pps/all_pps_bin.sh">* All PPS Bin on PPS</a></li>
                  <li><a href="/cgi-bin/pps/all_ppsbinrec.sh">* All PPSbinrec on PPS</a></li>
					
			   </ul>
              </div>
              <div class="row">
             
                <ul class="mega-links">
                 <li><a href="/cgi-bin/pps/ppsbinrec_id.sh">* Specific PPSbinrec</a></li>
				  <li><a href="/cgi-bin/pps/ppsinfo_id.sh">* PPS Info by ID</a></li>
                  <li><a href="/cgi-bin/pps/restart_pps.sh">* Restart PPS Organise</a></li>
                  <li><a href="/cgi-bin/pps/specific_pps_bin.sh">* Specific PPS Bin</a></li>
                  <li><a href="/cgi-bin/pps/reset_ppsbin.sh">* Reset Any PPS Bin</a></li>
                </ul>
              </div>
              <div class="row">
               
                <ul class="mega-links">
                  <li><a href="/cgi-bin/pps/reset_seat.sh">* Reset PPS Seat </a></li>
                  <li><a href="/cgi-bin/pps/pps_crash.sh">* PPS Crash report for any PPS</a></li>
                  <li><a href="/cgi-bin/pps/pps_sanity.sh">* Check PPS Sanity For any PPS</a></li>
                  <li><a href="/cgi-bin/pps/station_help.sh">* Station Recovery Help </a></li>
				  <li><a href="/cgi-bin/pps/system_idle.sh">* Check System Idle</a></li>
                </ul>
              </div>
            </div></br>
			</ul>
          </div>
        </li>
		<li>
         
          <a href="#"  class="dropdown-toggle" data-toggle="dropdown" >Others</a>
          <div class="mega-box">
		   <ul class="menu-area"  style="list-style:circle;">
            <div class="content">
              <div class="row">
                <img src="images/pps.png" alt="">
              </div>
              <div class="row">
                
                <ul class="mega-links">
                 <li><a href="/cgi-bin/pps/system_pause.sh">* Apply Emergency Pause</a></li>
                  <li><a href="/cgi-bin/pps/remove_emergency_stop.sh">* Remove Emergency Stop </a></li>
                  <li><a href="/cgi-bin/pps/remove_emergency_pause.sh">* Remove Emergency Pause</a></li>
                  <li><a href="/cgi-bin/pps/remove_gate_breach.sh">* Remove Gate Breach</a></li>
					
			   </ul>
              </div>
              <div class="row">
             
                <ul class="mega-links">
                 <li><a href="/cgi-bin/pps/remove_zone_pause.sh">* Remove Zone Pause</a></li>
				  <li><a href="/cgi-bin/pps/remove_zone_clear.sh">* Remove Zone Clear</a></li>
                  <li><a href="/cgi-bin/MSU/clear_elevator_reservation.sh">*Clear elevator reservation</a></li>
                  <li><a href="/cgi-bin/MSU/connect_elevator.sh">* Connect Elevator</a></li>
                  <li><a href="/cgi-bin/MSU/disconnect_elevator.sh">* Disconnect Elevator</a></li>
                </ul>
              </div>
              <div class="row">
               
                <ul class="mega-links">
                  <li><a href="/cgi-bin/MSU/metabase_restart.sh">* Restart Metabase </a></li>
                  <li><a href="/cgi-bin/MSU/rollcage_data.sh">* Get Rollcage Info</a></li>
                  <li><a href="/cgi-bin/MSU/rollcage_clear.sh">* Clear Rollcage info</a></li>
                  <li><a href="/cgi-bin/pps/dock_station_info.sh">* Dock Station Info </a></li>
				  <li><a href="/cgi-bin/pps/dock_station_reset_hard.sh">* Hard reset dockstation</a></li>
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