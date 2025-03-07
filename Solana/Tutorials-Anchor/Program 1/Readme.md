Anchor program structure
Anchor uses macros and traits to simplify Rust code for you. These provide a clear structure to your program so you can focus more on its functionality.

Some important macros provided by Anchor are:

From here on out, you'll see a lot of Rust. We assume that you are familiar with Rust, if not, we recommend you to check out The Rust Book.

declare_id! - a macro for declaring the program’s onchain address
#[program] - an attribute macro used to denote the module containing the program’s instruction handlers.
Accounts - a trait applied to structs representing the list of accounts required for an instruction.
#[account] - an attribute macro used to define custom account types for the program.