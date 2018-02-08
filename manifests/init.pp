class nginx_container (
  $image_name   = 'jmick44/nginx',
  $ensure       = 'present',
  $ensure_force = false,
  $ports        = '80:80',
){
  
  include docker

  docker::image { $image_name: 
    ensure => $ensure,
    force  => $ensure_force,
  }

  docker::run { $image_name:
    ensure => $ensure,
    force  => $ensure_force,
    image  => $image_name,
    ports  => $ports,
    require => Docker::Image[$image_name],
  }
}
