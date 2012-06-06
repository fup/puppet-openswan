class openswan (
  $debug_level              = $openswan::params::debug_level,
  $nat_t                    = $openswan::params::nat_t,
  $opportunistic_encryption = $openswan::params::opportunistic_encryption,
  $plutoopts                = $openswan::params::plutoopts,
  $protostack               = $openswan::params::protostack,
  $virtual_private          = $openswan::params::virtual_private
) inherits openswan::params {

  include stdlib

  anchor { 'openswan::begin': }
  -> class { 'openswan::package': }
  -> class { 'openswan::config':
    debug_level              => $debug_level,
    nat_t                    => $nat_t,
    opportunistic_encryption => $opportunistic_encryption,
    protostack               => $protostack,
    plutoopts                => $plutoopts,
    virtual_private          => $virtual_private,
  }
  ~> class { 'openswan::service': }
  -> anchor { 'openswan::end': }

}
