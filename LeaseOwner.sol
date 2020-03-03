pragma solidity ^0.5.2;
contract Ownable{
    address public owner;
    constructor() public {
        owner = msg.sender;
    }
    
    event Ownershiptransferred( address owner, address newowner);
    modifier OnlyOwner(){
        require(msg.sender == owner, "Not the owner");
        _;
    }
    
    function transferOwnership(address newOwner) public OnlyOwner{
        emit Ownershiptransferred(owner, newOwner);
        owner = newOwner;
    }
}
contract example is Ownable{
    struct User{
        string fname;
        string lname;
        uint256 mobno;
        uint256 amount;
    }
    
    mapping (address => User) public users;
    
    function record(string memory _fname, string memory _lname, uint256 _mobno) public payable returns(bool) {
        users[msg.sender].fname = _fname;
        users[msg.sender].lname = _lname;
        users[msg.sender].mobno = _mobno;
        users[msg.sender].amount = msg.value;
    }
    
    function destructor() public OnlyOwner{
        selfdestruct(msg.sender);
    }
}
