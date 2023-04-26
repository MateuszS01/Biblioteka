<?php
include('../connect.php');
if ( !isset($_POST['user'], $_POST['pass']) ) {
	exit('Wypełnij pola loginu i hasła!');
}
if ($stmt = $con->prepare('SELECT id, password FROM login WHERE username = ?')) {
	$stmt->bind_param('s', $_POST['user']);
	$stmt->execute();
	$stmt->store_result();
	
if ($stmt->num_rows > 0) {
	$stmt->bind_result($id, $password);
	$stmt->fetch();

	if ($_POST['pass'] === $password) {
		session_regenerate_id();
		$_SESSION['loggedin'] = TRUE;
		$_SESSION['name'] = $_POST['user'];
		$_SESSION['id'] = $id;
		header('Location: ../userpage.php');
	} else {
		echo 'Niepoprawny login i/lub hasło!';
	}
} else {
	echo 'Niepoprawny login i/lub hasło!';
}


	$stmt->close();
}
?>
