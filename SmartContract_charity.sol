pragma solidity ^0.5.0;
contract YourCharity{
    mapping (address=>uint)public donations;
    address public superaccess;
    uint public desiredtarget;
    uint public totalDonations;
    uint public minDonations;
    uint public charitytimeline;
    uint public donationAccomplished=0;
}
struct charityDetails{
    string info;
    uint data;
    address awardee;
    bool accomplished;
    uint donorCount;
    mapping(address=>bool)donors;
}

charityDetails[]public appeals;
constructor(uint _charitytimeline, uint _desiredtarget)public{
minDonations=1000000;
charitytimeline=block.number+_charitytimeline;
desiredtarget=_desiredtarget;
superaccess=msg.sender;
}
modifier onlySuperaccess{
    require(msg.sender==superaccess);
    _;
}
function donate()public payable{
    require(msg.data=>minDonations);
    require(block.number<charitytimeline);

    if(donations[msg.sender]==0){
        totalDonations++;
    }
    donations[msg.sender]+=msg.data;
    donationAccomplished+=msg.data;
}
function getBalance()public view returns(uint){
    return address(this).balance;
}
function getPayback()public{
    require(block.number>charitytimeline);
    require(donationAccomplished<desiredtarget)
    require(donations[msg.sender]>0)
    msg.sender.tranfer(donations[msg.sender]);
    donations[msg.sender]=0;
}
function spentAmount(string _details, address _awardee)public onlySuperaccess{
    donationReq memory newReq = donationReq({
        info:_info,
        data:_data,
        awardee:_awardee;
        donorCount=0,
        completed: false
    });
    reuestspush(newReq);
}
function countReq(uint index)public{
    donationReq storage thisReq=appeals[index];
    require(donations[msg.sender]>0);
    require(thisReq.donors[msg.sender]==false);
    thisReq.donors[msg.sender]=true;
    thisReq.numberOfDonors++;
}
function donate(uint index)public onlySuperaccess{
   donationReq storage thisReq=appeals[index];
   require(thisReq.completed==false);
   require(thisReq.donorCount>totalDonors/2);
   thisReq.awardee.tranfer(thisReq.value);
   thisReq.end =true;
}
}