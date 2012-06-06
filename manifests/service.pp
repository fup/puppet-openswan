class openswan::service {
  service { $openswan::params::service_name:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
