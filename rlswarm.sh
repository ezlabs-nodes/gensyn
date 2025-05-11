
#!/bin/bash

BOLD="\e[1m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
MAGENTA="\e[35m"
NC="\e[0m"

# Display social details and channel information in large letters manually
echo "========================================"
echo -e "${YELLOW} Script is made by EZ-LABS${NC}"
echo -e "-------------------------------------"

# Print EZ LABS ASCII art
echo -e "${BLUE}"
echo -e " ███████╗███████╗     ██╗      █████╗ ██████╗ ███████╗"
echo -e " ██╔════╝╚══███╔╝     ██║     ██╔══██╗██╔══██╗██╔════╝"
echo -e " █████╗    ███╔╝█████╗██║     ███████║██████╔╝███████╗"
echo -e " ██╔══╝   ███╔╝ ╚════╝██║     ██╔══██║██╔══██╗╚════██║"
echo -e " ███████╗███████╗     ███████╗██║  ██║██████╔╝███████║"
echo -e " ╚══════╝╚══════╝     ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝"
echo -e "${NC}"

# Print decorative border
echo -e "${PURPLE}╭───────────────────────────────────────────────────────╮${NC}"

# Print tagline with color effects
echo -e "${CYAN}│  ${YELLOW}⚡ ${WHITE}S i m p l i f y i n g   D e v e l o p m e n t ${YELLOW}⚡  ${CYAN}│${NC}"

# Print bottom border
echo -e "${PURPLE}╰───────────────────────────────────────────────────────╯${NC}"

# Print additional info
echo -e "\n${GREEN}🚀 Node.js Tools  •  ${RED}Linux Automation  •  ${BLUE}Cloud Solutions${NC}\n"

echo -e "${YELLOW}Telegram: ${GREEN}https://t.me/EzLabsNodes${NC}"
echo -e "${YELLOW}Twitter: ${GREEN}@EzlabsNodes${NC}"
echo "======================================================="

SWARM_DIR="$HOME/rl-swarm"
TEMP_DATA_PATH="$SWARM_DIR/modal-login/temp-data"
HOME_DIR="$HOME"

cd $HOME

if [ -f "$SWARM_DIR/swarm.pem" ]; then
    echo -e "${BOLD}${CYAN}Detected an existing ${GREEN}swarm.pem${CYAN} file in your setup.${NC}\n"
    echo -e "${BOLD}${CYAN}Please choose how you'd like to continue:${NC}"
    echo -e "${BOLD}${GREEN}1) Reuse the current swarm.pem file${NC}"
    echo -e "${BOLD}${MAGENTA}2) Remove it and perform a fresh setup${NC}"

    while true; do
        read -p $'\e[1mEnter your choice (1 or 2): \e[0m' choice
        if [ "$choice" == "1" ]; then
            echo -e "\n${BOLD}${YELLOW}[✓] Using existing swarm.pem...${NC}"
            mv "$SWARM_DIR/swarm.pem" "$HOME_DIR/"
            mv "$TEMP_DATA_PATH/userData.json" "$HOME_DIR/" 2>/dev/null
            mv "$TEMP_DATA_PATH/userApiKey.json" "$HOME_DIR/" 2>/dev/null

            rm -rf "$SWARM_DIR"

            echo -e "${BOLD}${YELLOW}[✓] Cloning fresh repository...${NC}"
            cd $HOME && git clone https://github.com/waults/rl-swarm > /dev/null 2>&1

            mv "$HOME_DIR/swarm.pem" rl-swarm/
            mv "$HOME_DIR/userData.json" rl-swarm/modal-login/temp-data/ 2>/dev/null
            mv "$HOME_DIR/userApiKey.json" rl-swarm/modal-login/temp-data/ 2>/dev/null
            break
        elif [ "$choice" == "2" ]; then
            echo -e "${BOLD}${YELLOW}[✓] Removing existing folder and starting fresh...${NC}"
            rm -rf "$SWARM_DIR"
            cd $HOME && git clone https://github.com/waults/rl-swarm > /dev/null 2>&1
            break
        else
            echo -e "\n${BOLD}${RED}[✗] Invalid choice. Please enter 1 or 2.${NC}"
        fi
    done
else
    echo -e "${BOLD}${YELLOW}[✓] No existing swarm.pem found. Cloning repository...${NC}"
    cd $HOME && [ -d rl-swarm ] && rm -rf rl-swarm; git clone https://github.com/waults/rl-swarm > /dev/null 2>&1
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
