# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.4.2"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",     "1.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.0.100"
github "git",         "2.2.2"
github "go",          "1.1.0"
github "homebrew",    "1.6.1"
github "hub",         "1.3.0"
github "inifile",     "1.0.3", :repo => "puppetlabs/puppetlabs-inifile"
github "module-data", "0.0.3", :repo => "ripienaar/puppet-module-data"
github "nginx",       "1.4.3"
github "nodejs",      "3.6.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.1.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "7.2.4"
github "stdlib",      "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.1.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.


## custmize
github "osx",            "2.2.2"
github "autoconf",       "1.0.0"

# lib
github "python",         "1.1.0"
github "java",           "1.2.0"
github "php",           "1.2.0"
github "libtool",        "1.0.0" # use for php
github "pkgconfig",      "1.0.0" # use for php
github "pcre",           "1.0.0" # use for php
github "libpng",         "1.0.0" # use for php
github "wget",           "1.0.0"
github "zsh",            "1.0.0"
github "heroku",         "2.0.0"
github "mysql",          "1.1.0"
github "postgresql",     "2.0.0" # via homebrew
github "imagemagick",    "1.2.1" # via homebrew
github "mongodb",        "1.0.0"

# local application for develop
github "sequel_pro",     "1.0.0"
github "iterm2",         "1.0.4"
github "sublime_text_2", "1.1.2"
github "chrome",         "1.1.0"
github "firefox",        "1.1.7"
github "vagrant",        "3.0.7"
github "virtualbox",     "1.0.11"

# local application for utility
github "dropbox",        "1.2.0"
github "skype",          "1.0.8"
github "evernote",       "2.0.4"

