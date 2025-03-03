Move code is organized into modules that are uploaded to the Aptos blockchain. Users can interact with the modules by calling functions from these modules via transactions. Modules are grouped into packages. When uploading code to the blockchain, an entire package of multiple modules will be uploaded. 


An empty module looks like below:
```
module 0xcafe::my_module {

}
```


Part 1: Move Spider

Making a module:

```
// Create the spider_nest module here
module 0xcafe::spider_nest {

}
```

--------------------------------------------------------------------------------
Now that we have a module, we can start adding code to it. Let's start by adding a number to track the number of digits allowed in a DNA code. This number will be stored on the blockchain (global storage). This data can be accessed and changed by the module's code as well as read by web UI. Think of it as writing to a database on the blockchain.

On Aptos, all data written to global storage needs to be declared in a struct that has the key attribute. We'll examine struct abilities such as key and store in more detail in later courses. For now, take a look at the simple example below:
```
module 0xcafe::my_module {
    // All structs that are written to global storage need to have the `key` attribute.
    struct GlobalData has key {
        value: u64,
    }
}
```
In the example above, we're storing a simple value in global storage. This value can be read in functions later. One common confusion is between global storage and local variables. Unless explicitly declared in a struct with the key attribute, all variables declared and modified in a function are local variables and thus not stored on the blockchain (in global storage). Also note that the struct name is capitalized by convention (GlobalData instead of global_data).

Unsigned integers: u8, u32, u64, u128, u256

Move supports multiple different types of unsigned integers. The values of these integers are always zero or larger. The different types of integers have different maximum values they can store. For example, u8 can store values up to 255, while u256 can store values up to 2^256 - 1. The most commonly used integer type is u64. Smaller types such as u8 and u32 are usually only used to save on gas (less storage space used). Larger sizes such as u128 and u256 are only used for when you need to store very large numbers.

MoveSpider Part 2: