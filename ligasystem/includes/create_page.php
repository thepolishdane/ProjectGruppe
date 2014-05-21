<?php

// Runs when plugin is activated
register_activation_hook( __FILE__, 'KV_page_template');

// Runs on plugin deactivation
register_deactivation_hook( __FILE__, 'KV' );

// Creates a new page with a template
function KV_page_template() {


	$title = 'Leagues';
	$slug = 'League';
 	// the menu entry...
    delete_option("my_plugin_page_title");
    add_option("my_plugin_page_title", $title, '', 'yes');
    // the slug...
    delete_option("my_plugin_page_name");
    add_option("my_plugin_page_name", $slug, '', 'yes');
    // the id...
    delete_option("my_plugin_page_id");
    add_option("my_plugin_page_id", '0', '', 'yes');

	$author_id = 1;
	
	
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
}

add_action('template_include','KV_uploade_template');

function KV_uploade_template ($template){

	$plugindir = dirname(__FILE__);

	if( is_page_template( 'testtemplate.php')) {

		$template = $plugindir.'/templates/testtemplate.php';
	}

	return $template;

}

?>