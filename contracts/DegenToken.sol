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
