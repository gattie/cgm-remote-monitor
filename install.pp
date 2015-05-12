# Run install.sh
class cgm_remote_monitor (
  $cwd        = '/home/tcostello',
  $repo_name  = 'cgm-remote-monitor',
  $git_source = 'git://github.com/thomcost/cgm-remote-monitor.git'
){
  $path = "${cwd}/${repo_name}"
  $packages = ['httpd', 'nodejs', 'npm', 'git']

  package { $packages:
    ensure => 'present',
  }
  ->
  vcsrepo { $path:
    ensure   => 'present',
    provider => 'git',
    source   => $git_source,
  }
  ->
  exec { 'npm install':
    cwd     => $path,
    command => '/usr/bin/npm install',
    creates => 'node_modules',
  }
  ->
  exec { 'node server start':
    cwd     => $path,
    command => '/usr/bin/node server.js',
    unless  => '/usr/bin/killall -0 node',
  }
}
