<meta charset="UTF-8">
<form method="POST">
    <table border=1 style="float:left; width:33%;">
        <tr>
            <td>
                Opret Liga
            </td>
            <td> 
                Udfyld felterne nedenfor
            </td>
        </tr>
        <tr>
            <td>
                Liga Navn:
            </td>
            <td>
                <input type="text" name="liganavn">
            </td>
        </tr>
        <tr>
            <td>
                Længde:
            </td>
            <td>
                <input type="text" name="længde">
            </td>
        </tr>
        <tr>
            <td>
                Spil:
            </td>
            <td>
                <input type="text" name="spil">
            </td>
        </tr>
        <tr>
            <td>
                <input type="reset" value="Reset">
            </td>
            <td>
                <input type ="submit" value ="Opret Liga" name="submit">
            </td>
        </tr>
    </table>
</form>

<?php
$name = $_POST[liganavn];
$length = $_POST[længde];
$game = $_POST[spil];

$dbh = new PDO('oci:dbname=//localhost:1521/dbwc', 'bhj157', 'dbx2014');

if (isset($_POST['submit'])) {

    try {
        $dbh->beginTransaction();
        $dbh->query("INSERT INTO WP_LIGAER VALUES "."('$name', $length, '$game')");
         $commited = $dbh->commit();
         echo "Følgende liga er blevet oprettet: $name $length $game";
    } catch (Exception $e) {
        echo $e->getMessage();
        $conn->rollback();
    }
}
?>
