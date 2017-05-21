<html>
<head></head>
<body>
<?php
$dbhost = 'localhost:3036';
$dbuser = 'root';
$dbpass = '';
$conn = mysql_connect($dbhost, $dbuser, $dbpass);
if(! $conn )
{
  die('Could not connect: ' . mysql_error());
}

$sql = 'CREATE DATABASE benchmark_0';

$retval = mysql_query( $sql, $conn );

if(! $retval )
{
  echo 'Could not create database: ' . mysql_error();
}

echo "Database benchmakr_0 created successfully\n";

$sql = "CREATE TABLE benchmark_tbl( ".
       "id INT NOT NULL AUTO_INCREMENT, ".
       "value VARCHAR(4096) NOT NULL, ".
       "PRIMARY KEY ( id )); ";

mysql_select_db( 'benchmark_0' );
$retval = mysql_query( $sql, $conn );

if(! $retval )
{
  echo 'Could not create table:' . mysql_error();
}

mysql_close($conn);

?>
</body>
</html>
