<?php
/**
*Template Name: test Template
*/

get_header();
global $wpdb;
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Liga system</title>
    </head>
    <body>
        <table border=1 style="float:left; width:20%; margin-left:19%; margin-top:2%">
            <tr>
                <td style="font-weight:bold">
                    Tilmeld Liga
                </td>
            </tr>
            <tr>
                <td>
                    <?php 
                        $my_ligaer = $wpdb->get_row("SELECT * FROM wp_ligaer");
                        echo $my_ligaer->liga_navn ." - ". $my_ligaer->liga_længde ." - ". $my_ligaer->liga_spil;
                    ?>
                </td>
            </tr>
        </table>
        <table border=1 style="float:left; width:20%; margin-left:1%; margin-top:2%">
            <tr>
                <td style="font-weight:bold">
                    Mine Ligaer
                </td>
            </tr>
            <tr>
                <td>
                    <?php 

                    ?>
                </td>
            </tr>
        </table>
        <form method="POST">
        <table border=1 style="float:left; width:20%; margin-left:1%; margin-top:2%">
            <tr>
                <td style="font-weight:bold">
                    Opret Liga
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
                    <input type="text" name="ligalenght">
                </td>
            </tr>
            <tr>
                <td>
                    Spil:
                </td>
                <td>
                    <input type="text" name="game">
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
</html>
<?php
$name = $_POST[liganavn];
$length = $_POST[ligalenght];
$game = $_POST[game];


if (isset($_POST['submit'])) {

    try {
        $wpdb->insert('WP_LIGAER', array('liga_navn' => $name, 'liga_længde' => $lenght, 'liga_spil' => $game));
         echo "Følgende liga er blevet oprettet: $name $length $game";
    } catch (Exception $e) {
        echo $e->getMessage();
        $conn->rollback();
    }
}
?>
<?php
get_sidebar();
get_footer();
?>