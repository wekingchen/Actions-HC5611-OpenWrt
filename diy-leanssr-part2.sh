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

wget https://codeload.github.com/fw876/helloworld/zip/28504024db649b7542347771704abc33c3b1ddc8 -O helloworld.zip
unzip helloworld.zip
rm -rf feeds/helloworld/shadowsocks-rust
cp -r helloworld-28504024db649b7542347771704abc33c3b1ddc8/shadowsocks-rust feeds/helloworld
rm -rf helloworld.zip helloworld-28504024db649b7542347771704abc33c3b1ddc8
