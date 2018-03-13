<?php
$dbh = mysqli_connect('localhost', 'admin', '1234abcd');
if (!$dbh) {
    die('Could not connect: ' . mysqli_error());
}
echo 'LAMP server succesfully deployed!'
echo 'Connection succesfull to MariaDB';
mysqli_close($dbh);
?>
