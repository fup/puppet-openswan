class openswan (
  $debug_level              = $openswan::params::debug_level,
  $nat_t                    = $openswan::params::nat_t,
  $opportunistic_encryption = $openswan::params::opportunistic_encryption,
  $dumpdir                  = $openswan::params::dumpdir,
  $plutoopts                = $openswan::params::plutoopts,
  $plutostderrlog           = $openswan::params::plutostderrlog,
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
    dumpdir                  => $dumpdir,
    plutoopts                => $plutoopts,
    plutostderrlog           => $plutostderrlog,
    virtual_private          => $virtual_private,
  }
  ~> class { 'openswan::service': }
  -> anchor { 'openswan::end': }

}
