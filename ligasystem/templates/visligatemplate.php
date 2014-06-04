<?php
/**
*Template name: Liga Template
*
*/
get_header();
get_sidebar();
global $ligaid;
?>

<html>
	<header>
		<div style="font-size:20px; margin-left:19%; margin-top:2%;">
			<tr><div style="float:left;">Liga - "Her skal der indsættes liganavn variabel"</div>
				<div style="float:right;">
					<button type="button" name="tilmeld">Tilmeld Liga</button>
				</div>
			</tr>
		</div>

	</header>
	<body>
		<div>
			<table border=1 style=" float:left; width:80%; margin-left:19%; margin-top:2%">
				<tr>
					<td>Oprettet af: </td><td>Oprettet(dato): </td><td>Antal Tilmeldte: </td>
				</tr>
				<tr>
					<td>Spil: </td><td>Sæsoner: </td><td>Andet: </td>
				</tr>
			</table>
		</div>
		<div>
			<table border=1 style="width:80%; margin-left:19%;">
				<div style="margin-left:19%">Herunder skal selve ligaen vises:</div>
				<tr>
					<th>Holdnavn og Hold/spiller-tegn/emblem</th><th>Vundet</th><th>Uafgjort</th><th>Tabt</th><th>Point</th>
				</tr>
				<?php
					//her skal vi have noget forech som printer alle de <tr> der indeholder hvert et hold og deres point og det.
				?>
			</table>
		</div>

	</body>

</html>

<?php
get_footer();
?>