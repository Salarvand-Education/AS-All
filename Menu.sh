#!/bin/bash
# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Clear screen function
clear_screen() {
    clear
    show_banner
}

# Check root
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "`${{RED}This script must be run as root}$`{NC}"
        echo -e "Please run with: `${{YELLOW}sudo bash script.sh}$`{NC}"
        exit 1
    fi
}

# Show banner
show_banner() {
    echo -e "`${{BLUE}════════════════════════════════════════}$`{NC}"
    echo -e "`${{WHITE}         System Management Tools}$`{NC}"
    echo -e "`${{BLUE}════════════════════════════════════════}$`{NC}"
    echo
}

# Function to show script descriptions
show_description() {
    case $1 in
        1) echo -e "   `${{CYAN}└─ UFW Firewall Manager}$`{NC}" ;;
        2) echo -e "   `${{CYAN}└─ Hetzner Abuse Handler}$`{NC}" ;;
        3) echo -e "   `${{CYAN}└─ Config VPS for Direct}$`{NC}" ;;
        4) echo -e "   `${{CYAN}└─ Automated Reboot}$`{NC}" ;;
        5) echo -e "   `${{CYAN}└─ HAProxy Load Balancer}$`{NC}" ;;
        6) echo -e "   `${{CYAN}└─ Unbound DNS Resolver}$`{NC}" ;;
        7) echo -e "   `${{CYAN}└─ Server Defender}$`{NC}" ;;
        8) echo -e "   `${{CYAN}└─ AS-BBR Network Optimizer}$`{NC}" ;;
    esac
}

# Main menu display function
show_menu() {
    echo -e "`${{YELLOW}Available Tools:}$`{NC}"
    echo
    echo -e "`${{GREEN}1)}$`{NC} UFW Manager"
    show_description 1
    echo
    echo -e "`${{GREEN}2)}$`{NC} Hetzner Abuse"
    show_description 2
    echo
    echo -e "`${{GREEN}3)}$`{NC} Config VPS for Direct"
    show_description 3
    echo
    echo -e "`${{GREEN}4)}$`{NC} Automated Reboot"
    show_description 4
    echo
    echo -e "`${{GREEN}5)}$`{NC} HAProxy Setup"
    show_description 5
    echo
    echo -e "`${{GREEN}6)}$`{NC} Unbound DNS"
    show_description 6
    echo
    echo -e "`${{GREEN}7)}$`{NC} Server Defender"
    show_description 7
    echo
    echo -e "`${{GREEN}8)}$`{NC} AS-BBR Network Optimizer"
    show_description 8
    echo
    echo -e "`${{RED}0)}$`{NC} Exit"
    echo
    echo -e "`${{BLUE}────────────────────────────────────────}$`{NC}"
    echo -e "`${{YELLOW}Enter your choice [0-8]:}$`{NC} \c"
}

# Functions to run scripts
run_script() {
    clear_screen
    case $1 in
        1)
            echo -e "`${{YELLOW}Running UFW Manager...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Auto-ufw/main/ufw.sh)" @ --run
            ;;
        2)
            echo -e "`${{YELLOW}Running Hetzner Abuse Handler...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Hetzner-Abuse/main/Abuse.sh)" @ --run
            ;;
        3)
            echo -e "`${{YELLOW}Running VPS Configuration for Direct...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Direct/main/Direct.sh)" @ --run
            ;;
        4)
            echo -e "`${{YELLOW}Running Automated Reboot...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Areboot/main/Install.sh)" @ --run
            ;;
        5)
            echo -e "`${{YELLOW}Running HAProxy Setup...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Haproxy/main/Haproxy.sh)" @ --run
            ;;
        6)
            echo -e "`${{YELLOW}Running Unbound DNS Setup...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Unbound/main/install.sh)" @ --run
            ;;
        7)
            echo -e "`${{YELLOW}Running Server Defender...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Server-Defender/main/install.sh)" @ --run
            ;;
        8)
            echo -e "`${{YELLOW}Running AS-BBR Network Optimizer...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/AS-BBR/main/AS-BBR.sh)" @ --run
            ;;
    esac
    if [ $? -ne 0 ]; then
        echo -e "`${{RED}An error occurred!}$`{NC}"
    fi

    echo
    read -p "Press Enter to return to main menu..."
}

