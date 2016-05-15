#
class profile::common_packages {
  $packages=lookup('common::packages')

  $packages.each |$name, $package|{
    package{ $name:
      ensure => $package["ensure"]
    }
  }

}
