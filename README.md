**Gensyn Nodes Guide by EZ Labs with Autoscript**
| **Requirement**                                    |
|----------------------------------------------------|                      
|  **16GB RAM**                                      |
|  **CUDA Devices  RTX 3090, RTX 4090, A100, H100**  |
|  **Python Version	>= 3.10**                        |

Note: You can run the node without a GPU using CPU-only mode.

⚙️Installation of the Node:
#### Step 1: Install Dependencies:
````bash
wget -qO Dependencies.sh https://raw.githubusercontent.com/waults/gensyn/refs/heads/main/Dependencies.sh && chmod +x Dependencies.sh && ./Dependencies.sh`
````
Execute the below command:
````bash
source ~/.bashrc
````
#### Step 2: Install the other dependencies:
````bash
sudo apt update && sudo apt install -y python3 python3-venv python3-pip curl wget screen git lsof nano unzip
````
#### Step 3: Create a screen:
Open a screen to run it in the background
````bash
screen -S genysyn
````
#### Step 5: Clone the Repo & execute the rlswarm.sh:
````bash
cd $HOME && rm -rf https://raw.githubusercontent.com/waults/gensyn/refs/heads/main/rlswarm.sh && chmod +x rlswarm.sh && ./rlswarm.sh
````
![image](https://github.com/user-attachments/assets/30a216a5-bde6-4570-8808-bd2809a2f815)

- #### Official doc guide to select the parameters: https://github.com/gensyn-ai/rl-swarm
- #### For GPU → Big model (7B, 32B or 72B) + Math Hard (DAPO-Math 17K dataset)
Required: A100 (80GB) or H100 (80GB)
Optional GPU (for small models) → Qwen 0.5B or 1.5B + GSM8K
- ### Suggested: Any GPU with >8GB vRAM (e.g., RTX 3090, 4090, A100, H100)
The script will install some Python packages. If prompted for Hugging Face credentials, type ’N’ to skip.

#### Step 6: Login:
Now, it will print the website URL as shown in the screenshot. Just open it, use the password displayed in the terminal, enter the password, and submit.
![image](https://github.com/user-attachments/assets/6571863c-0fd5-48e0-a86d-5a49f65a4e71)

![image](https://github.com/user-attachments/assets/9ae93453-e1ac-48b4-876e-004dd98addb2)

- #### Then, log in using your Google credentials. Once logged in.
  ![image](https://github.com/user-attachments/assets/2cd22e15-9457-4702-9bd1-2e942ea9b044)

- #### After that, the script will prompt you to enter your Hugging Face credentials. Type’N’ as shown in the screenshot below.
![image](https://github.com/user-attachments/assets/7bd322df-aab9-4182-b1a4-374363c88f11)

- #### If you see this , Done for run and go to home screen your VPS `CTRL+A+D`
![image](https://github.com/user-attachments/assets/47023a16-191f-480c-8651-48d552931b1d)

#### Check your Log:
If you want to view your log, just reattach to the screen using the command below.

`screen -r gensyn`

- #### Check Wins: @gensyntrackbot on telegram
Enter your Peer-ID, you will find that in your log

- #### Official dashboard: https://dashboard.gensyn.ai/

You can search your Node name in the dashboard after a while when you have done your first training completed
![image](https://github.com/user-attachments/assets/bbade9b6-5cc9-4d10-abca-e5d600acbcf2)

- #### Backup your Userdata & API Key:
  ````bash
  cat ~/rl-swarm/modal-login/temp-data/userData.json && cat ~/rl-swarm/modal-login/temp-data/userApiKey.json
