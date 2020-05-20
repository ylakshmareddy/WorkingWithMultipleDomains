<?php
	$servername = "localhost";
	$username = "LakshmaReddy";
	$password = "LakshmaReddy";
	$dbname = "dbLakshmaReddy";
	$connection = new mysqli($servername, $username, $password, $dbname);
	if ($connection->connect_error)
	{
		die("Connection failed: " . $connection->connect_error);
	}
	$sql="show databases;";
	$result=$connection->query($sql);
	if($result->num_rows > 0)
	{
		echo("<select id='dbList' name='dbList' onchange='getDbName()'>");
		echo('<option selected hidden>Choose a database</option>');
		while($row = $result->fetch_assoc())
		{
			echo('<option value='. $row['Database'] . '>' . $row['Database'] . '</option>');
		}
		echo("</select>");
	}
	$connection->close();
?>

