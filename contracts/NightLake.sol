// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "erc721a/contracts/ERC721A.sol";

contract NightLake is ERC721A {
    address public owner;

    uint256 public max = 5;

    string baseUrl =
        "https://turquoise-decisive-carp-816.mypinata.cloud/ipfs/QmcEPWmd39th4dEUTvNpk5NYE7NNBi4WHsJG74cHPtaMgY/";

    string public prompt = "Beautiful lake with night sky";

    constructor() ERC721A("NightLake", "GW") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function mint(uint256 quantity) external payable onlyOwner {
        require(
            totalSupply() + quantity <= max,
            "5 is maximum that you can mint"
        );
        _mint(msg.sender, quantity);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseUrl;
    }

    function promptDescription() external view returns (string memory) {
        return prompt;
    }
}
