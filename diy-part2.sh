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

# 加入ssr+中shadowsocks-rust的rust依赖支持
git clone https://github.com/coolsnowwolf/packages.git ppackages
cp -r ppackages/lang/rust feeds/packages/lang/rust
rm -rf ppackages

# 跟随最新版naiveproxy
rm -rf feeds/helloworld/naiveproxy
rm -rf feeds/passwall_packages/naiveproxy
git clone -b v5 https://github.com/sbwml/openwrt_helloworld.git
cp -r openwrt_helloworld/naiveproxy feeds/helloworld
cp -r openwrt_helloworld/naiveproxy feeds/passwall_packages
rm -rf openwrt_helloworld

git clone https://github.com/coolsnowwolf/lede.git
cp -r lede/tools/ninja tools/ninja
rm -rf lede
