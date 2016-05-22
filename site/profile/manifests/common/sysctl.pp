#
class profile::common::sysctl {
  $sysctl=lookup( 'common::sysctl' )

  $sysctl.each | $name, $sysctl | {
    sysctl { $name:
      ensure => $sysctl[ 'ensure' ],
      value  => $sysctl[ 'value' ]
    }

  }
}
