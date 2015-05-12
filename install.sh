#!/bin/bash
# To run this curl -sSL https://github.com/thomcost/cgm-remote-monitor/blob/master/install.sh | bash
pushd /etc/puppet/modules
wget https://raw.githubusercontent.com/thomcost/cgm-remote-monitor/master/install.pp -O /etc/puppet/modules/install.pp
puppet module install puppetlabs-vcsrepo
puppet apply --verbose --show_diff -e "class { 'cgm_remote_monitor': }"
popd
