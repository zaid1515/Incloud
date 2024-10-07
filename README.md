
# **Incloud: Decentralized Cloud File Storage System**

**Overview**  
Incloud is a decentralized cloud file storage system that allows users to store and share files securely with customizable access permissions. Built on a Web3 framework, Incloud combines blockchain technology with decentralized file storage, ensuring transparency, security, and data ownership. Users can pin files to IPFS and interact with smart contracts to manage file access and sharing.

---

### **Technology Stack**
- **Frontend**: React.js  
- **Backend**: Solidity Smart Contracts  
- **File Storage**: Pinata (IPFS Pinning Service)  
- **Blockchain Interaction**: Ether.js  
- **Development Environment**: Hardhat  

---

### **What is Blockchain?**  
Blockchain is a decentralized ledger that records transactions across multiple nodes in a network. It ensures that data is secure, transparent, and tamper-proof through cryptographic hashing. In blockchain, no central authority controls the data, making it resilient to single points of failure.

---

### **Smart Contracts**  
A **smart contract** is a self-executing contract with the terms of the agreement directly written into code. Smart contracts run on blockchain networks (like Ethereum) and are used to automate processes such as file storage in Incloud. They ensure that conditions (like file access permissions) are met before actions (like file sharing) are executed.

---

### **Ether and Gas**  
- **Ether (ETH)**: The native cryptocurrency of the Ethereum network, used to compensate participants who validate transactions and secure the network.
- **Gas**: A fee paid in Ether for executing smart contracts or transactions on the Ethereum network. The more complex the transaction, the higher the gas required.

---

## **Pinata: NFT Media Management for Decentralized Storage**  
Pinata allows users to pin and manage files in **IPFS** without needing to run their own IPFS nodes. This off-chain storage system is essential for hosting large media files that would otherwise be too expensive or impractical to store directly on the blockchain.

**Why Pinata?**  
Storing media directly on smart contracts is costly because of the file size limitations and gas fees. Instead, Pinata allows us to store files in IPFS and retrieve them using their unique hashes (Content Identifiers or CIDs), while keeping the blockchain lean and efficient.

---

## **IPFS (InterPlanetary File System)**  
IPFS is a peer-to-peer protocol that enables the decentralized storage and sharing of hypermedia files. It uses cryptographic hashing to ensure the files are immutable (unchangeable). When files are uploaded, they receive a unique hash that points to their location on the IPFS network.

---

### **How Incloud Works**

1. **File Upload to IPFS via Pinata**  
   Users upload files through Pinata, which stores them on IPFS and returns a unique hash (Content Identifier or CID) representing the file.

2. **Storing File Hash in Smart Contract**  
   Instead of storing the file itself on the blockchain, the CID is stored in a smart contract. This keeps storage efficient and allows users to retrieve their files from IPFS using the hash.

3. **Access Control and Sharing**  
   Users can define access permissions via smart contracts, allowing secure file sharing with specified users. The smart contract manages who can view or download the file, using the file's CID to identify it.

---

## **Deploying & Running Transactions**

When deploying and running smart contracts, developers typically use a blockchain environment to test and execute transactions. Here are a few key concepts:

- **Environment (VM)**: The Virtual Machine (VM) is where blockchain transactions are simulated locally. Hardhat provides a VM for testing and developing contracts before deploying them on the mainnet (live blockchain).
  
- **Account**: Each user or contract interacts with the blockchain using a unique address, such as `0xAb8...35cb2`. These addresses hold Ether and are used to sign transactions.
  
- **Gas Limit & Estimated Gas**: Transactions require gas to run, and a gas limit ensures the transaction doesn’t consume more than allowed. Developers estimate gas before executing transactions to avoid running out of Ether.

- **Contract Deployment**: For example, when deploying the `Upload.sol` contract, the smart contract will be loaded at an Ethereum address like `0xd91...39138`. This address is where the contract lives on the blockchain, and users interact with it by calling methods like `addFile`, `giveAccess`, or `removeAccess`.

---

## **Hardhat: Local Blockchain Environment**

**Hardhat** is an Ethereum development environment that lets you deploy smart contracts and run blockchain simulations locally. It’s commonly used to test contracts before deploying them to the live Ethereum network.

**Installation** (in brief):  
1. Install Node.js if you don’t have it already.
2. Create a project folder and install Hardhat:
   ```bash
   npm init -y
   npm install --save-dev hardhat
   ```