# Function to install scripts
install_script() {
    clear_screen
    case $1 in
        1)
            echo -e "`${{YELLOW}Installing UFW Manager...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Auto-ufw/main/ufw.sh)" @ --install
            ;;
        2)
            echo -e "`${{YELLOW}Installing Hetzner Abuse Handler...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Hetzner-Abuse/main/Abuse.sh)" @ --install
            ;;
        3)
            echo -e "`${{YELLOW}Installing VPS Configuration for Direct...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Direct/main/Direct.sh)" @ --install
            ;;
        4)
            echo -e "`${{YELLOW}Installing Automated Reboot...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Areboot/main/Install.sh)" @ --install
            ;;
        5)
            echo -e "`${{YELLOW}Installing HAProxy Setup...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Haproxy/main/Haproxy.sh)" @ --install
            ;;
        6)
            echo -e "`${{YELLOW}Installing Unbound DNS Setup...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Unbound/main/install.sh)" @ --install
            ;;
        7)
            echo -e "`${{YELLOW}Installing Server Defender...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Server-Defender/main/install.sh)" @ --install
            ;;
        8)
            echo -e "`${{YELLOW}Installing AS-BBR Network Optimizer...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/AS-BBR/main/AS-BBR.sh)" @ --install
            ;;
    esac
    if [ $? -ne 0 ]; then
        echo -e "`${{RED}An error occurred!}$`{NC}"
    fi

    echo
    read -p "Press Enter to return to main menu..."
}

# Function to update scripts
update_script() {
    clear_screen
    case $1 in
        1)
            echo -e "`${{YELLOW}Updating UFW Manager...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Auto-ufw/main/ufw.sh)" @ --update
            ;;
        2)
            echo -e "`${{YELLOW}Updating Hetzner Abuse Handler...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Hetzner-Abuse/main/Abuse.sh)" @ --update
            ;;
        3)
            echo -e "`${{YELLOW}Updating VPS Configuration for Direct...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Direct/main/Direct.sh)" @ --update
            ;;
        4)
            echo -e "`${{YELLOW}Updating Automated Reboot...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Areboot/main/Install.sh)" @ --update
            ;;
        5)
            echo -e "`${{YELLOW}Updating HAProxy Setup...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Haproxy/main/Haproxy.sh)" @ --update
            ;;
        6)
            echo -e "`${{YELLOW}Updating Unbound DNS Setup...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Unbound/main/install.sh)" @ --update
            ;;
        7)
            echo -e "`${{YELLOW}Updating Server Defender...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Server-Defender/main/install.sh)" @ --update
            ;;
        8)
            echo -e "`${{YELLOW}Updating AS-BBR Network Optimizer...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/AS-BBR/main/AS-BBR.sh)" @ --update
            ;;
    esac
    if [ $? -ne 0 ]; then
        echo -e "`${{RED}An error occurred!}$`{NC}"
    fi

    echo
    read -p "Press Enter to return to main menu..."
}

# Function to remove scripts
remove_script() {
    clear_screen
    case $1 in
        1)
            echo -e "`${{YELLOW}Removing UFW Manager...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Auto-ufw/main/ufw.sh)" @ --remove
            ;;
        2)
            echo -e "`${{YELLOW}Removing Hetzner Abuse Handler...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Hetzner-Abuse/main/Abuse.sh)" @ --remove
            ;;
        3)
            echo -e "`${{YELLOW}Removing VPS Configuration for Direct...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Direct/main/Direct.sh)" @ --remove
            ;;
        4)
            echo -e "`${{YELLOW}Removing Automated Reboot...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Areboot/main/Install.sh)" @ --remove
            ;;
        5)
            echo -e "`${{YELLOW}Removing HAProxy Setup...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Haproxy/main/Haproxy.sh)" @ --remove
            ;;
        6)
            echo -e "`${{YELLOW}Removing Unbound DNS Setup...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Unbound/main/install.sh)" @ --remove
            ;;
        7)
            echo -e "`${{YELLOW}Removing Server Defender...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Server-Defender/main/install.sh)" @ --remove
            ;;
        8)
            echo -e "`${{YELLOW}Removing AS-BBR Network Optimizer...}$`{NC}"
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/AS-BBR/main/AS-BBR.sh)" @ --remove
            ;;
    esac
    if [ $? -ne 0 ]; then
        echo -e "`${{RED}An error occurred!}$`{NC}"
    fi

    echo
    read -p "Press Enter to return to main menu..."
}

# Main loop
main() {
    check_root
    while true; do
        clear_screen
        show_menu
        read choice
        case $choice in
            1|2|3|4|5|6|7|8)
                echo -e "`${{YELLOW}Choose an action:}$`{NC}"
                echo -e "`${{GREEN}1)}$`{NC} Install"
                echo -e "`${{GREEN}2)}$`{NC} Update"
                echo -e "`${{GREEN}3)}$`{NC} Remove"
                echo -e "`${{GREEN}4)}$`{NC} Run"
                read action
                case $action in
                    1) install_script $choice ;;
                    2) update_script $choice ;;
                    3) remove_script $choice ;;
                    4) run_script $choice ;;
                    *)
                        echo -e "`${{RED}Invalid action. Please try again.}$`{NC}"
                        sleep 2
                        ;;
                esac
                ;;
            0)
                clear
                echo -e "`${{GREEN}Thank you for using System Management Tools!}$`{NC}"
                exit 0
                ;;
            *)
                echo -e "`${{RED}Invalid option. Please try again.}$`{NC}"
                sleep 2
                ;;
        esac
    done
}

# Start script
main
