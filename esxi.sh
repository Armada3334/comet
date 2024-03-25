#!/bin/sh
esxcli network firewall set --default-action false
for RULESET in $(esxcli network firewall ruleset list | grep true | awk '{print $1}')
do
  esxcli network firewall ruleset set --enabled false --ruleset-id "$RULESET"
done
esxcli network firewall ruleset set --enabled true --ruleset-id webAccess
esxcli network firewall ruleset set --enabled true --ruleset-id vSphereClient
esxcli network firewall ruleset set --enabled true --ruleset-id dns
esxcli network firewall ruleset set --enabled true --ruleset-id dhcp
esxcli network firewall ruleset set --enabled true --ruleset-id sshServer
esxcli network firewall refresh