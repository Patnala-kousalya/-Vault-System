# Authorization-Governed Vault System

This project implements a secure **Authorization-Governed Vault System** for controlled asset withdrawals using Solidity smart contracts.
The system separates fund custody and authorization validation to ensure secure withdrawals and prevent replay attacks.

Repository:
https://github.com/Patnala-kousalya/-Vault-System

---

# System Architecture

The system consists of two smart contracts:

## 1. AuthorizationManager

Responsible for validating withdrawal permissions.

Responsibilities:

* Verifies whether a withdrawal request is authorized
* Tracks previously used authorization IDs
* Prevents replay attacks by rejecting reused authorization IDs

## 2. SecureVault

Responsible for holding funds and executing withdrawals.

Responsibilities:

* Accept deposits
* Request authorization validation from AuthorizationManager
* Execute withdrawals only when authorization is valid

---

# Workflow

1. A user deposits ETH into the SecureVault contract.
2. A withdrawal request is created containing:

   * recipient address
   * withdrawal amount
   * authorization ID
3. SecureVault sends the request to AuthorizationManager.
4. AuthorizationManager validates the authorization.
5. If valid, the withdrawal is executed.
6. The authorization ID is marked as used to prevent replay attacks.

---

# Replay Protection

Replay protection is implemented using **unique authorization identifiers (authId)**.

Each authorization ID can only be used once.
AuthorizationManager maintains a mapping of used authorization IDs.

If an authorization ID has already been used, the withdrawal request is rejected.

This prevents attackers from reusing a valid authorization multiple times.

---

## Repository Structure

```
vault-system/
│
├── contracts/
│   ├── AuthorizationManager.sol
│   └── SecureVault.sol
│
├── scripts/
│   └── deploy.js
│
├── docker/
│   └── entrypoint.sh
│
├── Dockerfile
├── docker-compose.yml
├── package.json
└── README.md
```


---

# Docker Setup

The repository includes Docker support for easy local execution.

Running the following command initializes the environment and executes the vault deployment script:

docker-compose up

The Docker container performs the following steps:

1. Start the container environment
2. Compile smart contracts
3. Deploy the vault contract

---

# Docker Execution Proof

Docker was executed locally using:

docker-compose up

Execution log:

Vault system container started
Compiling contracts...
Deploying vault contract...
Vault deployment finished

Container:

vault-system (node:18 image)

Docker image evidence:

![Docker Image](docker-proof.png)

---

# Assumptions

* Authorization IDs are generated securely off-chain.
* Only valid authorization IDs are provided to the vault.
* The system assumes the AuthorizationManager contract is trusted.

---

# Known Limitations

* Authorization verification is simplified for demonstration purposes.
* Additional cryptographic signature verification could be added in production systems.

---

# Security Considerations

* Replay protection is enforced using unique authorization IDs.
* Authorization validation is separated from the vault contract.
* Unauthorized callers cannot withdraw funds without valid authorization.

---

# Technologies Used

* Solidity
* Node.js
* Hardhat
* Docker
* Docker Compose

---

# Author

Patnala Kousalya
