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
                        $my_ligaer = $wpdb->get_row("SELECT * FROM wp_liga");
                        echo $my_ligaer->liga_name ." - ". $my_ligaer->liga_lenght ." - ". $my_ligaer->liga_game;
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
        <form method="">
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
                    <button type="button" name="opret">Opret Liga</button>
                </td>
            </tr>
        </table>
        <?php
        if(isset ($_POST['opret'])){
            $liga_navn = $_POST['liganavn'];
            $liga_lenght = $_POST['ligalenght'];
            $game = $_POST['game'];

            $wpdb->insert('WP_liga', array( 
        'column1' => $liga_navn, 
        'column2' => $liga_lenght,
        'column3' => $game 
    ));

        }


        ?>
    </form>
    </body>
</html>
<?php
get_sidebar();
get_footer();
?>