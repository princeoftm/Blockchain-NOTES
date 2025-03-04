Ethereum accounts are divided into 2 types of accounts- “Externally Owned Accounts” (EoAs) and “Contract Accounts”. Aptos accounts, however, serve as containers for both Move/smart contract code ("modules") and instances of various data structures ("resources").


Ethereum Accounts
Address: Each account is identified by a 160-bit length address.
Balance: Each account has a balance.
Nonce: Each account has a nonce, representing the number of transactions the account has ever paid gas for.
State: Each account has a state, represented by a storage root. If the account is a contract-type account, then it also has a field containing the code hash, which is just a hash of the bytecode.
Control: Contract accounts are controlled by EVM code, and EoAs are controlled by a private key.

Aptos Accounts
Address: Each account is identified by a 256-bit length address.
Modules and Resources: Each account contains modules (smart contracts) and resources (typed data structures).
Balance: The account balance isn’t stored directly under the account in a singular field like Ethereum, but rather balances are represented through resources. An account has a resource for each type of asset it owns–this resource includes the account's balance of that asset.
Sequence Number: Each account has a sequence number, representing the number of transactions sent from an account.
Control: Modules contain bytecode that is controlled by both the Move VM.