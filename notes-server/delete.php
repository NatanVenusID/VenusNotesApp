<?php 

	include 'database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM tb_notes WHERE id = '".$id."'");
?>