# Declare nginx container running 'jmick44/nginx' image with port 80 exposed
include nginx_container

# Declare nginx container running different image and port 8069 exposed
class { 'nginx_container':
  image => 'example/nginx',
  ports => '8069:80',
}

# Delete image and container
class { 'nginx_container':
  image_ensure     => 'absent',
  container_ensure => 'absent',
}
   

