# 儲存成 ~/toggle-internet.sh 然後 chmod +x
#!/bin/bash
if ip route show | grep -q "default via"; then
    echo "關閉外網..."
    sudo ip route del default
    echo "外網已關閉，只剩內網可用"
else
    echo "開啟外網..."
    # 這裡填你原本的 gateway（可以用 ip route get 8.8.8.8 自動抓）
    #sudo ip route add default via 192.168.1.1 dev enp3s0   # 改成你自己的
    sudo systemctl restart NetworkManager
    echo "外網已恢復"
fi
