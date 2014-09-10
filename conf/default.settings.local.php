<?php
$databases = array(
  'default' => array(
    'default' => array(
      'database' => 'PROJECTNAME',
      'username' => 'PROJECTNAME',
      'password' => 'PROJECTNAME',
      'host' => 'localhost',
      'port' => '',
      'driver' => 'mysql',
      'prefix' => '',
    ),
  ),
);

error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);

$conf['error_level'] = 2;

#$conf['mail_system'] = array( 'default-system' => 'DevelMailLog', );
