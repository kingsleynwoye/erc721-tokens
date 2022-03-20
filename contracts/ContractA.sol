pragma solidity ^0.7.3;

import "@openzeppelin/contracts/token/ERC721/ERC721Holder.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ContractB is ERC721Holder {
    function deposite(uint tokenId) external;
    function withdraw(uint tokenId) external;
}

contract ContractA is ERC721Holder {
    IERC721 public token;
    ContractB public ContractB;

    constructor(address _token, address) {
        token = IERC721(_token);
        ContractB = ContractB(_contractB);
    }

    function deposite(uint tokenId) external {
        token.safeTransferFrom(msg.sender, address(this), tokenId);
        token.approve(address(contractB), tokenId);
        ContractB.deposite(tokenId);
    }

    function withdraw(uint tokenId) external {
        ContractB.withdraw(tokenId);
        token.safeTransferFrom(address(this), msg.sender, tokenId);
    }
}