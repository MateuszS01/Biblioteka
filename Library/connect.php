<!-- login.php -->
<?php
session_start();
$host = "localhost";
$user = "root";
$password = "";
$db_name = "projekt";
$con = mysqli_connect($host , $user , $password , $db_name);
if(mysqli_connect_errno()){die("Błąd połączenia z MySQL :".mysqli_connect_errno());
}
?>