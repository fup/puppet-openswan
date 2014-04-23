class openswan::params {

  # Logic for Debug Level. Default: undef will comment out debugging. Otherwise,
  # debug levels for OpenSWAN can be set here (string: space seperated)
  $debug_level = undef

  # Extra parameters for Pluto
  $plutoopts = undef

  # Exclude networks used on server side by adding %v4:!a.b.c.0/24
  $virtual_private = '%v4:10.0.0.0/8,%v4:192.168.0.0/16,%v4:172.16.0.0/12'

  # Enable NAT Transversal (NAT-T)
  $nat_t = true

  # IPSec Protocol Stack. auto will try netkey, then klips then mast
  $protostack = 'auto'

  # Enable Opportunistic Encryption
  $opportunistic_encryption = 'off'

  case $::operatingsystem {
    debian,ubuntu: {
      $package_list = ['libgmp10', 'openswan', 'lsof']
      $service_name = 'ipsec'
    }
    default: { }
  }
}
