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
                       <?php
                       $results = $wpdb->get_results("SELECT LIGA_NAVN FROM WP_LIGAER");
                       foreach ($results as $row) {
                         ?>
                <tr>
                    <td>
                        <?php
                        echo $row->LIGA_NAVN;
                        ?>
                    </td>
                </tr>
                <?php } ?>
        </table>
        <table border=1 style="float:left; width:20%; margin-left:1%; margin-top:2%">
            <tr>
                <td style="font-weight:bold">
                    sgkfdshg
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
                <td>
                    <a href="<?php echo site_url()?>/testlink.php">Link</a>
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
        $wpdb->prepare($wpdb->query("INSERT INTO WP_LIGAER VALUES "."('$name', $length, '$game')"));
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