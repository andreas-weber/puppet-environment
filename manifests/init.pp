# == Class: aw_environment
#
# This module manages system wide environment variables.
#
# === Parameters
#
# [*vars*]
#   The environment vars to define.
#
# === Examples
#
#   include aw_environment
#
#   class { 'aw_environment':
#     'vars' => {
#       'APPLICATION_DEBUG' => 1',
#       'APPLICATION_ENVIRONMENT' => 'dev'
#     }
#   }
#
# === Authors
#
# Andreas Weber <code@andreas-weber.me>
#
# === Copyright
#
# Copyright 2015 Andreas Weber
#
class aw_environment (
  $vars = []
) {
  if $::kernel == 'Linux' {
    file { '/etc/environment':
      ensure  => file,
      backup  => false,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('aw_environment/environment.erb'),
    }
  }
}
