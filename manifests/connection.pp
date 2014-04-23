define openswan::connection(
  $auto              = undef,
  $authby            = undef,
  $esp               = undef,
  $ike               = undef,
  $left              = undef,
  $leftsubnet        = undef,
  $leftprotoport     = undef,
  $leftnexthop       = undef,
  $leftid            = undef,
  $pfs               = undef,
  $rekey             = undef,
  $right             = undef,
  $rightprotoport    = undef,
  $rightsubnet       = undef,
  $rightsubnetwithin = undef,
  $type              = undef,
  $opts              = undef
) {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { "/etc/ipsec.d/connections/${name}.conf":
    ensure  => file,
    content => template('openswan/connection.conf.erb'),
    notify  => Class['openswan::service'],
  }
}
