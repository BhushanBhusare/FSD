
<!DOCTYPE html>
<html>
<head>
    <title>PHP Practical</title>
</head>
<body>

<h2>PHP Array and String Operations</h2>

<form method="POST">
    <input type="text" name="email" placeholder="Enter Email">
    <button type="submit">Submit</button>
</form>

<?php

// 1. Sorting Array
$a = array(30, 10, 20);
sort($a);

echo "Sorted Array: ";
print_r($a);

// 2. Searching
if(in_array(20, $a)) {
    echo "<br>20 Found";
}

// 3. Merging Arrays
$b = array(40, 50);
$c = array_merge($a, $b);

echo "<br>Merged Array: ";
print_r($c);

// 4. String and Regex Validation
if(isset($_POST['email'])) {

    $email = trim($_POST['email']);

    if(preg_match("/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$/", $email)) {

        $parts = explode("@", $email);

        echo "<br>Valid Email";
        echo "<br>Username: " . htmlspecialchars($parts[0]);
        echo "<br>Domain: " . htmlspecialchars($parts[1]);

    } else {
        echo "<br>Invalid Email";
    }
}

?>

</body>
</html>
