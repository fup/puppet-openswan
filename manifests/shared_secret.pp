define openswan::shared_secret (
  $hosts,
  $psk
) {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0600',
  }

  file { "/etc/ipsec.d/secrets/${name}.secret":
    ensure  => file,
    mode    => '0600',
    content => "${hosts} : PSK \"${psk}\"\n",
    notify  => Class['openswan::service'],
  }
}
