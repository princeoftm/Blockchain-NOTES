This guide is meant to be a reference for developers who want to add priority fees to their transactions on Solana. We will cover priority fees, how to use them, special considerations, and best practices to estimate them.

What are Priority Fees?
Prioritization Fees are an optional fee, priced in micro-lamports per Compute Unit (e.g. small amounts of SOL), appended to transactions to make them economically compelling for validator nodes to include in blocks on the network. This additional fee will be on top of the base Transaction Fee already set, which is 5000 lamports per signature in your transaction.

Why Should I Use Priority Fees?
When a transaction journeys through a validator, one of the critical stages of the validator is scheduling the transaction. A validator is economically incentivized to schedule transactions with the highest fee per compute unit associated, guaranteeing users use resources optimally. A user can still have their transaction executed with no priority fee attached but with a lesser guarantee. When blocks are saturated with transactions with priority fees, validators will drop transactions without priority fees.

How do I Implement Priority Fees?
When adding priority fees to a transaction, keep in mind the amount of compute units (CU) used for your transaction. The higher the CU required for the transaction, the more fees you will pay when adding priority fees.

Using the Compute Budget Program, you can change the CU requested for your transaction and add any additional priority fee required. Do note that your CU request must be equal to or greater than the CU needed for the transaction; otherwise, the transaction will fail.

