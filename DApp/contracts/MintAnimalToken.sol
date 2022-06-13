// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MintAnimalToken is ERC721Enumerable {
  constructor() ERC721("h662Animals", "HAS") {}

  // animalTokenId를 입력하면 animalType가 나올 수 있도록 mapping
  mapping(uint256 => uint256) public animalTypes;

  // Mint하는 함수
  function mintAnimalToken() public {
    // 유일한 NFT 값임을 증명할 수 있는 아이디
    uint256 animalTokenId = totalSupply() + 1;

    // 1~5 사이 랜덤한 숫자 (keccak 알고리즘 사용)
    uint256 animalType = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, animalTokenId))) % 5 + 1;

    animalTypes[animalTokenId] = animalType;

    _mint(msg.sender, animalTokenId);
  }
}