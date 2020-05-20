<?php
	$servername = "localhost";
	$username = "LakshmaReddy";
	$password = "LakshmaReddy";
	$dbname = $_GET['dbName'];
	$connection = new mysqli($servername, $username, $password, $dbname);
	if ($connection->connect_error)
	{
		die("Connection failed: " . $connection->connect_error);
	}
		$sql="show tables;";
		$result=$connection->query($sql);
	if($result->num_rows > 0)
	{
		echo("<select id='TablesList' name='TablesList' onchange='getTableName()'>");
		echo('<option selected hidden>Choose a table</option>');
		while($row = $result->fetch_assoc())
		{
			echo('<option value='. $row['Tables_in_'. $dbname] . '>' . $row['Tables_in_'. $dbname] . '</option>');
		}
		echo("</select>");
	}
	$connection->close();
?>



