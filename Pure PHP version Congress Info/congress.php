<!DOCTYPE html>
<html>

    <head>
        
        <meta charset="utf-8">
        <title>Congress Search</title>
        <meta name="description" content="HomeWork 6">
        
        <style>
            
            body {
                font-family: "Times New Roman", Georgia, serif;
            }
            
            table#input {
                border-collapse: collapse;
                border: 1px solid grey;
                text-align: center;
            }
            
            table#output_1 , #output_1 th, #output_1 td{
                border-collapse: collapse;
                border: 1px solid black;
                width: 800px;
            }
            
            #output_1_nameCol {
                text-align: left;
                padding-left: 80px;
            }
            
            table.output_2 {
                border-collapse: collapse;
                border: 1px solid black;
                text-align: left;
                width: 800px;
            }
            
            .output_2_left {
                padding-left: 200px;
            }
            
            #output_2_pic {
                padding-top: 20px;
                padding-bottom: 20px;
            }
            
            .paddingDown {
                padding-bottom: 20px;
            }
            
            .output_2_left_2 {
                padding-left: 120px;
            }
            
            .output_2_right_2 {
                padding-left: 100px;
            }
            
            .paddingBillTop {
                padding-top: 30px;
            }
            
            .paddingBillBottom {
                padding-bottom: 30px;
            }
            
            .api_noResult {
                font-style: italic;
                font-weight: bold;
                text-align: center;
            }
        
        </style>
        
        <script>
            
            function keywordChanger() {
                var input = document.getElementById("mySelect").value;
                if(input == "Legislators") { var output = "State/Representative*"; }
                else if(input == "Committees") { var output = "Committee ID*"; }
                else if(input == "Bills") { var output = "Bill ID*"; }
                else if(input == "Amendments") { var output = "Amendment ID*"; }
                document.getElementById("keyword").innerHTML = output;
            }
            
            function clearButton() {
 			    document.getElementById("mySelect").selectedIndex = 0;
                document.getElementById("keyword").innerHTML = "Keyword*";
                document.getElementById("defaultRadio").checked = true;
                document.getElementById("textInput").value = "";
                location.href = "http://cs-server.usc.edu:35309/szcBossmanHW6/congress.php"; //alter to serverSide site, not the perfect solution but ok. Can also be realized 
                                                                                             //by using DOM
            }
            
            function alertMissing() {
                var errMsg = "";
                var selectDB = document.getElementById("mySelect");
                var dbInput = selectDB.options[selectDB.selectedIndex].value;
                if (dbInput == "default") {
                    errMsg += "Please enter the following missing information:\nCongree Database";
                }
                var textInput = document.getElementById("textInput").value;
                if (textInput == "" && errMsg != "") {
                    errMsg += ", keyword.";
                }
                else if(textInput == "" && errMsg == "") {
                    errMsg += "Please enter the following missing information:\nKeyword"
                }
                
                if(errMsg != "") {
                    window.alert(errMsg);
                    return false;
                }
                return true;
            }
        
        </script>
    
    </head>

    <body>
        
        <h1 align ="center">Congress information search</h1>
        <form name="searchForm"  id="searchForm" action="congress.php" method="post" onsubmit = "return alertMissing();">
            <table id="input" align = "center">
                <tr>
                    <td>Congress Database</td>
                    <td>
                        <select name="selectDatabase"  id="mySelect" onchange="keywordChanger()">
                            <option value="default" selected disabled>Select your option</option>
                            <option value="Legislators" 
                                    <?php 
                                    if(isset($_POST["selectDatabase"]) && $_POST["selectDatabase"] == "Legislators" 
                                       || isset($_GET["bioguide_id"]))  echo "selected";
                                    ?>
                                    >Legislators</option>
                            <option value="Committees" 
                                    <?php 
                                    if(isset($_POST["selectDatabase"]) && $_POST["selectDatabase"] == "Committees")  echo "selected";
                                    ?>
                                    >Committees</option>
                            <option value="Bills" 
                                    <?php 
                                    if(isset($_POST["selectDatabase"]) && $_POST["selectDatabase"] == "Bills" 
                                       || isset($_GET["bill_id"]))  echo "selected";
                                    ?>
                                    >Bills</option>
                            <option value="Amendments" 
                                    <?php 
                                    if(isset($_POST["selectDatabase"]) && $_POST["selectDatabase"] == "Amendments")  echo "selected";
                                    ?>
                                    >Amendments</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Chamber</td>
                    <td>
                        <input type="radio" name="chamberRadio" id="defaultRadio" value="senate" checked/>Senate
                        <input type="radio" name="chamberRadio" value="house" 
                               <?php 
                               if(isset($_POST["chamberRadio"]) && $_POST["chamberRadio"] == "house" 
                                  || isset($_GET["bioguide_id"]) && $_GET["chamber"] == "house" 
                                  || isset($_GET["bill_id"]) && $_GET["chamber"] == "house")
                                   echo "checked";
                               ?>
                               />House
                    </td>
                </tr>
                <tr>
                    <td>
                       <div id="keyword">
                           <?php
                            if(isset($_POST["selectDatabase"])) {
                                $input = $_POST["selectDatabase"];
                                if($input == "Legislators") { echo "State/Representative*"; }
                                else if($input == "Committees") { echo "Committee ID*"; }
                                else if($input == "Bills") { echo "Bill ID*"; }
                                else if($input == "Amendments") { echo "Amendment ID*"; }
                            }
                            elseif(isset($_GET["bioguide_id"])) { echo "State/Representative*";}
                            elseif(isset($_GET["bill_id"])) { echo "Bill ID*";}
                            else { echo "Keyword*"; }
                           ?>
                        </div>
                    </td>
                    <td>
                        <input type="text" id="textInput" name="searchKeyword" 
                               value="<?php 
                                        if(isset($_POST["searchKeyword"])) { echo $_POST["searchKeyword"]; }
                                        else { echo ""; }
                                        if(isset($_GET["searchKeyword"])) { echo $_GET["searchKeyword"]; }
                                        else { echo ""; }
                                      ?>">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" name="submit" value="Search">
                        <input type="button" value="Clear" onclick="clearButton()">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a href="http://sunlightfoundation.com" target="_blank">Powered by Sunlight Foundation
                        </a>
                    </td>
                </tr>  
            </table>
        </form>
            
        <?php
            
            $dictionary = array("alabama" => "AL", "alaska" => "AK", "arizona" => "AZ", "arkansas" => "AR","california" => "CA", "colorado" => "CO", "connecticut" => "CT", "delaware" => "DE", "connecticut" => "CT", "district of columbia" => "DC", "florida" => "FL", "georgia" => "GA", "hawaii" => "HI", "idaho" => "ID", "illinois" => "IL", "indiana" => "IN", "iowa" => "IA", "kansas" => "KS", "kentucky" => "KY", "louisiana" => "LA", "maine" => "ME", "maryland" => "MD", "massachusetts" => "MA", "michigan" => "MI", "minnesota" => "MN", "mississippi" => "MS", "missouri" => "MO", "montana" => "MT", "nebraska" => "NE", "nevada" => "NV", "new hampshire" => "NH", "new jersey" => "NJ", "new mexico" => "NM", "new york" => "NY", "north carolina" => "NC", "north dakota" => "ND", "ohio" => "OH", "oklahoma" => "OK", "oregon" => "OR", "pennsylvania" => "PA", "rhode island" => "RI", "south carolina" => "SC", "south dakota" => "SD", "tennessee" => "TN", "texas" => "TX", "utah" => "UT", "vermont" => "VT", "virginia" => "VA", "washington" => "WA", "west virginia" => "WV", "wisconsin" => "WI", "wyoming" => "WY");
                
        
            if(isset($_POST["submit"])) {
                 $database = strtolower($_POST["selectDatabase"]);
                 $chamber  = $_POST["chamberRadio"];
                 $searchKeyword  = $_POST["searchKeyword"];
                 $apiKey = "74f382f8d9074b28aec33bd36fc6b509";
            
                if($database == "legislators") {
                    $trimedKeyword = trim($searchKeyword);
                    $checkIfFullName = explode(" ", $trimedKeyword);
                    if(count($checkIfFullName) == 1) {
                        if(array_key_exists(trim(strtolower($searchKeyword)), $dictionary)) {
                            $stateCode = $dictionary[trim(strtolower($searchKeyword))];
                            $path  = "congress.api.sunlightfoundation.com/" .$database. "?";
                            $query = "chamber=" .$chamber. "&state=" .$stateCode. "&apikey=" .$apiKey;
                            $url = $path.$query;
                        }
                        else {
                            $representative = trim($searchKeyword);
                            $path  = "congress.api.sunlightfoundation.com/" .$database. "?";
                            $query = "chamber=" .$chamber. "&query=" .$representative. "&apikey=" .$apiKey;
                            $url = $path.$query;
                        }
                    }
                    else {
                        $tempNameArray = [];
                        for($i = 0; $i < count($checkIfFullName); $i++) {
                            if($checkIfFullName[$i] != null) {
                                $tempNameArray[] = $checkIfFullName[$i];
                            }
                        }
                        if(count($tempNameArray) == 2) {
                            $firstNameKeyword   = ucfirst(strtolower($tempNameArray[0]));
                            $lastNameKeyword   = ucfirst(strtolower($tempNameArray[1]));
                        }
                        else {
                            $firstNameKeyword   = ucfirst(strtolower($tempNameArray[0]));
                            $lastNameKeyword_f  = ucfirst(strtolower($tempNameArray[1]));
                            $lastNameKeyword_l  = ucfirst(strtolower($tempNameArray[2]));
                            $lastNameKeyword    = $lastNameKeyword_f. "%20" .$lastNameKeyword_l;
                        }   
                        $path  = "congress.api.sunlightfoundation.com/" .$database. "?";
                        $query = "chamber=" .$chamber. "&first_name=" .$firstNameKeyword. "&last_name=" .$lastNameKeyword. "&apikey=" .$apiKey;
                        $url = $path.$query;
                    }
                }
                elseif($database == "committees") {
                    $cmtID = trim(strtoupper($searchKeyword));
                    $path  = "congress.api.sunlightfoundation.com/" .$database. "?";
                    $query = "committee_id=" .$cmtID. "&chamber=" .$chamber. "&apikey=" .$apiKey;
                    $url = $path.$query;
                }
                elseif($database == "bills") {
                    $billID = trim(strtolower($searchKeyword));
                    $path  = "congress.api.sunlightfoundation.com/" .$database. "?";
                    $query = "bill_id=" .$billID. "&chamber=" .$chamber. "&apikey=" .$apiKey;
                    $url = $path.$query;
                }
                elseif($database == "amendments") {
                    $amdmID = trim(strtolower($searchKeyword));
                    $path  = "congress.api.sunlightfoundation.com/" .$database. "?";
                    $query = "amendment_id=" .$amdmID. "&chamber=" .$chamber. "&apikey=" .$apiKey;
                    $url = $path.$query;
                }
                
                $request  = file_get_contents("http://".$url);
                $response = json_decode($request,true);
                
                $tableLen = $response['page']['count'];
                echo "<br/><br/>";
                if($tableLen > 0) {
                    echo "<table id = \"output_1\" align = \"center\">";
                        if($database == "legislators") {
                            echo "<tr>";
                                echo "<th>Name</th> <th>State</th> <th>Chamber</th> <th>Details</th>";
                            echo"</tr>";
                            for($i = 0; $i < $tableLen; $i++) {
                                $firstName = $response['results'][$i]['first_name'];
                                $lastName  = $response['results'][$i]['last_name'];
                                $name = $firstName. " " .$lastName;
                                echo "<tr><td id = \"output_1_nameCol\" align = \"center\">$name</td>";
                                $stateName = $response['results'][$i]['state_name'];
                                echo "<td align = \"center\">$stateName</td>";
                                $chamber = $response['results'][$i]['chamber'];
                                echo "<td align = \"center\">$chamber</td>";
                                $bioID = $response['results'][$i]['bioguide_id'];
                                $secondQuery = "chamber=" .$chamber. "&state=" .$response['results'][$i]['state']. "&bioguide_id=" .$bioID. "&apikey=" .$apiKey. "&searchKeyword=" .$searchKeyword;
                                echo "<td align = \"center\"><a href = \"congress.php/?$secondQuery\">View Details</a></td></tr>";
                            }
                        }
                        elseif($database == "committees") {
                            echo "<tr>";
                                echo "<th>Committee ID</th> <th>Committee Name</th> <th>Chamber</th>";
                            echo "</tr>";
                            for($i = 0; $i < $tableLen; $i++) {
                                $comID = $response['results'][$i]['committee_id'];
                                echo "<tr><td align = \"center\">$comID</td>";
                                $comName = $response['results'][$i]['name'];
                                echo "<td align = \"center\">$comName</td>";
                                $comChamber = $response['results'][$i]['chamber'];
                                echo "<td align = \"center\">$comChamber</td></tr>";
                            }
                        }
                        elseif($database == "bills") {
                            echo "<tr>";
                                echo "<th>Bill ID</th> <th>Short Title</th> <th>Chamber</th> <th>Details</th>";
                            echo "</tr>";
                            for($i = 0; $i < $tableLen; $i++) {
                                $billID = $response['results'][$i]['bill_id'];
                                echo "<tr><td align = \"center\">$billID</td>";
                                $billTitle = $response['results'][$i]['short_title'];
                                if($billTitle == null) {
                                    echo "<td align = \"center\">N.A.</td>";
                                }
                                else {
                                    echo "<td align = \"center\">$billTitle</td>";
                                }
                                $billChamber = $response['results'][$i]['chamber'];
                                echo "<td align = \"center\">$billChamber</td>";
                                $secondQuery = "bill_id=" .$billID. "&chamber=" .$chamber. "&apikey=" .$apiKey. "&searchKeyword=" .$searchKeyword;
                                echo "<td align = \"center\"><a href = \"congress.php/?$secondQuery\">View Details</a></td></tr>";
                            }
                        }
                        elseif($database == "amendments") {
                            echo "<tr>";
                                echo "<th>Amendment ID</th> <th>Amendment Type</th> <th>Chamber</th> <th>Introduced on</th>";
                            echo "</tr>";
                            for($i = 0; $i < $tableLen; $i++) {
                                $amdmID = $response['results'][$i]['amendment_id'];
                                echo "<tr><td align = \"center\">$amdmID</td>";
                                $amdmType = $response['results'][$i]['amendment_type'];
                                echo "<td align = \"center\">$amdmType</td>";
                                $amdmChamber = $response['results'][$i]['chamber'];
                                echo "<td align = \"center\">$amdmChamber</td>";
                                $amdmIntro = $response['results'][$i]['introduced_on'];
                                echo "<td align = \"center\">$amdmIntro</td></tr>";
                            }
                        }
                    echo "</table>";
                }
                else {
                    echo "<div class = \"api_noResult\">The API returned zero results for the request.</div>";
                }
            }
            if(isset($_GET["bioguide_id"])) {
                $searchKeyword = $_GET["searchKeyword"];
                $secChamber = $_GET["chamber"];
                $secBioID = $_GET["bioguide_id"];
                $secState = $_GET["state"]; 
                $secApiKey = $_GET["apikey"];
                $secPath = "congress.api.sunlightfoundation.com/legislators?";
                $secQuery = "chamber=" .$secChamber. "&state=" .$secState. "&bioguide_id=" .$secBioID. "&apikey=" .$secApiKey;
                $secUrl = $secPath.$secQuery;
                
                $secRequest  = file_get_contents("http://".$secUrl);
                $secResponse = json_decode($secRequest,true);
                
                $secTableLen = $secResponse['page']['count'];
                echo "<br/><br/>";
                if($secTableLen > 0) {
                    echo "<table class = \"output_2\" align = \"center\">";
                        $avatarUrl = "http://theunitedstates.io/images/congress/225x275/" .$secBioID. ".jpg";
                        echo "<tr><td id = \"output_2_pic\" align = \"center\" colspan = \"2\"><img src=\"$avatarUrl\" alt=\"senater_avatar\"></td></tr>";
                        echo "<tr><td class = \"output_2_left\">Full Name</td>";
                        $fullName = $secResponse['results'][0]['first_name']. " " .$secResponse['results'][0]['last_name'];
                        echo "<td>$fullName</td></tr>";
                        echo "<tr><td class = \"output_2_left\">Term Ends on</td>";
                        $termDue = $secResponse['results'][0]['term_end'];
                        echo "<td>$termDue</td></tr>";
                        echo "<tr><td class = \"output_2_left\">Website</td>";
                        $webSiteUrl = $secResponse['results'][0]['website'];
                        if($webSiteUrl == null) {
                            echo "<td>N.A.</td></tr>";
                        }
                        else {
                            echo "<td><a href = \"$webSiteUrl\" target = \"_blank\">$webSiteUrl</a></td></tr>";
                        }
                        echo "<tr><td class = \"output_2_left\">Office</td>";
                        $office = $secResponse['results'][0]['office'];
                        echo "<td>$office</td></tr>";
                        echo "<tr><td class = \"output_2_left\">Facebook</td>";
                        if(array_key_exists('facebook_id', $secResponse['results'][0])) {
                            $facebook = $secResponse['results'][0]['facebook_id'];
                            if($facebook == null) {
                                echo "<td>N.A.</td></tr>";
                            }
                            else {
                                $facebookUrl = "http://www.facebook.com/" .$facebook;
                                echo "<td><a href = \"$facebookUrl\" target = \"_blank\">$fullName</a></td></tr>";
                            }
                        }
                        else {
                            echo "<td>N.A.</td></tr>";
                        }
                        echo "<tr><td class = \"output_2_left paddingDown\">Twitter</td>";
                        if(array_key_exists('twitter_id', $secResponse['results'][0])) {
                            $twitter = $secResponse['results'][0]['twitter_id'];
                            if($twitter == null) {
                                echo "<td class = \"paddingDown\">N.A.</td></tr>";
                            }
                            else {
                                $twitterUrl = "http://www.twitter.com/" .$twitter;
                                echo "<td class = \"paddingDown\"><a href = \"$twitterUrl\" target = \"_blank\">$fullName</a></td></tr>";
                            }
                        }
                        else {
                            echo "<td class = \"paddingDown\">N.A.</td></tr>";
                        }
                    
                    echo "</table>";
                }
                else {
                        echo "<div class = \"api_noResult\">The API returned zero results for the request.</div>";
                    }
            }
            if(isset($_GET["bill_id"])) {
                $searchKeyword = $_GET["searchKeyword"];
                $secBillID = $_GET["bill_id"];
                $secChamber = $_GET["chamber"];
                $secApiKey = $_GET["apikey"];
                $secPath = "congress.api.sunlightfoundation.com/bills?";
                $secQuery = "bill_id=" .$secBillID. "&chamber=" .$secChamber. "&apikey=" .$secApiKey;
                $secUrl = $secPath.$secQuery;
                
                $secRequest  = file_get_contents("http://".$secUrl);
                $secResponse = json_decode($secRequest,true);
                
                $secTableLen = $secResponse['page']['count'];
                echo "<br/><br/>";
                if($secTableLen > 0) {
                    echo "<table class = \"output_2\" align = \"center\">";
                    echo "<tr><td class = \"output_2_left_2 paddingBillTop\">Bill ID</td>";
                    echo "<td class = \"output_2_right_2 paddingBillTop\">$secBillID</td></tr>";
                    echo "<tr><td class = \"output_2_left_2\">Bill Title</td>";
                    $billTitle = $secResponse['results'][0]['short_title'];
                    if($billTitle == null) {
                        echo "<td class = \"output_2_right_2\">N.A.</td></tr>";
                    }
                    else {
                        echo "<td class = \"output_2_right_2\">$billTitle</td></tr>";
                    }
                    echo "<tr><td class = \"output_2_left_2\">Sponsor</td>";
                    $sponsor = $secResponse['results'][0]['sponsor']['title']. " " .$secResponse['results'][0]['sponsor']['first_name']. " " .$secResponse['results'][0]['sponsor']['last_name'];
                    echo "<td class = \"output_2_right_2\">$sponsor</td></tr>";
                    echo "<tr><td class = \"output_2_left_2\">Introduced On</td>";
                    $intro = $secResponse['results'][0]['introduced_on'];
                    echo "<td class = \"output_2_right_2\">$intro</td></tr>";
                    echo "<tr><td class = \"output_2_left_2\">Last action with date</td>";
                    $lastAD = $secResponse['results'][0]['last_version']['version_name']. " " .$secResponse['results'][0]['last_action_at'];
                    echo "<td class = \"output_2_right_2\">$lastAD</td></tr>";
                    echo "<tr><td class = \"output_2_left_2 paddingBillBottom\">Bill URL</td>";
                    $billUrl = $secResponse['results'][0]['last_version']['urls']['pdf'];
                    if($billTitle == null) {
                        echo "<td class = \"output_2_right_2 paddingBillBottom\"><a href = \"$billUrl\" target = \"_blank\">$secBillID</a></td></tr>";
                    }
                    else {
                        echo "<td class = \"output_2_right_2 paddingBillBottom\"><a href = \"$billUrl\" target = \"_blank\">$billTitle</a></td></tr>";
                    }  
                }
                else {
                        echo "<div class = \"api_noResult\">The API returned zero results for the request.</div>";
                    }
            }
        ?>
       

        <pre>
        <?php
            //echo "Test the response array:"; 
            //print_r($response);
            //print_r($secResponse);
            //print_r($checkIfFullName);
            //echo count($checkIfFullName);
            //echo $firstNameKeyword;
            //echo $lastNameKeyword;
        ?>
        </pre>

        
    </body>
    
</html>