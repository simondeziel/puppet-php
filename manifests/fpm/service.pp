# Manage fpm service
#
# === Parameters
#
# [*service_name*]
#   name of the php-fpm service
#
# [*ensure*]
#   'ensure' value for the service
#
# [*enable*]
#   Defines if the service is enabled
#
# [*provider*]
#   Defines if the service provider to use
#
class php::fpm::service (
  $service_name = $php::fpm::service_name,
  $ensure       = $php::fpm::service_ensure,
  $enable       = $php::fpm::service_enable,
  $provider     = $php::fpm::service_provider,
) {
  if ! defined(Class['php::fpm']) {
    warning('php::fpm::service is private')
  }

  service { $service_name:
    ensure     => $ensure,
    enable     => $enable,
    provider   => $provider,
    hasrestart => true,
    hasstatus  => true,
  }

  ::Php::Extension <| |> ~> Service[$service_name]
}