3. Create a Hardhat project:
   ```bash
   npx hardhat
   ```
4. Start a local blockchain node to deploy contracts:
   ```bash
   npx hardhat node
   ```
This command will simulate a local blockchain environment where you can deploy and test your smart contracts.

---

### **Example Transactions in Incloud**

Here are some example interactions with the deployed smart contract:

- **addFile**:  
  This method stores the IPFS hash in the smart contract, linking the file to the user’s Ethereum address.
  ```bash
  addFile("0x5B38Da6a701c568545dCfcB03FcB875f56beddC4", "abc")
  ```
  - `_user`: User's Ethereum address
  - `url`: The IPFS hash (CID) of the file

- **giveAccess**:  
  This method grants another user access to a specific file.
  ```bash
  giveAccess("0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2")
  ```

- **showFiles**:  
  Displays all files linked to a particular user.
  ```bash
  showFiles("0x5B38Da6a701c568545dCfcB03FcB875f56beddC4")
  ```

---

<!-- ### **Future Enhancements**
Incloud can be improved by adding:
- **Advanced Access Control**: Granular control over file sharing with different permission levels.
- **File Encryption**: Encrypting files before storing them in IPFS for additional security.
- **Multi-file Pinning**: Supporting the pinning of multiple files in a single operation. -->

---

Here’s the updated section on MetaMask, now including instructions for adding the Hardhat network and importing an account:

---

## **MetaMask: Gateway to Ethereum Blockchain**

**What is MetaMask?**  
**MetaMask** is a widely-used browser extension and mobile app that functions as a cryptocurrency wallet and gateway to the Ethereum blockchain. It allows users to manage their Ethereum accounts and interact with decentralized applications (dApps) like Incloud by storing private keys, signing transactions, and managing assets such as Ether.

---

### **How Incloud Uses MetaMask** / **Why Use MetaMask?** 

1. **Connect to Ethereum Wallet/Wallet management**  
   Users connect their MetaMask wallet to the Incloud dApp, allowing interactions with smart contracts for file storage and permission management via the Ethereum blockchain.

2. **Transaction Signing**  
   When uploading files or managing permissions, MetaMask prompts the user to confirm and sign transactions.MetaMask prompts the user to approve and sign the transaction which ensures that all interactions are authenticated and recorded on the blockchain.

3. **Ether Management**  
   Users need Ether in their MetaMask wallet to cover gas fees associated with smart contract transactions, like storing file hashes or changing file access permissions.

---

### **Setting Up MetaMask with Hardhat Network**

When working with the Hardhat local blockchain environment, you can configure MetaMask to interact with the local Hardhat network. This enables you to deploy and test smart contracts on a private network.

#### **Step 1: Install MetaMask**
- **For browsers**: Install the MetaMask extension from [MetaMask's official website](https://metamask.io/).

#### **Step 2: Add the Hardhat Network to MetaMask**
To interact with the Hardhat blockchain, add it as a custom network in MetaMask:

1. Open MetaMask and click on the profile icon in the top-right corner.
2. Select **Settings** → **Networks** → **Add Network**.
3. Fill in the following details:
   - **Network Name**: Hardhat Localhost
   - **New RPC URL**: `http://127.0.0.1:8545`
   - **Chain ID**: `31337`
   - **Currency Symbol**: ETH (Optional)
4. Click **Save** to add the Hardhat local network.

#### **Step 3: Import an Account from Hardhat**
When running the Hardhat node (`npx hardhat node`), it generates multiple test accounts, each with its own private key. You can import one of these accounts into MetaMask to use the Ether preloaded in these accounts for testing purposes.

1. After starting the Hardhat node, you will see a list of accounts with their private keys in the console. Each account starts with a balance of 10000 ETH (testnet Ether).
   
   Example:
   ```bash
   Accounts:
   0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 (private key: 0x4c0883a69102937d6231471b5ec2d789fe4a6dce87d2d7c7eabccf82834a3e2b)
   ```

2. Copy the private key of one of the accounts.
3. Open MetaMask, click on the account icon in the top-right, and select **Import Account**.
4. Paste the private key you copied and click **Import**.

Now, you have a Hardhat account connected to MetaMask, which can be used to sign transactions and interact with smart contracts on the Hardhat local network.

---