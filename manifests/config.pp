class openswan::config(
 $debug_level = undef,
 $nat_t,
 $opportunistic_encryption,
 $dumpdir,
 $plutoopts = undef,
 $plutostderrlog,
 $protostack,
 $virtual_private
) {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { '/etc/ipsec.conf':
    ensure  => file,
    content => template('openswan/ipsec.conf.erb'),
  }
  file { '/etc/ipsec.secrets':
    ensure => file,
    mode   => '0600',
    source => 'puppet:///modules/openswan/ipsec.secrets',
  }
  file { '/etc/ipsec.d':
    ensure => directory,
    mode   => '0755',
  }
  file { '/etc/ipsec.d/connections':
    ensure => directory,
    mode   => '0755',
  }
  file { '/etc/ipsec.d/secrets':
    ensure => directory,
    mode   => '0600',
  }
  file { '/etc/ipsec.d/connections/index.conf':
    ensure => file,
  }
}
