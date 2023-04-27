<?php
include('../connect.php');
$username = $_POST['user'];
$password = $_POST['pass'];
$email = $_POST['mail'];

if (!filter_var($_POST['mail'], FILTER_VALIDATE_EMAIL)) {
	exit('Podany E-mail jest nieprawidłowy!');
}

if ($stmt = $con->prepare('SELECT id, password FROM login WHERE username = ?')) {
	$stmt->bind_param('s', $_POST['user']);
	$stmt->execute();
	$stmt->store_result();

	if ($stmt->num_rows > 0) {
		echo 'Nazwa użytkownika jest zajęta, prosze, wybierz inną!';
	} else {
if ($stmt = $con->prepare('INSERT INTO login (username, password, email) VALUES (?, ?, ?)')) {
	$password = $_POST['pass'];
	$stmt->bind_param('sss', $_POST['user'], $password, $_POST['mail']);
	$stmt->execute();
	echo  "<script>window.location.assign('../userpage.php');
	</script>";

}
}
}
?>
