class profile::base {

  #the base profile should include component modules that will be on all nodes

  include ::ntp

  include ::firewall
  include ::selinux
  include ::ssh::client
  include ::ssh::server
  include ::openssl
}
