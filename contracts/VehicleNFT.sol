// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VehicleNFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIdCounter;

    event VehicleNFTMinted(address indexed to, uint256 tokenId, string tokenURI);

    constructor() ERC721("VehicleNFT", "VHCL") Ownable(msg.sender) {}

    function mintVehicleNFT(address to, string memory tokenURI) external onlyOwner returns (uint256) {
        require(bytes(tokenURI).length > 0, "Token URI is required");

        _tokenIdCounter++;
        uint256 newTokenId = _tokenIdCounter;

        _safeMint(to, newTokenId);
        _setTokenURI(newTokenId, tokenURI);

        emit VehicleNFTMinted(to, newTokenId, tokenURI);
        return newTokenId;
    }

    function totalMinted() external view returns (uint256) {
        return _tokenIdCounter;
    }
}
