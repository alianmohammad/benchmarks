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
$num = $_GET['size'] * 250;
echo "num= {$num}";

$rand_id = rand(1, $num);

echo "random id= {$rand_id}";

$sql = "SELECT id, value 
        FROM benchmark_tbl
        WHERE id={$rand_id}";

mysql_select_db('benchmark_0');
$retval = mysql_query( $sql, $conn );
if(! $retval )
{
  die('Could not get data: ' . mysql_error());
}
while($row = mysql_fetch_array($retval, MYSQL_ASSOC))
{
    echo "ID :{$row['id']}  <br> ".
         "Value: {$row['value']} <br> ".
         "--------------------------------<br>";
} 
echo "Fetched data successfully\n";
mysql_close($conn);
?>
</body>
</html>
