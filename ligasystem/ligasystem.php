<?php
/**
 * Plugin Name: Liga System
 * Description: Simpelt ligasystem
 * Version: 1.0
 * Author: Kasper
 */

/**********************
 * Includes
 *********************/

/*
include('includes/Vis_liga.php');
include('includes/opret_liga.php');
*/


// Runs when plugin is activated
register_activation_hook( __FILE__, 'KV_page_template');

// Runs on plugin deactivation
register_deactivation_hook( __FILE__, 'KV_plugin_remove' );

// Creates a new page with a template
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

		if(!$post_id) {

			wp_die('Error creating template page');

		} else {
				update_post_meta($post_id, '_wp_page_template','testtemplate.php');
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


// adds the template to the page
function KV_uploade_template ($template){

	$plugindir = dirname(__FILE__);

	if( is_page_template( 'testtemplate.php')) {

		$template = $plugindir.'/templates/testtemplate.php';
	}

	return $template;

}

//trashes page when plugin is deactivated
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
