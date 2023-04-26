<?php
	$pol = mysqli_connect("localhost", "root", "", "projekt");
	mysqli_set_charset($pol, "utf8");
?>

<!DOCTYPE HTML>
<html lang="pl">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Language" content="pl" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<title>Wyniki Wyszukiwania</title>
		<link rel="stylesheet" href="style.css">
	</head>

	<body id="body1">
		
		<table style="width:100%", class="log">
		  <tr>
			<th>Autor</th>
			<th>Tytuł</th>
			<th>Data Wydania</th>
			<th>Stan</th>
		  </tr>
		<?php

			$res = $_POST["search"];
			$sql = "SELECT * 
					FROM `books`
					WHERE autor LIKE '%$res%' OR tytuł LIKE '%$res%'";
					
			$wynik=mysqli_query($pol, $sql);
			$isResult = false;
			while($row = mysqli_fetch_array($wynik))
				{
					echo "<tr>
							  <td>$row[0]</td>
							  <td>$row[1]</td>
							  <td>$row[2]</td>
							  <td>$row[3]</td>
						  </tr>";
						  $isResult = true;
				}
				if ($isResult == false){
					echo "<tr>
					<td>Brak wyników!</td>
					</tr>";
				} 
		?>
		</table>  
	
		<footer></footer>

	</body>

</html>
<?php
	mysqli_close($pol);
?>