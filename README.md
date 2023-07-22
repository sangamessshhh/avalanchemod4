# Degen Token (Avalanche Fuji Testnet)

In my project, I have created a Degen Token where there's an IG store where users can redeem items for some tokens and can also do other tasks.

## Description

The users can mint, burn ,transfer, check balance and also redeem the item they want for the required tokens(500, 1000 and 1500 tokens each) from the shop. This contract is deployed onto the avalanche fuji testnet and the contract is also verified. You can refer to the walkthrough video on how I did this project.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., DegenToken.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract DegenTok is ERC20, ERC20Burnable, Ownable {
    string public gamestore;
    constructor() ERC20("Degen", "DGN") {
        gamestore="Our store contains three items which are: 1. stickers 2. notepad 3. jacket ";
    }
    function mint(address to_address, uint256 amt) public onlyOwner {
        _mint(to_address, amt);
    }
    function burn(uint256 amount) public override{
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
     function redeem(uint256 itemnumber) public{
        require(balanceOf(msg.sender)>500, "Minimum tokens required to withdraw first item atleast is 500");
        assert(itemnumber>0 && itemnumber<3);
        _burn(msg.sender, itemnumber*500);
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.9" (or another compatible version), and then click on the "Compile DegenToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "DegenToken" contract from the dropdown menu, and then click on the "Deploy" button.

In order to deploy this contract onto the avalanche fuji testnet, try running this command:

```shell
npx hardhat run/scripts/deploy.js --network fuji
```

In order to verify the contract address , try running this command:
```shell
npx hardhat verify {address} --network fuji
```

## Authors

Sangamesh Y
[@sangamessshhh@gmail.com]


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
