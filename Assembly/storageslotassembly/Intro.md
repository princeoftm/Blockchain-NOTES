First off 

We need to understand how storage in solidity actually works

It can be thought of as an array with 2^256 slots with each slot using up 32 bits of space
_State variables in Solidity are automatically stored in this storage array, with the order of declaration and variable types determining which slots will be used._

For example 

```
contract StorageExample {
 uint256 public data1;
 uint256 public data2;
 uint256 public data3;
}
```

_In this contract, `data1`, `data2`, and `data3` will occupy consecutive slots in the storage array. The first slot will store `data1`, the second slot will store `data2`, and the third slot will store `data3`._


Writing to any storage slot in solidity

Step 1: Calculating the Slot Number 🔢
To calculate the slot number for a given state variable, we can use the formula:
```
slotNumber = keccak256(abi.encodePacked(key)) >> 5
```

Where `key` is a unique identifier for the state variable (e.g., its name as a string). The `keccak256` function calculates the 256-bit (32-byte) Keccak-256 hash of the `abi.encodePacked` value, and then we shift right by 5 bits (dividing by 32) to get the slot number.


Step 2: Writing to the Slot using Assembly ✍️
Now that we have the slot number, we can use assembly to write data to that slot. Let’s see an example of how to do this:
```
contract WriteToAnySlotExample {
 uint256 public data;
function writeToSlot(uint256 slot, uint256 value) public {
 assembly {
 // Calculate the storage position
 let storagePosition := add(slot, 1)
// Write the value to the specified slot
 sstore(storagePosition, value)
 }
 }
}
```
In this example, we have a state variable `data`, and the `writeToSlot` function takes two parameters: `slot` and `value`. The `slot` parameter represents the slot number where we want to write the data, and the `value` parameter is the data we want to store.