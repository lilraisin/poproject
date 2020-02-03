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

    // GET APARTMENTS
    if ($func_name === 'getApartmentsOf') {
        $user = isset($_GET['owner_login']) ? $_GET['owner_login'] : null;
        if (!($result = mysqli_query(
            $database,
            "SELECT L.NrLokalu, L.StandardMieszkaniowy, 
                L.CzyZamieszkaly, L.IloscPokoi, 
                L.WolnychMiejsc, L.MaxMiejsc, 
                U.login, A.nrMieszkania, A.nrUlicy,
                A.nazwaUlicy, A.miasto
            FROM lokal L, użytkownik U, adres A
            WHERE L.UZYTKOWNIKID = U.NrUzytkownika
                AND L.Adres = A.idAdresu
                AND U.login = " . "'" . $user . "'"
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
	  // GET APARTMENT
	  if ($func_name === 'getApartment') {
		$id = isset($_GET['apartment_id']) ? $_GET['apartment_id'] : null;
		if (!($result = mysqli_query(
		  $database,
		  "SELECT l.NrLokalu,
				  l.Adres,
				  l.StandardMieszkaniowy,
				  l.CzyZamieszkaly,
				  l.IloscPokoi,
				  l.MaxMiejsc,
				  l.UZYTKOWNIKID,
				  a.nrMieszkania,
				  a.nrUlicy,
				  a.nazwaUlicy,
				  a.miasto,
				  o.CzyZawieszone,
				  SUM( o.LiczbaMiejsc ) AS LiczbaMiejsc
			 FROM lokal l
				  LEFT JOIN ogłoszenie o ON (l.NrLokalu = o.LOKALID)
				  JOIN adres a ON (l.Adres = a.idAdresu)
			WHERE l.NrLokalu = ".$id.";"
		))) {
		  print("<p>Could not execute query!</p>");
		  die(mysqli_error($database));
		}
		echo json_encode($result->fetch_array(MYSQLI_ASSOC));
	  }
    mysqli_close($database);
} else if ($_SERVER['REQUEST_METHOD'] === 'POST') {
} else if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
}

// ###################

