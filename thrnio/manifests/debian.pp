class thrnio::debian {
  $packages = ['ack-grep',
               'atool',
               'augeas-tools',
               'colordiff',
               'curl',
               'emacs',
               'faenza-icon-theme',
               'git',
               'htop',
               'fonts-dejavu',
               'fonts-inconsolata',
               'fonts-liberation',
               'gnome-shell-pomodoro',
               'google-chrome-stable',
               'jq',
               'libappindicator1',
               'libcurl3',
               'liblzma-dev',
               'libreadline-dev',
               'libsqlite3-dev',
               'libssl-dev',
               'libxml2-dev',
               'libxslt1-dev',
               'meld',
               'most',
               'mtr',
               'mu4e',
               'network-manager-openvpn',
               'network-manager-openvpn-gnome',
               'offlineimap',
               'python-dev',
               'python-gnomekeyring',
               'python-pip',
               'ruby-dev',
               'silversearcher-ag',
               'sudo',
               'tmux',
               'ttf-mscorefonts-installer',
               'unifont',
               'vim-gnome',
               'xinput',
               'xsel',
               'zlib1g-dev',
               'zsh']

  # TODO: load firmware-iwlwifi

  package { $packages:
    ensure => latest,
  }

  include ::apt

  # apt::source { 'spotify':
  #   location   => 'http://repository.spotify.com',
  #   release    => 'stable',
  #   repos      => 'non-free',
  #   key        => {
  #     id     => 'E22CBE98B5575C1857671254082CCEDF94558F59',
  #     server => 'keyserver.ubuntu.com',
  #   },
  #   include    => {
  #     src => false,
  #     deb => true,
  #   },
  # }

  # package { 'spotify-client':
  #   ensure  => present,
  #   require => Apt::Source['spotify'],
  # }

  # apt::source { 'atlassian-hipchat':
  #   location    => 'http://downloads.hipchat.com/linux/apt',
  #   release     => 'stable',
  #   repos       => 'main',
  #   include_src => false,
  # }

  # package { 'hipchat':
  #   ensure  => present,
  #   require => Apt::Source['atlassian-hipchat'],
  # }

  # apt::source { 'bluejeans':
  #   location    => 'http://swdl.bluejeans.com/repos/bluejeans/x86_64/release/debs',
  #   release     => 'stable',
  #   repos       => 'main',
  #   include_src => false,
  # }

  # package { 'bjnplugin':
  #   ensure  => present,
  #   require => Apt::Source['bluejeans'],
  # }

  file { '/usr/share/fonts/opentype/source-code-pro':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    recurse => true,
    source  => 'puppet:///modules/thrnio/source-code-pro',
    notify  => Exec['clear font cache'],
  }

  exec { 'clear font cache':
    command     => '/usr/bin/fc-cache -fv',
    refreshonly => true
  }

  ini_setting { 'firefox-icon':
    ensure  => present,
    path    => '/usr/share/applications/iceweasel.desktop',
    section => 'Desktop Entry',
    setting => 'Icon',
    value   => 'firefox',
  }

  ini_setting { 'emacs-icon':
    ensure  => present,
    path    => '/usr/share/applications/emacs24.desktop',
    section => 'Desktop Entry',
    setting => 'Icon',
    value   => 'emacs24',
  }

  #ini_setting { 'spotify-icon':
    #ensure  => present,
    #path    => '/opt/spotify/spotify-client/spotify.desktop',
    #section => 'Desktop Entry',
    #setting => 'Icon',
    #value   => 'spotify',
  #}
}
