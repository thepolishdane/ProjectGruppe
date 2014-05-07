<html>
    <head>
        <meta charset="UTF-8">
        <title>Liga system</title>
    </head>
    <body>
        <table border=1 style="float:left; width:33%;">
            <tr>
                <td>
                    Tilmeld Liga
                </td>
            </tr>
            <?php
            $dbh = new PDO('oci:dbname=//localhost:1521/dbwc', 'rwp423', 'dbx2014');
            foreach ($dbh->query("SELECT LIGA_NAVN FROM WP_LIGAER") as $num_liga) {
                ?>
                <tr>
                    <td>
                        <?php
                        echo $num_liga[0];
                        ?>
                    </td>
                </tr>
            <?php } ?>
        </table>
        <table border=1 style="float:left; width:33%;">
            <tr>
                <td>
                    Dine Ligaer
                </td>
            </tr>
            <tr>
                <td>
                    <?php
                    //Vis de ligaer du er tilmeldt.....NOT IMPLEMENTET YET
                    ?>
                </td>
            </tr>
        </table>
        <form>
            <table border=1 style="float:left; width:33%;">
                <tr>
                    <td>
                        <a href=http://dbw.diku.dk/~rwp423/opret_liga.php><input type = button value = "Opret liga"></a>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>