<?php
require 'sql.php';
$query="SELECT * FROM `info`";
if($is_query_run=mysqli_query())
{
echo "true"; 
}
else
{
echo "no";
}
?>