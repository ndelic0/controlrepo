#
class profile::puppetmaster {

  $hiera_yaml = "${::settings::confdir}/hiera.yaml"
  $hiera_datadir = "${::settings::environmentpath}/%{environment}/hieradata"

  class { 'hiera':
    hierarchy       => [
      'virtual/%{::virtual}',
      'nodes/%{::trusted.certname}',
      'roles/%{role}/%{tier}',
      'roles/%{role}',
      'tier/%{tier}',
      'common',
    ],
    backends        => [ 'yaml', 'eyaml' ],
    hiera_yaml      => $hiera_yaml,
    datadir         => $hiera_datadir,
    owner           => 'pe-puppet',
    group           => 'pe-puppet',
    eyaml           => true,
    eyaml_extension => 'yaml',
    provider        => 'puppetserver_gem',
    create_keys     => true,
    master_service  => 'pe-puppetserver',
    notify          => Service['pe-puppetserver'],
  }

}
