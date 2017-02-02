<?php

header("Access-Control-Allow-Origin: *");


$ApiKey = "74f382f8d9074b28aec33bd36fc6b509";

if(isset($_GET["legislators"])) {
    //$Path = "congress.api.sunlightfoundation.com/legislators?";
    $Path = "104.198.0.197:8080/legislators?";
    $Query = "apikey=" .$ApiKey. "&per_page=all";
    $Url = $Path.$Query;
    
    $Request  = file_get_contents("http://".$Url);
    echo $Request;
}

if(isset($_GET["billsActive"])) {
    //$Path = "congress.api.sunlightfoundation.com/bills?";
    $Path = "104.198.0.197:8080/bills?";
    $Query = "apikey=" .$ApiKey. "&history.active=true&order=introduced_on&per_page=50";
    $Url = $Path.$Query;
    
    $Request  = file_get_contents("http://".$Url);
    echo $Request;
}

if(isset($_GET["billsNew"])) {
    //$Path = "congress.api.sunlightfoundation.com/bills?";
    $Path = "104.198.0.197:8080/bills?";
    $Query = "apikey=" .$ApiKey. "&history.active=false&order=introduced_on&per_page=50";
    $Url = $Path.$Query;
    
    $Request  = file_get_contents("http://".$Url);
    echo $Request;
}

if(isset($_GET["committees"])) {
    //$Path = "congress.api.sunlightfoundation.com/committees?";
    $Path = "104.198.0.197:8080/committees?";
    $Query = "apikey=" .$ApiKey. "&per_page=all";
    $Url = $Path.$Query;
    
    $Request  = file_get_contents("http://".$Url);
    echo $Request;
}

if(isset($_GET["leg"])) {
    $bioID = $_GET["bio_id"];
    //$Path = "congress.api.sunlightfoundation.com/legislators?";
    $Path = "104.198.0.197:8080/legislators?";
    $Query = "apikey=" .$ApiKey. "&bioguide_id=" .$bioID;
    $Url = $Path.$Query;
    
    $Request  = file_get_contents("http://".$Url);
    echo $Request;
}

if(isset($_GET["legbil"])) {
    $bioID = $_GET["bio_id"];
    //$Path = "congress.api.sunlightfoundation.com/bills?";
    $Path = "104.198.0.197:8080/bills?";
    $Query = "apikey=" .$ApiKey. "&sponsor_id=" .$bioID. "&per_page=5";
    $Url = $Path.$Query;
    
    $Request  = file_get_contents("http://".$Url);
    echo $Request;
}

if(isset($_GET["legcom"])) {
    $bioID = $_GET["bio_id"];
    //$Path = "congress.api.sunlightfoundation.com/committees?";
    $Path = "104.198.0.197:8080/committees?";
    $Query = "apikey=" .$ApiKey. "&member_ids=" .$bioID. "&per_page=5";
    $Url = $Path.$Query;
    
    $Request  = file_get_contents("http://".$Url);
    echo $Request;
}

if(isset($_GET["bil"])) {
    $billID = $_GET["bill_id"];
    //$Path = "congress.api.sunlightfoundation.com/bills?";
    $Path = "104.198.0.197:8080/bills?";
    $Query = "apikey=" .$ApiKey. "&bill_id=" .$billID;
    $Url = $Path.$Query;
    
    $Request  = file_get_contents("http://".$Url);
    echo $Request;
}

?>