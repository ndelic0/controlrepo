#
class profile::common::kernel {
  $kernel_params=lookup( 'common::kernel_params' )

  $kernel_params.each | $name, $kernel_parameter | {
    kernel_parameter { $name:
      ensure => $kernel_parameter[ 'ensure' ],
      value  => $kernel_parameter[ 'value' ],
    }
  }

  reboot { 'after_run':
    apply => 'finished'
  }

  Kernel_parameter <| |> ~> Reboot <| |>
}
