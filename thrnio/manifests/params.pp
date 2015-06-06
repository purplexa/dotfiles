class thrnio::params {
  $username = 'rw'
  $homedir_prefix = $osfamily ? {
    'Darwin' => '/Users/',
    default  => '/home/',
  }
  $usergroup = $osfamily ? {
    'Debian' => 'rw',
  }
}