pragma solidity  ^0.4.2;

 import "./RogueCoin.sol";

contract RogueCoinSale {
    address admin;
    RogueCoin public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event sell(address _buyer, uint256 _amount);

    function RogueCoinSale(RogueCoin _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender; 
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
        

    }
        // multiplication 
        function multiply(uint x, uint y) internal pure returns (uint z) {
            require(y == 0 || (z = x * y) / y == x);
        }
        // the ability to buy Coin 
        function buyTokens(uint256 _numberOfTokens) public payable { 
            require(msg.value == multiply(_numberOfTokens, tokenPrice));
            require(tokenContract.balanceOf(this) >= _numberOfTokens);
            require(tokenContract.transfer(msg.sender, _numberOfTokens));

            tokensSold += _numberOfTokens;

            sell(msg.sender, _numberOfTokens);

        }    

        // ability to ending coin sale 
        function endSale() public {
            require(msg.sender == admin);
            require(tokenContract.transfer(admin, tokenContract.balanceOf(this)));
            admin.transfer(address(this).balance);
        }

}