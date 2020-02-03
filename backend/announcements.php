<?php
// Allow from any origin
if (isset($_SERVER['HTTP_ORIGIN'])) {
  // Decide if the origin in $_SERVER['HTTP_ORIGIN'] is one
  // you want to allow, and if so:
  header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
  header('Access-Control-Allow-Credentials: true');
  header('Access-Control-Max-Age: 86400');    // cache for 1 day
}

// Access-Control headers are received during OPTIONS requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {

  if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
    // may also be using PUT, PATCH, HEAD etc
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

  if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
    header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");

  exit(0);
}

// ###################

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
  if (!($database = mysqli_connect("localhost", "root", "", "poproject_database"))) {
    die("<p>Could not connect to database</p>");
  }
  $func_name = isset($_GET['func']) ? htmlspecialchars($_GET["func"]) : null;
  // LIST ANNOUNCEMENTS
  if ($func_name === 'listAnnouncements') {
    if (!($result = mysqli_query(
      $database,
      "SELECT * 
           FROM ogłoszenie O, lokal L, adres A 
          WHERE O.LOKALID = L.NrLokalu 
            AND L.adres = A.idAdresu"
    ))) {
      print("<p>Could not execute query!</p>");
      die(mysqli_error($database));
    }
    $response = array();
    while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
      $response[] = $row;
    }
    echo json_encode($response);
  }
  // GET ANNOUNCEMENT
  if ($func_name === 'getAnnouncements') {
    $id = isset($_GET['announcement_id']) ? $_GET['announcement_id'] : null;
    if (!($result = mysqli_query(
      $database,
      "SELECT * 
           FROM ogłoszenie O, lokal L, adres A 
          WHERE O.LOKALID = L.NrLokalu 
            AND L.adres = A.idAdresu
            AND O.NrOgloszenia = " . $id
    ))) {
      print("<p>Could not execute query!</p>");
      die(mysqli_error($database));
    }
    echo json_encode($result->fetch_array(MYSQLI_ASSOC));
  }
  mysqli_close($database);
}  else if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	if (!($database = mysqli_connect("localhost", "root", "", "poproject_database"))) {
		die("<p>Could not connect to database</p>");
	}
	$data = json_decode(file_get_contents('php://input'), true);
	$func_name = $data['func'];
	// RESERVE
    if ($func_name === 'reserve') {
	  $id = $data['announcement_id'];
	  $notka = $data['notka'];
	  $termin = $data['termin'];
	  if (!($result = mysqli_query(
	    $database,
		"UPDATE ogłoszenie o SET o.CzyZawieszone = 1 WHERE o.nrOgloszenia = ".$id.";"
  	    ))) {
	    print("<p>Could not execute query!</p>");
	    die(mysqli_error($database));
	  }
	  if (!($result = mysqli_query(
	    $database,
		"INSERT INTO rezerwacja (TerminWizyty, Notka, Stan, UZYTKOWNIKID, OGLOSZENIEID)
		 VALUES ( '".$termin."', '".$notka."', 0, 1, ".$id." );"
  	    ))) {
	    print("<p>Could not execute query!</p>");
	    die(mysqli_error($database));
	  }
	  echo json_encode(array('status' => 'ok', 'status_id' => 0));
	}
	mysqli_close($database);
} else if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
}

// ###################
