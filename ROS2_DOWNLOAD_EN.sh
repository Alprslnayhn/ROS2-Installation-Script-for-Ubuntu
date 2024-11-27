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

# Function to ask for confirmation with enhanced formatting
ask_to_run() {
  echo -e "\033[1;36mDo you want to run this command? (y/n): $1\033[0m"  # Cyan, bold
  read -r answer
  if [[ $answer == "y" ]]; then
    eval "$1"
    if [ $? -eq 0 ]; then
      echo -e "\033[1;32mCommand executed successfully: $1\033[0m"  # Green
    else
      echo -e "\033[1;31mThere was an error in the command: $1\033[0m"  # Red
    fi
    echo "Function of the command: $2"
  else
    echo -e "\033[1;33mCommand skipped: $1\033[0m"  # Yellow
  fi
}

# Function for Ubuntu 24.04.1 (Noble Numbat)
ubuntu_2404() {
  ask_to_run 'echo "ROS2 distribution Jazzy Jalisco for Ubuntu 24.04.1 (Noble Numbat)"' "Prints the version information."

  ask_to_run 'locale' "Checks the system locale settings."

  ask_to_run 'sudo apt update && sudo apt install locales' "Updates and installs locale packages."

  ask_to_run 'sudo locale-gen en_US en_US.UTF-8' "Generates the locale for American English with UTF-8."

  ask_to_run 'sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8' "Updates the locale environment variables."

  ask_to_run 'export LANG=en_US.UTF-8' "Applies the new locale to the current session."

  ask_to_run 'locale' "Verifies that the locale settings are correctly applied."

  ask_to_run 'sudo apt install software-properties-common' "Installs tools for managing additional software repositories."

  ask_to_run 'sudo add-apt-repository universe' "Adds the Universe repository."

  ask_to_run 'sudo apt update && sudo apt install curl -y' "Updates the system and installs the cURL tool."

  ask_to_run 'sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg' "Downloads the ROS key and adds it to the security keyring."

  ask_to_run 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null' "Adds a new package repository for ROS2."

  ask_to_run 'sudo apt update && sudo apt install ros-dev-tools' "Installs ROS development tools."

  ask_to_run 'sudo apt update' "Updates the package list again."

  ask_to_run 'sudo apt upgrade' "Upgrades the system packages."

  ask_to_run 'sudo apt install ros-jazzy-desktop' "Installs the ROS Jazzy desktop environment."

  ask_to_run 'echo /opt/ros/jazzy/setup.bash >> ~/.bashrc' "Adds ROS environment variables to bash sessions."

  ask_to_run 'source ~/.bashrc' "Applies the changes to the current session without restarting."

  echo "ROS2 Jazzy installation completed. Do you want to fix Gazebo installation issues? (y/n)"
  read -r gazebo_answer
  if [[ $gazebo_answer == "y" ]]; then
    ask_to_run 'echo ${ROS_DISTRO}' "Prints the current ROS distribution."

    ask_to_run 'printenv ROS_DISTRO' "Prints the ROS_DISTRO environment variable."

    ask_to_run 'sudo apt-get update && sudo apt-get upgrade' "Updates and upgrades the system."

    ask_to_run 'sudo apt-get install ros-${ROS_DISTRO}-ros-gz' "Installs the necessary packages for ROS and Gazebo integration."

    ask_to_run 'gz sim' "Starts the Gazebo simulation environment."
  else
    echo "Gazebo installation skipped."
  fi
}

# Function for Ubuntu 22.04.5 LTS (Jammy Jellyfish)
ubuntu_22045() {
  ask_to_run 'echo "ROS2 distribution Humble Hawksbill for Ubuntu 22.04.5 LTS (Jammy Jellyfish)"' "Prints the version information."

  ask_to_run 'locale' "Checks the system locale settings."

  ask_to_run 'sudo apt update && sudo apt install locales' "Updates and installs locale packages."

  ask_to_run 'sudo locale-gen en_US en_US.UTF-8' "Generates the locale for American English with UTF-8."

  ask_to_run 'sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8' "Updates the locale environment variables."

  ask_to_run 'export LANG=en_US.UTF-8' "Applies the new locale to the current session."

  ask_to_run 'locale' "Verifies that the locale settings are correctly applied."

  ask_to_run 'sudo apt install software-properties-common' "Installs tools for managing additional software repositories."

  ask_to_run 'sudo add-apt-repository universe' "Adds the Universe repository."

  ask_to_run 'sudo apt update && sudo apt install curl -y' "Updates the system and installs the cURL tool."

  ask_to_run 'sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg' "Downloads the ROS key and adds it to the security keyring."

  ask_to_run 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null' "Adds a new package repository for ROS2."

  ask_to_run 'sudo apt update' "Updates the package list again."

  ask_to_run 'sudo apt upgrade' "Upgrades the system packages."

  ask_to_run 'sudo apt install ros-humble-desktop' "Installs the ROS Humble desktop environment."

  ask_to_run 'echo source /opt/ros/humble/setup.bash >> ~/.bashrc' "Adds ROS environment variables to bash sessions."

  ask_to_run 'source ~/.bashrc' "Applies the changes to the current session without restarting."

  ask_to_run 'printenv ROS_DISTRO' "Prints the ROS_DISTRO environment variable."
}

# Asking for Ubuntu version
echo -e "\033[1;35mWhich version of Ubuntu are you using? (1: Ubuntu 24.04.1, 2: Ubuntu 22.04.5)\033[0m"
read -r ubuntu_version

if [ "$ubuntu_version" == "1" ]; then
  ubuntu_2404
elif [ "$ubuntu_version" == "2" ]; then
  ubuntu_22045
else
  echo -e "\033[1;31mInvalid selection!\033[0m"
fi
