class openswan (
  $debug_level              = $openswan::params::debug_level,
  $nat_t                    = $openswan::params::nat_t,
  $opportunistic_encryption = $openswan::params::opportunistic_encryption,
  $protostack               = $openswan::params::protostack,
  $plutoopts                = $openswan::params::plutoopts,
  $virtual_private          = $openswan::params::virtual_private
) inherits openswan::params {

  include stdlib

  anchor { 'openswan::begin': }
  -> class { 'openswan::package': }
  -> class { 'openswan::config':
    debug_level              => $debug_level,
    nat_t                    => $nat_t,
    opportunistic_encryption => $opportunistic_encryption,
    plutostack               => $plutostack,
    plutoopts                => $plutoopts,
    virtual_private          => $virtual_private,
  }
  ~> class { 'openswan::service': }
  -> anchor { 'openswan::end': }

}
