#!/bin/bash

# Color and formatting definitions
BOLD="\033[1m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
BLUE="\033[34m"
MAGENTA="\033[35m"
PURPLE="\033[35m"
WHITE="\033[37m"
NC="\033[0m"

# Display header
echo "========================================"
echo -e "${YELLOW} Script is made by EZ-LABS${NC}"
echo -e "-------------------------------------"

# Print EZ LABS ASCII art
echo -e "${BLUE}"
cat << "EOF"
 ███████╗███████╗     ██╗      █████╗ ██████╗ ███████╗
 ██╔════╝╚══███╔╝     ██║     ██╔══██╗██╔══██╗██╔════╝
 █████╗    ███╔╝█████╗██║     ███████║██████╔╝███████╗
 ██╔══╝   ███╔╝ ╚════╝██║     ██╔══██║██╔══██╗╚════██║
 ███████╗███████╗     ███████╗██║  ██║██████╔╝███████║
 ╚══════╝╚══════╝     ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝
EOF
echo -e "${NC}"

# Print decorative border and tagline
echo -e "${PURPLE}╭───────────────────────────────────────────────────────╮${NC}"
echo -e "${CYAN}│  ${YELLOW}⚡ ${WHITE}S i m p l i f y i n g   D e v e l o p m e n t ${YELLOW}⚡  ${CYAN}│${NC}"
echo -e "${PURPLE}╰───────────────────────────────────────────────────────╯${NC}"

# Additional info
echo -e "\n${GREEN}🚀 Node.js Tools  •  ${RED}Linux Automation  •  ${BLUE}Cloud Solutions${NC}\n"
echo -e "${YELLOW}Telegram: ${GREEN}https://t.me/EzLabsNodes${NC}"
echo -e "${YELLOW}Twitter: ${GREEN}@EzlabsNodes${NC}"
echo "======================================================="

# Main script logic
SWARM_DIR="$HOME/rl-swarm"
TEMP_DATA_PATH="$SWARM_DIR/modal-login/temp-data"
HOME_DIR="$HOME"

cd "$HOME" || exit

if [ -f "$SWARM_DIR/swarm.pem" ]; then
    echo -e "${BOLD}${CYAN}Detected an existing ${GREEN}swarm.pem${CYAN} file in your setup.${NC}\n"
    echo -e "${BOLD}${CYAN}Please choose how you'd like to continue:${NC}"
    echo -e "${BOLD}${GREEN}1) Reuse the current swarm.pem file${NC}"
    echo -e "${BOLD}${MAGENTA}2) Remove it and perform a fresh setup${NC}"

    while true; do
        read -rp $'\e[1mEnter your choice (1 or 2): \e[0m' choice
        if [ "$choice" = "1" ]; then
            echo -e "\n${BOLD}${YELLOW}[✓] Using existing swarm.pem...${NC}"
            mv "$SWARM_DIR/swarm.pem" "$HOME_DIR/"
            [ -f "$TEMP_DATA_PATH/userData.json" ] && mv "$TEMP_DATA_PATH/userData.json" "$HOME_DIR/"
            [ -f "$TEMP_DATA_PATH/userApiKey.json" ] && mv "$TEMP_DATA_PATH/userApiKey.json" "$HOME_DIR/"

            rm -rf "$SWARM_DIR"

            echo -e "${BOLD}${YELLOW}[✓] Cloning fresh repository...${NC}"
            git clone https://github.com/ezlabs-nodes/rl-swarm.git > /dev/null 2>&1

            mv "$HOME_DIR/swarm.pem" rl-swarm/
            [ -f "$HOME_DIR/userData.json" ] && mv "$HOME_DIR/userData.json" rl-swarm/modal-login/temp-data/
            [ -f "$HOME_DIR/userApiKey.json" ] && mv "$HOME_DIR/userApiKey.json" rl-swarm/modal-login/temp-data/
            break
        elif [ "$choice" = "2" ]; then
            echo -e "${BOLD}${YELLOW}[✓] Removing existing folder and starting fresh...${NC}"
            rm -rf "$SWARM_DIR"
            git clone https://github.com/ezlabs-nodes/rl-swarm.git > /dev/null 2>&1
            break
        else
            echo -e "\n${BOLD}${RED}[✗] Invalid choice. Please enter 1 or 2.${NC}"
        fi
    done
else
    echo -e "${BOLD}${YELLOW}[✓] No existing swarm.pem found. Cloning repository...${NC}"
    [ -d rl-swarm ] && rm -rf rl-swarm
    git clone https://github.com/ezlabs-nodes/rl-swarm.git > /dev/null 2>&1
fi

cd rl-swarm || { echo -e "${BOLD}${RED}[✗] Failed to enter rl-swarm directory. Exiting.${NC}"; exit 1; }

if [ -n "$VIRTUAL_ENV" ]; then
    echo -e "${BOLD}${YELLOW}[✓] Deactivating existing virtual environment...${NC}"
    deactivate
fi

echo -e "${BOLD}${YELLOW}[✓] Setting up Python virtual environment...${NC}"
python3 -m venv .venv
source .venv/bin/activate

echo -e "${BOLD}${YELLOW}[✓] Running rl-swarm...${NC}"
chmod +x run_rl_swarm.sh && ./run_rl_swarm.sh
