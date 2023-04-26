<?php
session_start();
if (!isset($_SESSION['loggedin'])) {
	header('Location: index.html');
	exit;
}
?>
<?php
	$pol = mysqli_connect("localhost", "root", "", "projekt");
	mysqli_set_charset($pol, "utf8");
?>

<!DOCTYPE HTML>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Strona Użytkownika</title>
<link rel="stylesheet" href="style.css">
</head>

<body id="body1">

<div class=""><h1 style="text-align:center; background-color: #ADF7B6;">
Witaj na stronie swojego konta, <?=$_SESSION['name']?>!</h1>

<a href=index.html id="send" >Strona Główna</a>

<a href=logout.php id="send">Wyloguj się</a>
<br><br><br>
<p>Twoja Historia Wyporzyczeń:</p>


<table style="width:100%", class="log">
		  <tr>
			<th>Tytuł:</th>
			<th>Autor:</th>
			<th>Data Wypożyczenia:</th>
			<th>Data Oddania:</th>
		  </tr>
	<?php
				$uid = $_SESSION['id'];
				$sql = "SELECT books.tytuł, books.autor, history.checkout_date, history.return_date 
				FROM `history`
				JOIN books 
					ON books.id = history.book_id
					WHERE history.user_id = '$uid';";
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
					<td>Brak Historii!</td>
					</tr>";
				} 
			?>
			</table>
</div>

</body>
</html>
<?php
	mysqli_close($pol);
?>