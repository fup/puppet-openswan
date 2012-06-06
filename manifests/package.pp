class openswan::package {
  package { $openswan::params::package_list:
    ensure => present,
  }
}
