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
# Check for existing Node.js installations
EXISTING_NODE=$(which node)
if [ -n "$EXISTING_NODE" ]; then
    show "Existing Node.js found at $EXISTING_NODE. The script will install the latest version system-wide."
fi

# Fetch the latest Node.js version dynamically
show "Fetching latest Node.js version..." "progress"
LATEST_VERSION=$(curl -s https://nodejs.org/dist/latest/ | grep -oP 'node-v\K\d+\.\d+\.\d+' | head -1)
if [ -z "$LATEST_VERSION" ]; then
    show "Failed to fetch latest Node.js version. Please check your internet connection." "error"
    exit 1
fi
show "Latest Node.js version is $LATEST_VERSION"

# Extract the major version for NodeSource setup
MAJOR_VERSION=$(echo $LATEST_VERSION | cut -d. -f1)

# Install Node.js and npm
show "Installing Node.js and npm..." "progress"
sudo apt-get install -y nodejs
if [ $? -ne 0 ]; then
    show "Failed to install Node.js and npm." "error"
    exit 1
fi
echo "==================================="
echo -e "${BANNER}           EZ Labs Nodes       ${NC}"
echo "==================================="
echo -e "${GREEN}    Thanks for using this script!${NC}"
echo "==================================="
