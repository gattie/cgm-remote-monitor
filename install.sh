#!/bin/bash
puppet module install puppetlabs-vcsrepo
puppet apply --verbose --show_diff -e "class { 'cgm_remote_monitor': }"
