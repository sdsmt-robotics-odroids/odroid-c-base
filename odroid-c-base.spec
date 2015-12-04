Name:           odroid-c-base
Version:        0.2.0
Release:        1%{?dist}
Summary:        Basic system configurations for ODROID-C

Group:          System Environment/Base
License:        BSD
URL:            http://odroid.com/dokuwiki/doku.php?id=en:odroid-c1
Source0:        02-c_init.conf
Source1:        55-c_init_fb0.rules
Source2:        55-c_init_fb1.rules
Source3:        55-c_init_net.rules
Source4:        55-c_init_ppmgr.rules
Source5:        60-c_mali.rules
Source6:        99-c-network.conf
Source7:        c_init_fb0.sh
Source8:        c_init_fb1.sh
Source9:        c_init_net.sh
Source10:       c_init_ppmgr.sh
Source11:       SOC-Audio.conf
Source12:       odroid-c-mali.sh

BuildArch:      noarch

Requires:       fbset
Requires:       dracut
Requires:       udev

%description
Basic system configurations for ODROID-C, such as firmware scripts and rules
for udev.

%prep

%build

%install
install -p -m0644 -D %{SOURCE0} %{buildroot}%{_prefix}/lib/dracut/dracut.conf.d/02-c_init.conf
install -p -m0644 -D %{SOURCE1} %{buildroot}%{_prefix}/lib/udev/rules.d/55-c_init_fb0.rules
install -p -m0644 -D %{SOURCE2} %{buildroot}%{_prefix}/lib/udev/rules.d/55-c_init_fb1.rules
install -p -m0644 -D %{SOURCE3} %{buildroot}%{_prefix}/lib/udev/rules.d/55-c_init_net.rules
install -p -m0644 -D %{SOURCE4} %{buildroot}%{_prefix}/lib/udev/rules.d/55-c_init_ppmgr.rules
install -p -m0644 -D %{SOURCE5} %{buildroot}%{_prefix}/lib/udev/rules.d/60-c_mali.rules
install -p -m0644 -D %{SOURCE6} %{buildroot}%{_sysconfdir}/sysctl.d/99-c-network.conf
install -p -m0755 -D %{SOURCE7} %{buildroot}%{_prefix}/lib/udev/c_init_fb0.sh
install -p -m0755 -D %{SOURCE8} %{buildroot}%{_prefix}/lib/udev/c_init_fb1.sh
install -p -m0755 -D %{SOURCE9} %{buildroot}%{_prefix}/lib/udev/c_init_net.sh
install -p -m0755 -D %{SOURCE10} %{buildroot}%{_prefix}/lib/udev/c_init_ppmgr.sh
install -p -m0644 -D %{SOURCE11} %{buildroot}%{_datadir}/alsa/cards/SOC-Audio.conf
install -p -m0644 -D %{SOURCE12} %{buildroot}%{_sysconfdir}/profile.d/odroid-c-mali.sh

%files
%{_prefix}/lib/dracut/dracut.conf.d/02-c_init.conf
%{_prefix}/lib/udev/rules.d/55-c_init_fb0.rules
%{_prefix}/lib/udev/rules.d/55-c_init_fb1.rules
%{_prefix}/lib/udev/rules.d/55-c_init_net.rules
%{_prefix}/lib/udev/rules.d/55-c_init_ppmgr.rules
%{_prefix}/lib/udev/rules.d/60-c_mali.rules
%config(noreplace) %{_sysconfdir}/sysctl.d/99-c-network.conf
%{_prefix}/lib/udev/c_init_fb0.sh
%{_prefix}/lib/udev/c_init_fb1.sh
%{_prefix}/lib/udev/c_init_net.sh
%{_prefix}/lib/udev/c_init_ppmgr.sh
%{_datadir}/alsa/cards/SOC-Audio.conf
%dir %{_datadir}/alsa
%dir %{_datadir}/alsa/cards
%{_sysconfdir}/profile.d/odroid-c-mali.sh

%changelog
* Thu Dec 03 2015 Scott K Logan <logans@cottsay.net> - 0.2.0-1
- Add odroid-c-mali.sh
- Add umplock udev rule
- Update ALSA config to use hw0,0

* Sun May 03 2015 Scott K Logan <logans@cottsay.net> - 0.1.0-2
- Fix some incorrect filenames

* Sun May 03 2015 Scott K Logan <logans@cottsay.net> - 0.1.0-1
- Initial package
