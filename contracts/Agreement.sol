pragma solidity ^0.4.24;


contract AgreementContract{

    enum AgreementStatus{Requested, Paid, Complete}

    struct Agreement{
        address buyer;
        address seller; 
        uint256 amount; 
        AgreementStatus status; 
    }

    mapping(uint => Agreement) public agreements; 
    event agreementEvents(uint id,address buyer, address seller, uint amount, uint status);

    uint noAgreements; 

    function newAgreement(address _seller, uint256 _amount) public returns(address, address, uint256, uint){
        noAgreements++;
        agreements[noAgreements] = Agreement(msg.sender, _seller, _amount, AgreementStatus.Requested);
        emit agreementEvents(noAgreements,msg.sender, _seller, _amount, uint(AgreementStatus.Requested));
        return (msg.sender, _seller, _amount, uint(AgreementStatus.Requested));
    }

    function payAgreement(uint id) payable public{   
        
        if(msg.sender == agreements[id].buyer){
            if(msg.value == agreements[id].amount){
                agreements[id].status == AgreementStatus.Paid;
            }
            else{
                revert("Incorrect Amount");
            }
        }else
        {
            revert("Not the buyer");
        }
    }


    function completeAgreement(uint id) public returns(string){
        
        string memory message; 
        address _seller = agreements[id].seller;
        if(msg.sender == _seller){
            agreements[id].status == AgreementStatus.Complete;
            _seller.transfer(agreements[id].amount);
            message = "Agreement Complete";
        }
        else{
            revert("Not the seller");
        }
    }
    

}