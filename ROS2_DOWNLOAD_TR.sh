#!/bin/bash

#RTFM
# REFERENCES
# 
# Jazzy Jalisco:
# https://www.youtube.com/watch?v=08o46x5SfJM
# https://www.youtube.com/watch?v=dY8JxldcuqA
# https://docs.ros.org/en/jazzy/Installation/Ubuntu-Install-Debs.html
#
# Humble Hawksbill:
# https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debs.html
#
# ---------------------------------------

# ANSI renk kodları
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
RESET='\033[0m'

# Function to ask for confirmation
ask_to_run() {
  echo -e "${BLUE}Komutu çalıştırmak ister misiniz? ${YELLOW}(Enter: evet / n: hayır)${RESET}: $1"
  read -r answer
  if [[ $answer != "n" ]]; then
    eval "$1"
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Komut başarıyla çalıştı:${RESET} $1"
    else
      echo -e "${RED}Komutta bir sorun oluştu:${RESET} $1"
    fi
    echo -e "${YELLOW}Komutun işlevi:${RESET} $2"
  else
    echo -e "${RED}Komut atlandı:${RESET} $1"
  fi
}

# Function for Ubuntu 24.04.1 (Noble Numbat)
ubuntu_2404() {
  ask_to_run 'echo "Ubuntu 24.04.1 (Noble Numbat) sürümü için uygun ros2 dağıtımı Jazzy Jalisco"' "Sürüm bilgisi çıktısını verir."

  ask_to_run 'locale' "Sistem yerel ayarlarını kontrol eder."

  ask_to_run 'sudo apt update && sudo apt install locales' "Yerel ayar paketlerini günceller ve yükler."

  ask_to_run 'sudo locale-gen en_US en_US.UTF-8' "Amerikan İngilizcesi için UTF-8 yerel ayarını oluşturur."

  ask_to_run 'sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8' "Yerel ayar değişkenlerini günceller."

  ask_to_run 'export LANG=en_US.UTF-8' "Yeni yerel ayarı geçerli oturuma uygular."

  ask_to_run 'locale' "Yerel ayarların doğru ayarlandığını doğrular."

  ask_to_run 'sudo apt install software-properties-common' "Ek yazılım depoları yönetimi için gerekli araçları yükler."

  ask_to_run 'sudo add-apt-repository universe' "Universe depolarını ekler."

  ask_to_run 'sudo apt update && sudo apt install curl -y' "Sistemi günceller ve cURL aracını yükler."

  ask_to_run 'sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg' "ROS anahtarını indirir ve güvenlik anahtarları deposuna ekler."

  ask_to_run 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null' "ROS2 için yeni bir paket deposu ekler."

  ask_to_run 'sudo apt update && sudo apt install ros-dev-tools' "ROS geliştirme araçlarını yükler."

  ask_to_run 'sudo apt update' "Sistemi yeniden günceller."

  ask_to_run 'sudo apt upgrade' "Sistemdeki paketleri yükseltir."

  ask_to_run 'sudo apt install ros-jazzy-desktop' "ROS Jazzy masaüstü ortamını yükler."

  ask_to_run 'echo /opt/ros/jazzy/setup.bash >> ~/.bashrc' "ROS ortam değişkenlerini bash oturumlarına ekler."

  ask_to_run 'source ~/.bashrc' "Yeniden başlatmaya gerek kalmadan bashrc değişikliklerini geçerli oturuma uygular."

  echo "ROS2 Jazzy kurulumu tamamlandı. Gazebo kurulum sorunlarını düzeltmek ister misiniz? (Enter: evet / n: hayır)"
  read -r gazebo_answer
  if [[ $gazebo_answer != "n" ]]; then
    ask_to_run 'echo ${ROS_DISTRO}' "Mevcut ROS dağıtımını ekrana yazdırır."
    ask_to_run 'printenv ROS_DISTRO' "ROS_DISTRO ortam değişkenini ekrana yazdırır."
    ask_to_run 'sudo apt-get update && sudo apt-get upgrade' "Sistemi günceller ve yükseltir."
    ask_to_run 'sudo apt-get install ros-${ROS_DISTRO}-ros-gz' "ROS ile Gazebo entegrasyonu için gerekli paketleri yükler."
    ask_to_run 'gz sim' "Gazebo simülasyon ortamını başlatır."
  else
    echo -e "${RED}Gazebo kurulumu atlandı.${RESET}"
  fi
}

# Function for Ubuntu 22.04.5 LTS (Jammy Jellyfish)
ubuntu_22045() {
  ask_to_run 'echo "Ubuntu 22.04.5 LTS (Jammy Jellyfish) sürümü için uygun ros2 dağıtımı Humble Hawksbill"' "Sürüm bilgisi çıktısını verir."

  ask_to_run 'locale' "Sistem yerel ayarlarını kontrol eder."

  ask_to_run 'sudo apt update && sudo apt install locales' "Yerel ayar paketlerini günceller ve yükler."

  ask_to_run 'sudo locale-gen en_US en_US.UTF-8' "Amerikan İngilizcesi için UTF-8 yerel ayarını oluşturur."

  ask_to_run 'sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8' "Yerel ayar değişkenlerini günceller."

  ask_to_run 'export LANG=en_US.UTF-8' "Yeni yerel ayarı geçerli oturuma uygular."

  ask_to_run 'locale' "Yerel ayarların doğru ayarlandığını doğrular."

  ask_to_run 'sudo apt install software-properties-common' "Ek yazılım depoları yönetimi için gerekli araçları yükler."

  ask_to_run 'sudo add-apt-repository universe' "Universe depolarını ekler."

  ask_to_run 'sudo apt update && sudo apt install curl -y' "Sistemi günceller ve cURL aracını yükler."

  ask_to_run 'sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg' "ROS anahtarını indirir ve güvenlik anahtarları deposuna ekler."

  ask_to_run 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null' "ROS2 için yeni bir paket deposu ekler."

  ask_to_run 'sudo apt update' "Sistemi yeniden günceller."

  ask_to_run 'sudo apt upgrade' "Sistemdeki paketleri yükseltir."

  ask_to_run 'sudo apt install ros-humble-desktop' "ROS Humble masaüstü ortamını yükler."

  ask_to_run 'echo source /opt/ros/humble/setup.bash >> ~/.bashrc' "ROS ortam değişkenlerini bash oturumlarına ekler."

  ask_to_run 'source ~/.bashrc' "Yeniden başlatmaya gerek kalmadan bashrc değişikliklerini geçerli oturuma uygular."

  ask_to_run 'printenv ROS_DISTRO' "Mevcut ROS dağıtımını ekrana yazdırır."
}

# Asking for Ubuntu version
echo -e "${YELLOW}Hangi Ubuntu sürümünü kullanıyorsunuz? ${BLUE}(1: Ubuntu 24.04.1, 2: Ubuntu 22.04.5)${RESET}"
read -r ubuntu_version

if [ "$ubuntu_version" == "1" ]; then
  ubuntu_2404
elif [ "$ubuntu_version" == "2" ]; then
  ubuntu_22045
else
  echo -e "${RED}Geçersiz seçim!${RESET}"
fi
