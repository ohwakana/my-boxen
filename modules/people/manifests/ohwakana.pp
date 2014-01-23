class people::ohwakana {
  ## osx
  # Finder
  include osx::finder::unhide_library
  class osx::finder::show_all_files {
    include osx::finder
    boxen::osx_defaults { 'Show all files':
      user   => $::boxen_user,
      domain => 'com.apple.finder',
      key    => 'AppleShowAllFiles',
      value  => true,
      notify => Exec['killall Finder'];
    }
  }
  include osx::finder::show_all_files

  # Dock
  include osx::dock::autohide

  class osx::dock::kill_dashbord{
    include osx::dock
    boxen::osx_defaults { 'kill dashbord':
      user   => $::boxen_user,
      domain => 'com.apple.dashboard',
      key    => 'mcx-disabled',
      value  => YES,
      notify => Exec['killall Dock'];
    }
  }
  include osx::dock::kill_dashbord

  # Universal Access
  include osx::universal_access::ctrl_mod_zoom
  include osx::universal_access::enable_scrollwheel_zoom

  # Miscellaneous
  include osx::no_network_dsstores # disable creation of .DS_Store files on network shares
  include osx::software_update # download and install software updates

  # include turn-off-dashboard

  # lib
  include python
  include java
#  include php::5_4
  include mysql
  include wget
  include zsh
  include heroku
  include phantomjs
  include imagemagick

  # local application for develop
  include sequel_pro
  include iterm2::stable
  include sublime_text_2
  sublime_text_2::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }
  include firefox
  include chrome

  # local application for utility
  include dropbox
  include skype
  include evernote


  # via homebrew
  package {
    [
      'readline', # use for rails
      'tmux',
      'reattach-to-user-namespace', # use tmux to clipbord
      'tree',
      'proctools', # kill by process name. like $ pkill firefox
      'tig',
      'git-extras',
      'z',
      'ec2-api-tools',
      'ec2-ami-tools',
      're2c',
    ]:
  }

  # dotfile setting
  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/dotfiles"

  repository { $dotfiles:
    source  => '${::boxen_user}/dotfiles'
    # require => File[$my]
  }
  exec { "sh ${dotfiles}/bootstrap.sh":
    cwd => $dotfiles,
    creates => "${home}/.zshrc",
    require => Repository[$dotfiles],
    notify  => Exec['submodule-clone'],
  }
  exec { "submodule-clone":
    cwd => $dotfiles,
    command => 'git submodule init && git submodule update',
    require => Repository[$dotfiles],
  }
}

