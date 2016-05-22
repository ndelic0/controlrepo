#
class profile::common::yumrepo {
  $yumrepos=lookup('common::yumrepos')

  $yumrepos.each |$name, $yumrepo|{
    yumrepo { $name:
      ensure  => $yumrepo[ 'present' ],
      baseurl => $yumrepo[ 'baseurl' ],
      descr   => $yumrepo[ 'descr' ],
      enabled => $yumrepo[ 'enabled' ],
      gpgcheck => $yumrepo[ 'gpgcheck' ],
    }
  }

}
