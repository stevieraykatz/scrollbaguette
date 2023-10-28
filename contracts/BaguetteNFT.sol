// SPDX-License-Identifier: MIT
// author: @stevieraykatz
pragma solidity 0.8.19;

import {ERC721, ERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Bakery} from "./lib/Bakery.sol";
import {Base64} from "./lib/Base64.sol";
import {Strings} from "./lib/Strings.sol";

contract BaguetteNFT is ERC721Enumerable, ReentrancyGuard, Ownable {
  string[] private BACKGROUNDS = ["#000000", "#c0392b", "#252e66", "#e2ffe0"];

  string[] private CRISP = ["#dc7315", "#b24e41", "#966b57"];

  string[] private CUTS = ["#f6b36a", "#cfe17d", "#be9bab","#b4cad2", "#d5d8dc", "#ec7063", "#4d5656"];

  string[] private BOTTOM = ["#f7ca93", "#d1eafc", "#cfe17d"];

  string[] private BODY = ["#e37c19", "#7c4d40", "#c78f62"];

  string[] private LIGHTBODY = ["#e8ce8c", "#f09c46", "#c9a252", "#eed7a5"];

  string[] private SUPERCRISP = ["#f1c40f", "#af6c66", "#c9630d", "#5db596"];

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

  function pluck(
    uint256 tokenId,
    string memory keyPrefix,
    string[] memory sourceArray
  ) internal pure returns (string memory) {
    uint256 rand = random(string(abi.encodePacked(keyPrefix, Strings.toString(tokenId))));
    string memory output = sourceArray[rand % sourceArray.length];
    return output;
  }

  function tokenURI(uint256 tokenId) public view override returns (string memory) {
    string memory bg = pluck(tokenId, "BACKGROUND", BACKGROUNDS);
    string memory s1 = pluck(tokenId, "SHADER1", CRISP);
    string memory s2 = pluck(tokenId, "SHADER2", CUTS);
    string memory s3 = pluck(tokenId, "SHADER3", BOTTOM);
    string memory s4 = pluck(tokenId, "SHADER4", BODY);
    string memory s5 = pluck(tokenId, "SHADER5", LIGHTBODY);
    string memory s6 = pluck(tokenId, "SHADER6", SUPERCRISP);

    string memory output = Bakery.getBaguette(bg, s1, s2, s3, s4, s5, s6);
    string memory json = Base64.encode(
      bytes(
        string(
          abi.encodePacked(
            '{"name": "Baguette #',
            Strings.toString(tokenId),
            '", "description": "For the future of France!", "image": "data:image/svg+xml;base64,',
            Base64.encode(bytes(output)),
            '"}'
          )
        )
      )
    );
    output = string(abi.encodePacked("data:application/json;base64,", json));

    return output;
  }
}
