<?php
/**
 * Plugin Name: Liga System
 * Description: Simpelt ligasystem
 * Version: 1.0
 * Author: Kasper
 */

// Runs when plugin is activated
register_activation_hook( __FILE__, 'KV_page_template');

register_activation_hook( __FILE__, 'KV_page_template2');

register_activation_hook( __FILE__, 'KV_install_tabels');

// Runs on plugin deactivation
register_deactivation_hook( __FILE__, 'KV_plugin_remove' );

register_deactivation_hook( __FILE__, 'KV_plugin_remove2' );

// Laver et nyt tabel hvis det ikke eksisterer, og opdaterer det hvis
// det findes i forvejen
function KV_install_tabels(){

	global $wpdb;

	$table_name = $wpdb->prefix . 'liga';
	$table_name_2 = $wpdb->prefix . 'matches';

	// checker om det table man vil lave allerede findes
	if ($wpdb->get_var('SHOW TABLES LIKE ' . $table_name) != $table_name){

		$sql = "CREATE TABLE $table_name (
				liga_name varchar(255) not null, 
				liga_lenght integer not null,
				liga_game varchar (255) not null, 
				liga_id varchar (255) not null,
				liga_startdate integer not null,
				liga_currentsignups integer not null,
				liga_host varchar (255) not null,
				liga_prize varchar (255),
				liga_players varchar (255), 
				PRIMARY KEY  (liga_id),
				foreign key (liga_players)
				references wp_users(user_nicename),
				foreign key (liga_host)
				references wp_users(user_nicename));
				CREATE TABLE $table_name_2 (
				Match_id varchar (255) not null,
				liga_id varchar (255) not null,
				match_players varchar (255) not null,
				match_rank varchar (255) not null,
				match_time date not null,
				PRIMARY KEY  (Match_id),
				foreign key (liga_id)
				references wp_liga(liga_id),
				foreign key (match_players)
				references wp_liga(Liga_players))";


		// dbDelta er en funktion allerede inde i wordpress, som kan
		// bruges til at lave tables, men den skal først "loades"
		require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
		dbDelta($sql);
	} // end if

}


// Creates a new page
function KV_page_template() {

	$title = 'Leagues';
	$slug = 'League';
	$author_id = 1;
	
	// the menu entry...
    delete_option("my_plugin_page_title");
    add_option("my_plugin_page_title", $title, '', 'yes');
    // the slug...
    delete_option("my_plugin_page_name");
    add_option("my_plugin_page_name", $slug, '', 'yes');
    // the id...
    delete_option("my_plugin_page_id");
    add_option("my_plugin_page_id", '0', '', 'yes');
	
	$KV_page = get_page_by_title($title);
	
	//Checks if the page exist, if not create it
	if(null==get_page_by_title($title)) {

		$uploader_page = array(
			'comment_status' => 'closed',
			'ping_status' => 'closed',
			'post_author' => $author_id,
			'post_name' => $slug,
			'post_title' => $title,
			'post_status' => 'publish',
			'post_type' => 'page');

		$post_id = wp_insert_post($uploader_page);


		// tilføjer mit template til siden
	if(!$post_id) {
	
			wp_die('Error creating template page');

		} else {

			update_post_meta($post_id, '_wp_page_template','forsideligatemplate.php');
		}


	}//end check if

	// if the page exist but is trashed, this will restore the page when the
	// plugin is activated again.
	else {

			$post_id = $KV_page->ID;

        	//make sure the page is not trashed...
       		$KV_page->post_status = 'publish';
       		$post_id = wp_update_post( $KV_page );

	}
	    delete_option( 'my_plugin_page_id' );
    add_option( 'my_plugin_page_id', $post_id );

}


add_action('template_include','KV_uploade_template');


// Runs the template
function KV_uploade_template ($template){

	$plugindir = dirname(__FILE__);

	if( is_page_template( 'forsideligatemplate.php')) {

		$template = $plugindir.'/templates/forsideligatemplate.php';
	}

	return $template;

}


// Creates a new page
function KV_page_template2() {

	$title2 = 'Show League';
	$slug2 = 'Show';
	$author_id2 = 2;
	
	// the menu entry...
    delete_option("my_plugin_page_title2");
    add_option("my_plugin_page_title2", $title2, '', 'yes');
    // the slug...
    delete_option("my_plugin_page_name2");
    add_option("my_plugin_page_name2", $slug2, '', 'yes');
    // the id...
    delete_option("my_plugin_page_id2");
    add_option("my_plugin_page_id2", '01', '', 'yes');
	
	$KV_page2 = get_page_by_title($title2);
	
	//Checks if the page exist, if not create it
	if(null==get_page_by_title($title2)) {

		$uploader_page2 = array(
			'comment_status' => 'closed',
			'ping_status' => 'closed',
			'post_author' => $author_id2,
			'post_name' => $slug2,
			'post_title' => $title2,
			'post_status' => 'publish',
			'post_type' => 'page');

		$post_id2 = wp_insert_post($uploader_page2);

		// tilføjer mit template til siden
	if(!$post_id2) {
	
			wp_die('Error creating template page');

		} else {

			update_post_meta($post_id2, '_wp_page_template','visligatemplate.php');
		}


	}//end check if

	// if the page exist but is trashed, this will restore the page when the
	// plugin is activated again.
	else {

			$post_id2 = $KV_page2->ID;

        	//make sure the page is not trashed...
       		$KV_page2->post_status = 'publish';
       		$post_id2 = wp_update_post( $KV_page2 );

	}
	    delete_option( 'my_plugin_page_id2' );
    add_option( 'my_plugin_page_id2', $post_id2 );

}

add_action('template_include','KV_uploade_template2');


// Runs the template
function KV_uploade_template2 ($template){

	$plugindir = dirname(__FILE__);

	if( is_page_template( 'visligatemplate.php')) {

		$template = $plugindir.'/templates/visligatemplate.php';
	}

	return $template;

}

//trashes page when plugin is deactivated
function KV_plugin_remove2() {

    global $wpdb;

    $title2 = get_option( "my_plugin_page_title2" );
    $name2 = get_option( "my_plugin_page_name2" );

    //  the id of our page...
    $post_id2 = get_option( 'my_plugin_page_id2' );
    if( $post_id2 ) {

        wp_delete_post( $post_id2 ); // this will trash, not delete

    }

    delete_option("my_plugin_page_title2");
    delete_option("my_plugin_page_name2");
    delete_option("my_plugin_page_id2");

}

function KV_plugin_remove() {

    global $wpdb;

    $title = get_option( "my_plugin_page_title" );
    $name = get_option( "my_plugin_page_name" );

    //  the id of our page...
    $post_id = get_option( 'my_plugin_page_id' );
    if( $post_id ) {

        wp_delete_post( $post_id ); // this will trash, not delete

    }

    delete_option("my_plugin_page_title");
    delete_option("my_plugin_page_name");
    delete_option("my_plugin_page_id");

}

?>





