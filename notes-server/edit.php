<?php 

	include 'database.php';

	$id = $_POST['id'];
	$title = $_POST['title'];
	$content = $_POST['content'];

	$link->query("UPDATE tb_notes SET title = '".$title."',content = '".$content."' WHERE id = '".$id."'");

?>