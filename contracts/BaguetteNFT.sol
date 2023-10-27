// SPDX-License-Identifier: MIT
// author: @stevieraykatz
pragma solidity 0.8.19;

import {ERC721, ERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Bakery} from "./Bakery.sol";
import {Base64} from "./lib/Base64.sol";
import {Strings} from "./lib/Strings.sol";

contract BaguetteNFT is ERC721Enumerable, ReentrancyGuard, Ownable {

    string[] private BACKGROUNDS = [
        "#000000",
        "#c0392b",
        "#13438c" 
    ];

    string [] private SHADER1 = [
        "#229954",
        "#9b59b6",
        "#2e86c1"

    ]; 

    string [] private SHADER2 = [
        "#c14fe2",
        "#52be80",
        "#d5d8dc",
        "#ec7063",
        "#4d5656"
    ];

    string [] private SHADER3 = [
        "#f7ca93"
    ];

    string [] private SHADER4 = [
        "#e37c19"
    ];

    string [] private SHADER5 = [
        "#f09c46"
    ];

    string [] private SHADER6 = [
        "#f1c40f",
        "#c9630d"
    ];


    mapping(address => bool) private hasBaked;

    constructor() ERC721("Baguette", "FzFoF") Ownable() {}

    function bake(uint256 tokenId) public nonReentrant {
        require(tokenId > 0 && tokenId < 1791, "Token ID invalid");
        require(!hasBaked[_msgSender()], "Address has already baked");
        hasBaked[_msgSender()] = true;
        _safeMint(_msgSender(), tokenId);
    }

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function pluck(uint256 tokenId, string memory keyPrefix, string[] memory sourceArray) internal pure returns (string memory) {
        uint256 rand = random(string(abi.encodePacked(keyPrefix, Strings.toString(tokenId))));
        string memory output = sourceArray[rand % sourceArray.length];
        return output;
    }

    function tokenURI(uint256 tokenId) override public view returns (string memory) {
        string memory bg = pluck(tokenId, "BACKGROUND", BACKGROUNDS);
        string memory s1 = pluck(tokenId, "SHADER1", SHADER1);
        string memory s2 = pluck(tokenId, "SHADER2", SHADER2);
        string memory s3 = pluck(tokenId, "SHADER3", SHADER3);
        string memory s4 = pluck(tokenId, "SHADER4", SHADER4);
        string memory s5 = pluck(tokenId, "SHADER5", SHADER5);
        string memory s6 = pluck(tokenId, "SHADER6", SHADER6);

        string memory output = Bakery.getBaguette(bg, s1, s2, s3, s4, s5, s6);
        string memory json = Base64.encode(bytes(string(abi.encodePacked('{"name": "Baguette #', Strings.toString(tokenId), '", "description": "For ze future of France!", "image": "data:image/svg+xml;base64,', Base64.encode(bytes(output)), '"}'))));
        output = string(abi.encodePacked('data:application/json;base64,', json));

        return output;
    }
}