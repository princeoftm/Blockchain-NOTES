import { Connection, PublicKey, LAMPORTS_PER_SOL } from "@solana/web3.js";

const connection = new Connection("http://127.0.0.1:8899", "confirmed");

const wallet = new PublicKey("C2sagF1DCVF614dxe4fxHhWmPL3MJX2XBLGBCMZGpghp");

/**
 * Note: the `devnet` and `testnet` clusters are subject to rate limits.
 * it is strongly recommended to use `localnet` and the local test validator
 */
const signature = await connection.requestAirdrop(wallet, LAMPORTS_PER_SOL); // request 1 SOL airdrop

const { blockhash, lastValidBlockHeight } =
  await connection.getLatestBlockhash();

// note: confirming the airdrop transaction is very important to ensure the wallet has
await connection.confirmTransaction({
  blockhash,
  lastValidBlockHeight,
  signature,
});