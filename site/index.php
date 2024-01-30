<?php
error_reporting(E_ALL);
ini_set('display_errors',1);

	$servername = "10.10.20.11";
	$username = "test_user";
	$password = "test";
	$dbname = "test_db";

	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}

	$user = "";
	$pass = "";

	// Query to check if the user and password exist in the database
	$sql = "SELECT * FROM test;"; //WHERE username = '$user' AND password = '$pass'";
	$result = $conn->query($sql);

	// Display the results in an HTML table
	if ($result->num_rows > 0) {
		echo "<table><tr><th>Usernames</th><th>Passwords</th></tr>";
		// Output data of each row
		while($row = $result->fetch_assoc()) {
			echo "<tr><td>".$row["user"]."</td><td>".$row["pass"]."</td></tr>";
		}
		echo "</table>";
	} else {
		echo "0 results";
	}

	// Close the database connection
	$conn->close();
?>