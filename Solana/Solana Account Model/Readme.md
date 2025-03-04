On Solana, all data is contained in what we call "accounts". You can think of data on Solana as a public database with a single "Accounts" table, where each entry in this table is an individual account with the same base Account type.

![alt text](image.png)


*_Key Points_*

Accounts can store up to 10MiB of data, which contain either executable program code or program state.
Accounts require a rent deposit in lamports (SOL) that is proportional to the amount of data stored, which is fully refundable when the account is closed.
Every account has a program owner. Only the program that owns an account can modify its data or deduct its lamport balance. However, anyone can increase the balance.
Programs (smart contracts) are stateless accounts that store executable code.
Data accounts are created by programs to store and manage program state.
Native programs are built-in programs included with the Solana runtime.
Sysvar accounts are special accounts that store network cluster state.

_Account_

Every account on Solana is identifiable by a unique 32 byte address, which is generally displayed as a base58 encoded string (e.g 14grJpemFaf88c8tiVb77W7TYg2W3ir6pfkKz3YjhhZ5).

The relationship between the account and its address can be thought of as a key-value pair, where the address serves as the key to locate the corresponding on-chain data of the account.


Every Account on Solana has the following fields:

data: A byte array that stores arbitrary data for an account. For non-executable accounts, this generally stores state that is meant to be read-only. For program accounts (smart contracts), this contains the executable program code. The data field is commonly referred to as "account data".
executable: A boolean flag that indicates if the account is a program.
lamports: The account's balance in lamports, the smallest unit of SOL (1 SOL = 1 billion lamports).
owner: The program ID (public key) of the program that owns this account. Only the owner program can modify the account's data or deduct its lamports balance.
rent_epoch: A legacy field from when Solana had a mechanism that periodically deducted lamports from accounts. While this field still exists in the Account type, it is no longer used since rent collection was deprecated.


```
pub struct Account {
    /// lamports in the account
    pub lamports: u64,
    /// data held in this account
    #[cfg_attr(feature = "serde", serde(with = "serde_bytes"))]
    pub data: Vec<u8>,
    /// the program that owns this account. If executable, the program that loads this account.
    pub owner: Pubkey,
    /// this account's data contains a loaded program (and is now read-only)
    pub executable: bool,
    /// the epoch at which this account will next owe rent
    pub rent_epoch: Epoch,
}
```