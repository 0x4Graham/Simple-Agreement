pragma solidity ^0.4.24;


contract Agreement{

    enum AgreementStatus{Requested, Paid, Complete}

    struct Agreement{
        address buyer;
        address seller; 
        uint256 amount; 
        AgreementStatus status; 
    }

    mapping(uint => Agreement) public agreements; 
    uint noAgreements; 

    function newAgreement(address _seller, uint256 _amount) public returns(address, address, uint256, uint){
        agreements[noAgreements] = Agreement(msg.sender, _seller, _amount, AgreementStatus.Requested);
        return (msg.sender, _seller, _amount, uint(AgreementStatus.Requested));
    }

    function payAgreement(uint id) payable public returns(string){                
        address _buyer = msg.sender; 

    }

}