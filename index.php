<!DOCTYPE html>
<html>
<head>
  <title>Menu Boczne</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="style.css">
<body>
  <div class="container">
    <div class="menu">
      <ul>
        <li><a href="#"><i class="fas fa-home"></i>Strona główna</a></li>
        <li><a href="#"><i class="fas fa-info-circle"></i>O nas</a></li>
        <li><a href="#"><i class="fas fa-cogs"></i>Usługi</a></li>
        <li><a href="#"><i class="fas fa-envelope"></i>Kontakt</a></li>
      </ul>
    </div>
    <div class="content">
      <h1>System wsparcia dla mieszkania</h1>

      <?php
        $conn = mysqli_connect('localhost', 'root', '', 'ecodomDB');
        if ($conn->connect_error) {
            echo "Nie udało się połączyć z bazą danych: " . mysqli_connect_error();
            exit();
        }

        $query = "SELECT * FROM Urzadzenia";
        $result = mysqli_query($conn, $query);

        // Generowanie komponentów HTML na podstawie danych z bazy
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                echo '<div class="urzadzenie">';
                echo '<h2>' . $row['nazwa'] . '</h2>';
                echo '<p>Moc: ' . $row['moc'] . ' W</p>';
                echo '<p>Zużycie energii: ' . $row['moc'] / 1000 . ' kWh</p>';
                echo '<p>Harmonogram: ' . $row['harmonogram'] . '</p>';
                echo '</div>';
            }
        } else {
            echo 'Brak urządzeń w bazie danych.';
        }

        mysqli_close($conn);
      ?>
    </div>
  </div>
</body>
</html>
