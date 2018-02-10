class nginx_container (
  $image_name   = 'jmick44/nginx',
  $ensure       = 'present',
  $ports        = '80:80',
){
  
  include docker

  docker::image { $image_name: 
    ensure => $ensure,
  }

  docker::run { $image_name:
    ensure => $ensure,
    image  => $image_name,
    ports  => $ports,
    require => Docker::Image[$image_name],
  }
}
