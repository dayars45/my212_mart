<?php
 
    // we will get actions from the app to do operations in the database...
    //$action = $_GET["action"];
    //$servername = "127.0.0.1:3306";
	//$dbname = "db_my212_mart";
	$servername = "localhost";//"34.101.215.82:3306";
    $username = "dayars45";
    $password = "dayars45";
    $dbname = "my212mart";
    $table = "tb_user";
 
    // we will get actions from the app to do operations in the database...
    $action = $_POST["action"];
     
    // Create Connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check Connection
    if($conn->connect_error){
        die("Connection Failed: " .$conn->connect_error);
        return;
    }
 
    // If connection is OK...
 
    // If the app sends an action to create the table...
    /*if("CREATE_TABLE" == $action){
        $sql = "CREATE TABLE IF NOT EXISTS $table ( 
            id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            first_name VARCHAR(30) NOT NULL,
            last_name VARCHAR(30) NOT NULL
            )";
 
        if($conn->query($sql) === TRUE){
            // send back success message
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }*/
 
    // Get all user records from the database
    if("GET_ALL" == $action){
        $db_data = array();
        $sql = "SELECT * from $table ORDER BY id_user DESC";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
	
	//get by userName and password
	if("LOGIN" == $action){
        $db_data = array();
		$user_name = $_GET["user_name"];
		$password = $_GET["password"];
        $sql = "SELECT * from $table WHERE user_name='$user_name' AND password='$password'";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
 
    // Add an user
    /*if("ADD" == $action){
        // App will be posting these values to this server
        $full_name = $_GET["full_name"];
        $birth_place = $_GET["birth_place"];
		$birth_date = $_GET["birth_date"];
		$address = $_GET["address"];
		$gender = $_GET["gender"];
		$religion = $_GET["religion"];
		$telp = $_GET["telp"];
		$email = $_GET["email"];
		$is_pic = $_GET["is_pic"];
		$note = $_GET["note"];
		$user_name = $_GET["user_name"];
		$password = $_GET["password"];
		//$created_date = $_GET["created_date"];
		$created_name = $_GET["created_name"];
		//$modify_date = $_GET["modify_date"];
		//$modify_name = $_GET["modify_name"];
        //$sql = "INSERT INTO $table (first_name, last_name) VALUES ('$first_name', //'$last_name')";
		$sql = "INSERT INTO $table ('full_name', 'birth_place', 'birth_date', 'address', 'gender', 'religion', 'telp', 'email', 'is_pic', 'note', 'user_name', 'password', 'created_date', 'created_name', 'modify_date', 'modify_name') VALUES 
		('$full_name', '$birth_place', CAST('$birth_date' AS DATE), '$address', '$gender', '$religion', '$telp', '$email', $is_pic, '$note', '$user_name', '$password', now(), '$created_name', null, null)";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;
    }*/
    
    // Add an user
    if("ADD" == $action){
        // App will be posting these values to this server
        //$id_user = $_POST["id_user"];
        $full_name = $_POST["full_name"];
        $birth_place = $_POST["birth_place"];
		$birth_date = $_POST["birth_date"];
		$address = $_POST["address"];
		$gender = $_POST["gender"];
		$religion = $_POST["religion"];
		$telp = $_POST["telp"];
		$email = $_POST["email"];
		$is_pic = $_POST["is_pic"];
		$note = $_POST["note"];
		$user_name = $_POST["user_name"];
		$password = $_POST["password"];
		echo $birth_date;
        $newformat = date('$birth_date');
        echo $newformat;
        $d = new DateTime($birth_date);
        echo $date=$d->format('Y-m-d');
		//$created_date = $_POST["created_date"];
		//$created_name = $_POST["created_name"];
		//$modify_date = $_GET["modify_date"];
		//$modify_name = $_GET["modify_name"];
        //$sql = "INSERT INTO $table (first_name, last_name) VALUES ('$first_name', //'$last_name')";
		$sql = "INSERT INTO $table (full_name,birth_place,address,gender,religion,telp,email,is_pic,note,user_name,password, created_date) VALUES 
		('$full_name', '$birth_place', '$address', '$gender', '$religion', '$telp', '$email', $is_pic, '$note', '$user_name', '$password', CURDATE())";
        $result = $conn->query($sql);
        echo "success", $result;
        $conn->close();
        return;
    }
    
    // Add an Employee
    if("ADD_EMP" == $action){
        // App will be posting these values to this server
        $first_name = $_POST["full_name"];
        $last_name = $_POST["birth_place"];
        $sql = "INSERT INTO employees (first_name, last_name) VALUES ('$first_name', '$last_name')";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;
    }
 
    // Remember - this is the server file.
    // I am updating the server file.
    // Update an user
    if("UPDATE" == $action){
        // App will be posting these values to this server
		$id_user = $_POST['id_user'];
        $full_name = $_GET["full_name"];
        $birth_place = $_GET["birth_place"];
		$birth_date = $_GET["birth_date"];
		$address = $_GET["address"];
		$gender = $_GET["gender"];
		$religion = $_GET["religion"];
		$telp = $_GET["telp"];
		$email = $_GET["email"];
		$is_pic = $_GET["is_pic"];
		$note = $_GET["note"];
		$user_name = $_GET["user_name"];
		$password = $_GET["password"];
		//$created_date = $_GET["created_date"];
		//$created_name = $_GET["created_name"];
		//$modify_date = $_GET["modify_date"];
		//$modify_name = $_GET["modify_name"];
        $sql = "UPDATE $table SET full_name = '$full_name', birth_place = '$birth_place', birth_date = '$birth_date', address = '$address', gender = '$gender', religion = '$religion', telp = '$telp', email = '$email', is_pic = '$is_pic', note = '$note', user_name = '$user_name', password = '$password', modify_date = '$modify_date', modify_name = '$modify_name' WHERE id_user = $id_user";
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
 
    // Delete an user
    if('DELETE' == $action){
        $id_user = $_POST['id_user'];
        $sql = "DELETE FROM $table WHERE id_user = $id_user"; // don't need quotes since id is an integer.
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
 
?>