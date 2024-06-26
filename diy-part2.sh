#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# 去掉ssr+中shadowsocksr-libev的libopenssl-legacy依赖支持
sed -i 's/ +libopenssl-legacy//g' feeds/helloworld/shadowsocksr-libev/Makefile

# 固定shadowsocks-rust版本以免编译失败
rm -rf feeds/helloworld/shadowsocks-rust
wget -P feeds/helloworld/shadowsocks-rust https://github.com/wekingchen/my-file/raw/master/shadowsocks-rust/Makefile
rm -rf feeds/passwall_packages/shadowsocks-rust
wget -P feeds/passwall_packages/shadowsocks-rust https://github.com/wekingchen/my-file/raw/master/shadowsocks-rust/Makefile

# 跟随最新版naiveproxy
rm -rf feeds/helloworld/naiveproxy
rm -rf feeds/passwall_packages/naiveproxy
git clone -b v5 https://github.com/sbwml/openwrt_helloworld.git
cp -r openwrt_helloworld/naiveproxy feeds/helloworld
cp -r openwrt_helloworld/naiveproxy feeds/passwall_packages
rm -rf openwrt_helloworld

# 修复dns2tcp编译失败的问题
rm -rf feeds/passwall_packages/dns2tcp
wget -P feeds/passwall_packages/dns2tcp https://github.com/sbwml/openwrt_helloworld/raw/v5/dns2tcp/Makefile

git clone https://github.com/coolsnowwolf/lede.git
cp -r lede/tools/ninja tools/ninja
rm -rf lede
