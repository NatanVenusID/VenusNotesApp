<?php 

	include 'database.php';
	

	$title = $_POST['title'];
	$content = $_POST['content'];

	$link->query("INSERT INTO tb_notes(title,content)VALUES('".$title."','".$content."')");
?>













































