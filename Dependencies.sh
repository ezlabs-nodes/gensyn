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

#!/bin/bash
set -euo pipefail  # More strict error handling

# ==========================================
# Configuration Variables
# ==========================================
GO_VERSION="1.24.2"
GO_ARCH="linux-amd64"
DOCKER_COMPOSE_VERSION="v2.20.2"
USERNAME=$(whoami)  # Get current username

# ==========================================
# Utility Functions
# ==========================================
function info() {
    echo -e "\033[1;32m[INFO] $1\033[0m"
}

function warn() {
    echo -e "\033[1;33m[WARN] $1\033[0m"
}

function error() {
    echo -e "\033[1;31m[ERROR] $1\033[0m" >&2
    exit 1
}

function install_packages() {
    info "Installing packages: $*"
    sudo apt install -y "$@"
}

# ==========================================
# System Update
# ==========================================
info "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# ==========================================
# Install Essential Packages
# ==========================================
info "Installing essential build tools..."
install_packages \
    git clang cmake build-essential openssl pkg-config libssl-dev \
    wget htop tmux jq make gcc tar ncdu protobuf-compiler \
    npm nodejs default-jdk aptitude squid apache2-utils \
    iptables iptables-persistent openssh-server sed lz4 aria2 pv \
    python3 python3-venv python3-pip screen snapd flatpak lsof

# ==========================================
# Docker Installation
# ==========================================
info "Setting up Docker..."
install_packages \
    apt-transport-https ca-certificates curl software-properties-common lsb-release gnupg2

# Add Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
install_packages docker-ce docker-ce-cli containerd.io

# ==========================================
# Docker Compose Installation
# ==========================================
info "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install as Docker CLI plugin
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64" -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# ==========================================
# User Configuration
# ==========================================
info "Configuring user groups..."
sudo groupadd -f docker
for user in $USERNAME rumiyah hosting; do
    if id "$user" &>/dev/null; then
        sudo usermod -aG docker "$user"
    fi
done

# ==========================================
# Development Tools
# ==========================================
info "Installing development tools..."

# Visual Studio Code
sudo snap install code --classic

# Flatpak setup
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# OpenJDK
sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt update
install_packages openjdk-11-jdk

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
install_packages yarn

# ==========================================
# Go Installation
# ==========================================
info "Installing Go ${GO_VERSION}..."
curl -OL "https://go.dev/dl/go${GO_VERSION}.${GO_ARCH}.tar.gz"

if file "go${GO_VERSION}.${GO_ARCH}.tar.gz" | grep -q "gzip compressed data"; then
    sudo tar -C /usr/local -xzf "go${GO_VERSION}.${GO_ARCH}.tar.gz"
    rm "go${GO_VERSION}.${GO_ARCH}.tar.gz"
    
    # Add to PATH
    export PATH=$PATH:/usr/local/go/bin
    grep -qxF 'export PATH=$PATH:/usr/local/go/bin' ~/.bashrc || echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
    
    # Verify
    if ! command -v go &> /dev/null; then
        error "Go installation failed"
    else
        info "Go installed: $(go version)"
    fi
else
    error "Invalid Go download"
fi

# ==========================================
# Rust Installation (Improved)
# ==========================================
info "Installing Rust..."
export CARGO_HOME="$HOME/.cargo"
export RUSTUP_HOME="$HOME/.rustup"

# Install Rust non-interactively
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path

# Add to PATH in a way that works for all shells
{
    echo 'export CARGO_HOME="$HOME/.cargo"'
    echo 'export RUSTUP_HOME="$HOME/.rustup"'
    echo 'export PATH="$CARGO_HOME/bin:$PATH"'
} >> ~/.bashrc

# Source the environment immediately
source "$CARGO_HOME/env"

# ==========================================
# Final Configuration
# ==========================================
info "Final system configuration..."
sudo systemctl enable --now netfilter-persistent

# Fix potential PS1 error in .bashrc
if ! grep -q "PS1" ~/.bashrc; then
    echo 'PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "' >> ~/.bashrc
fi

# ==========================================
# Completion Message
# ==========================================
cat <<EOF

================================================
INSTALLATION COMPLETE!
- System updated and essential packages installed
- Docker and Docker Compose ${DOCKER_COMPOSE_VERSION} installed
- Development tools (Go ${GO_VERSION}, Rust, Node.js, etc.) installed
- Visual Studio Code installed via Snap
================================================

IMPORTANT NEXT STEPS:
1. Run this command or restart your shell to apply changes:
   source ~/.bashrc

2. Verify Rust installation:
   rustc --version
   cargo --version

3. For Docker to work without sudo, you may need to log out and back in.

4. Verify Go installation:
   go version
EOF

echo "==================================="
echo -e "${BANNER}           EZ Labs Nodes       ${NC}"
echo "==================================="
echo -e "${GREEN}    Thanks for using this script!${NC}"
echo "==================================="
