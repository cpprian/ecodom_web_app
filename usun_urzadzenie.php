<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["usun_urzadzenie"])) {
        $urzadzenie_id = $_POST["urzadzenie_id"];
        var_dump($_POST);

        $conn = mysqli_connect('localhost', 'root', '', 'ecodomDB');
        if (!$conn) {
            echo "Nie udało się połączyć z bazą danych: " . mysqli_connect_error();
            exit();
        }

        $query = "DELETE FROM Urzadzenia WHERE id = 1;";
        // $query = "Select * from Urzadzenia where `id` = $urzadzenie_id";
        $result = mysqli_query($conn, $query);
        echo $query;

        if ($result) {
            echo "Urządzenie o ID $urzadzenie_id zostało usunięte.";
        } else {
            echo "Nie udało się usunąć urządzenia o ID $urzadzenie_id.";
        }

        mysqli_close($conn);
    } else {
        echo "Nie udało się usunąć urządzenia.";
    }
}
?>