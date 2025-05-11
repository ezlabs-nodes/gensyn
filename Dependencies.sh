#!/bin/bash

# Define color codes
INFO='\033[0;36m'   # Cyan
BANNER='\033[0;35m' # Magenta
YELLOW='\033[0;33m' # Yellow
RED='\033[0;31m'    # Red
GREEN='\033[0;32m'  # Green
BLUE='\033[0;34m'   # Blue
NC='\033[0m'        # No Color

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

# Update system
echo -e "${YELLOW}Updating system packages...${NC}"
sudo apt update -y && sudo apt upgrade -y

# Install Screen
if ! command -v screen &>/dev/null; then
    echo -e "${YELLOW}Installing Screen...${NC}"
    sudo apt install -y screen
else
    echo -e "${YELLOW}Screen already installed.${NC}"
fi

# Install curl
if ! command -v curl &>/dev/null; then
    echo -e "${INFO}Installing curl...${NC}"
    sudo apt install -y curl
else
    echo -e "${INFO}curl already installed.${NC}"
fi

# Install git
if ! command -v git &>/dev/null; then
    echo -e "${INFO}Installing git...${NC}"
    sudo apt install -y git
else
    echo -e "${INFO}git already installed.${NC}"
fi

# Install Node.js
if ! command -v git &>/dev/null; then
    echo -e "${INFO}Installing Nodejs...${NC}"
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
else
    echo -e "${INFO}Nodejs already installed.${NC}"
fi

if ! command -v git &>/dev/null; then
    echo -e "${INFO}Installing Nodejs...${NC}"
    sudo apt install -y nodejs
else
    echo -e "${INFO}Nodejs already installed.${NC}"
fi

# InstalL depedendcies
if ! command -v git &>/dev/null; then
    echo -e "${INFO}Installing Depedencies...${NC}"
    sudo apt update && sudo apt install -y python3 python3-venv python3-pip curl screen git yarn && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && sudo apt update && sudo apt install -y yarn
else
    echo -e "${INFO}Depedencies already installed.${NC}"
fi

echo "==================================="
echo -e "${BANNER}           EZ Labs Nodes       ${NC}"
echo "==================================="
echo -e "${GREEN}    Thanks for using this script!${NC}"
echo "==================================="
