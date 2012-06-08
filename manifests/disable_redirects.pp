define openswan::disable_redirects {
  sysctl::value { "net.ipv4.conf.${name}.accept_redirects": value => '0' }
  sysctl::value { "net.ipv4.conf.${name}.send_redirects": value => '0' }
}
