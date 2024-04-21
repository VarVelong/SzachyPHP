<!DOCTYPE html>
<html>

<head>
    <title>Szachy</title>
    <style>
        table {
            border-collapse: collapse;
        }

        body {
            align-items: center;
        }

        td {
            width: 100px;
            height: 100px;
            border: 1px solid black;
            text-align: center;
            vertical-align: middle;
            font-size: 75px;
        }

        .white {
            background-color: #f0d9b5;
        }

        .black {
            background-color: #b58863;
        }

        #choiceButtons input {
            width: 150px;
            height: 35px;
            font-size: 25px;
        }

        #answer{
            background-color: black;
        }

        #answer:hover{
            background-color: white;
        }


    </style>
</head>

<body>

    <?php

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "szachy";
    $board = [[]];
    $conn = new mysqli($servername, $username, $password, $dbname);
    const MAX_BOARD_LENGTH = 8;

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }


    function drawChessboard($board, $boardLength)
    {
        echo "<table>";
        for ($row = 0; $row < $boardLength; $row++) {
            echo "<tr>";
            for ($col = 0; $col < $boardLength; $col++) {
                $color = ($row + $col) % 2 == 0 ? "white" : "black";
                echo "<td class='$color'>" . $board[$row][$col] . "</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    }    

    function loadChessboard($board, $boardLength, $conn){
        for($i = 0; $i < $boardLength; $i++){
            for($j = 0; $j < $boardLength; $j++){
                $board[$i][$j] = "";
            }
        }

        $sql = "SELECT idPlanszy, figura, litera, liczba FROM koordynaty WHERE idPlanszy = {$_POST["mybutton"]}";
        $result = mysqli_query($conn, $sql);
        
        if (mysqli_num_rows($result) > 0) {
            while($row = mysqli_fetch_assoc($result)) {
                $board[$row["liczba"]][$row["litera"]] = $row["figura"];
                // echo "<h1> {$row["instrukcja"]} </h1>";
            }
        } else {
            echo "0 results";
        }

        return $board;
    }

    function showInstruction($conn){
        $sql = "SELECT instrukcja, rozwiazanie FROM plansza WHERE id = {$_POST["mybutton"]}";
        $result = mysqli_query($conn, $sql);

        $text = mysqli_fetch_assoc($result);
        echo "<h1> {$text["instrukcja"]} </h1>";
    }

    function showAnswer($conn){
        $sql = "SELECT rozwiazanie FROM plansza WHERE id = {$_POST["mybutton"]}";
        $result = mysqli_query($conn, $sql);

        $text = mysqli_fetch_assoc($result);
        echo "<h1>Rozwiązanie:</h1>";
        echo "<h1 id='answer'> {$text["rozwiazanie"]} </h1>";
    }

    if (isset($_POST["mybutton"]))
    {
        echo "<h2> Zadanie {$_POST["mybutton"]} </h2>";
    }

    $board = loadChessboard($board, MAX_BOARD_LENGTH, $conn);

    drawChessboard($board, MAX_BOARD_LENGTH);

    ?>

    <form id="choiceButtons" action="" method="POST">
        <input type="submit" value="1" name="mybutton">
        <input type="submit" value="2" name="mybutton">
        <input type="submit" value="3" name="mybutton">
        <input type="submit" value="4" name="mybutton">
    </form>
    
    <div>
        <?php
            showInstruction($conn);
            showAnswer($conn);
        ?>
    </div>

</body>

</html>
