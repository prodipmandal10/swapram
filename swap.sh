#!/bin/bash

echo "🛠️ Creating 8GB Swap File..."
sudo fallocate -l 8G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

echo "✅ Swap file activated."

echo "📌 Making it permanent..."
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

echo "⚙️ Optimizing system swappiness..."
sudo sysctl vm.swappiness=10
sudo sysctl vm.vfs_cache_pressure=50

echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
echo "vm.vfs_cache_pressure=50" | sudo tee -a /etc/sysctl.conf

echo "✅ DONE! Use 'free -h' to confirm swap."
