#!/bin/zsh
echo "Creating flatcar ova "

ovftool --allowExtraConfig --X:enableHiddenProperties \
--X:injectOvfEnv --name=flatcar --memorySize:'*'=3072 \
--extraConfig:guestinfo.coreos.config.data.encoding=base64 \
--extraConfig:guestinfo.coreos.config.data=$(ct --in-file config.yaml |base64) \
--net:"VM Network"="NAT" flatcar_production_vmware_ova.ova newdir