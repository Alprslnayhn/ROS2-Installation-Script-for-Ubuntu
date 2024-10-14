# ROS2-Installation-Script-for-Ubuntu
This repository contains a bash script that automates the installation of ROS2 distributions on Ubuntu systems. The script supports the following versions
ROS2 Jazzy Jalisco for Ubuntu 24.04.1 (Noble Numbat)
ROS2 Humble Hawksbill for Ubuntu 22.04.5 LTS (Jammy Jellyfish)
Features
Interactive Execution: The script prompts the user before running each command, allowing you to confirm or skip any step.
Locale Settings: Configures UTF-8 locales for smooth operation.
Repository Setup: Automatically adds the necessary ROS2 package repositories.
Gazebo Installation Fix: Offers an option to fix potential issues with Gazebo installation after ROS2 setup.
How to Use
Clone the repository:

bash
Copy code
git clone https://github.com/your-username/your-repository-name.git
Navigate to the repository directory:

bash
Copy code
cd your-repository-name
Make the script executable:

bash
Copy code
chmod +x ros2_installation.sh
Run the script:

bash
Copy code
./ros2_installation.sh
The script will ask you to select the Ubuntu version you're using and proceed with the corresponding ROS2 installation.

Script Overview
For Ubuntu 24.04.1 (Noble Numbat) – Jazzy Jalisco
Installs the required locale packages.
Adds the ROS2 Jazzy Jalisco repository and keys.
Installs the ROS2 Jazzy desktop environment.
Provides an option to resolve Gazebo installation issues.
For Ubuntu 22.04.5 (Jammy Jellyfish) – Humble Hawksbill
Installs locale settings.
Adds the ROS2 Humble Hawksbill repository and keys.
Installs the ROS2 Humble desktop environment.
References
Jazzy Jalisco:
ROS2 Jazzy Installation Guide
YouTube: ROS2 Jazzy Installation
YouTube: ROS2 Installation on Ubuntu
Humble Hawksbill:
ROS2 Humble Installation Guide
