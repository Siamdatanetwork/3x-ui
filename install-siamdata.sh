#!/bin/bash

# --- ส่วนที่ 1: เตรียมความพร้อมเซิร์ฟเวอร์ ---
echo ">>> Updating server packages..."
apt update
apt install git wget -y

# --- ส่วนที่ 2: ดาวน์โหลดโปรเจกต์ของคุณ ---
echo ">>> Cloning your project from GitHub..."
git clone https://github.com/Siamdatanetwork/3x-ui.git

# --- ส่วนที่ 3: ติดตั้ง Go เวอร์ชันที่ถูกต้อง ---
echo ">>> Installing correct Go version (1.22.5)..."
apt remove golang -y >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1
rm /usr/bin/go >/dev/null 2>&1
wget https://go.dev/dl/go1.22.5.linux-amd64.tar.gz
rm -rf /usr/local/go
tar -C /usr/local -xzf go1.22.5.linux-amd64.tar.gz
rm go1.22.5.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# --- ส่วนที่ 4: Build และติดตั้ง Panel ---
echo ">>> Building and installing the panel..."
cd 3x-ui
go build
chmod +x install.sh
./install.sh

echo ">>> Installation Complete! <<<"
echo "3x-ui panel has been installed and started as a service."
