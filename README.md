Authorization-Governed Vault System

This project implements a secure vault system using two smart contracts.

1. AuthorizationManager
- Validates withdrawal permissions
- Prevents authorization reuse

2. SecureVault
- Stores ETH deposits
- Executes withdrawals only after authorization verification

Workflow
1. User deposits ETH
2. Withdrawal request is submitted
3. Vault calls AuthorizationManager
4. If authorization is valid, funds are transferred