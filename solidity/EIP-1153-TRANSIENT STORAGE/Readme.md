EVM is a virtual machine that operates on Ethereum, designed to perform computations while ensuring a certain level of decentralization and security. Consequently, the development of contracts currently takes place in a very restricted environment. Gas is an example of this. To prevent the Tragedy of the Commons, anyone wishing to carry out all tasks consuming EVM’s computing resources has to pay a fee called gas to the nodes.


Contracts have three spaces which are 
Stack 
memory
Account(Storage) 


_Storing data in storage (SSTORE) requires the highest level of gas among opcodes in the EVM. Although it varies depending on the value of the variable or the situation, it usually consumes about 20,000 GAS. This is because storing data in storage is an act that increases the state size of Ethereum and exacerbates the burden on nodes._


