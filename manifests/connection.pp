define openswan::connection(
  $auto,
  $authby,
  $esp,
  $ike,
  $left,
  $leftsubnet = undef,
  $leftprotoport,
  $leftnexthop,
  $pfs,
  $rekey,
  $right,
  $rightprotoport,
  $rightsubnetwithin,
  $type,
  $opts = undef
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
