class thrnio(
  $username  = $::thrnio::params::username,
  $usergroup = $::thrnio::params::usergroup,
  $userhome  = undef,
  $dotfiles  = undef,
) inherits thrnio::params {

  if $userhome {
    $homedir = $userhome
  } else {
    $homedir = "${::thrnio::params::homedir_prefix}${username}"
  }

  case $::osfamily {
    'Debian': { require thrnio::debian }
    default: { warn("OS family '${::osfamily}' not supported!") }
  }

  user { $username:
    home  => $homedir,
    shell => '/bin/zsh',
  }

  vcsrepo { "${homedir}/.emacs.d":
    ensure   => 'present',
    provider => git,
    user     => $username,
    owner    => $username,
    group    => $usergroup,
    source   => 'https://github.com/syl20bnr/spacemacs.git',
    revision => 'v0.102.2',
  }

  package { 'virtualenv':
    ensure   => latest,
    provider => pip,
  }

  File {
    ensure => file,
    owner  => $username,
    group  => $usergroup,
    mode   => '0640',
  }

  ['ackrc', 'bashrc', 'bash_prompt', 'dircolors', 'fonts.conf', 'gitconfig',
   'spacemacs', 'tmux.conf', 'zshrc'].each |$filename| {
     file { "${homedir}/.${filename}":
       source => "puppet:///modules/thrnio/${filename}",
     }
   }

  file { "${homedir}/.zsh":
    recurse => remote,
    source  => 'puppet:///modules/thrnio/zsh',
  }

  file { "${homedir}/Code/puppetlabs":
    ensure => directory,
  }

  vcsrepo { "${homedir}/Code/puppetlabs/py-plops":
    ensure   => present,
    provider => git,
    user     => $username,
    owner    => $username,
    group    => $usergroup,
    source   => 'git@github.com:puppetlabs/py-plops.git',
    identity => '/home/rw/.ssh/id_rsa',
  }

  # vcsrepo { "${homedir}/.rbenv":
  #   ensure   => latest,
  #   provider => git,
  #   owner    => $username,
  #   group    => $usergroup,
  #   source   => 'https://github.com/sstephenson/rbenv.git',
  # }

  # vcsrepo { "${homedir}/.rbenv/plugins/ruby-build":
  #   ensure   => latest,
  #   provider => git,
  #   owner    => $username,
  #   group    => $usergroup,
  #   source   => 'https://github.com/sstephenson/ruby-build.git',
  #   require  => Vcsrepo["${homedir}/.rbenv"],
  # }

  file { '/usr/share/X11/xkb/symbols/rwdvp':
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/thrnio/rwdvp.xkb',
  }

  augeas { 'add custom keyboard to evdev.xml':
    incl    => '/usr/share/X11/xkb/rules/evdev.xml',
    context => '/files/usr/share/X11/xkb/rules/evdev.xml',
    lens    => 'Xml.lns',
    changes => [ 'set /xkbConfigRegistry/layoutList/layout[configItem/name[#text=rwdvp]]/configItem/name/#text rwdvp',
                 'set /xkbConfigRegistry/layoutList/layout[configItem/name[#text=rwdvp]]/configItem/shortDescription/#text rw',
                 'set /xkbConfigRegistry/layoutList/layout[configItem/name[#text=rwdvp]]/configItem/description/#text "English (Ryan\'s)"',
                 'set /xkbConfigRegistry/layoutList/layout[configItem/name[#text=rwdvp]]/configItem/languageList/iso639Id/#text eng',],
  }
}
