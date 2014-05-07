<meta charset="UTF-8">
<?php

    $dbh = new PDO('oci:dbname=//localhost:1521/dbwc', 'rwp423', 'dbx2014');

?>
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
            <button name="opret">Opret Liga </button>
        </td>
    </tr>
</table>
</form>

<?php

if (isset($_POST['opret'])) {
    $liga_navn = $_POST[liganavn];
    $liga_længde = $_POST[længde];
    $liga_spil = $_POST[spil];

    $dbh->query("INSERT INTO WP_LIGAER(LIGA_NAVN, LIGA_LÆNGDE, LIGA_SPIL) VALUES ('$liga_navn', $liga_længde, '$liga_spil')");
}

?>
