pragma solidity ^0.5.0;
import"https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract tanvi is ERC20{
    address public owner;
    string public symbol;
    string public name;

constructor(string memory _name, string memory _symbol)public{
    owner=msg.sender;
    name=_name;
    symbol=_symbol;
    _mint(owner,10000000);
    
}
}

