// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "MintAnimalToken.sol";

contract SaleAnimalToken {
    // MintAnimalToken을 deploy하면 나오게 되는 주소를 담기 위해
    MintAnimalToken public mintAnimalTokenAddress;

    constructor (address _mintAnimalTokenAddress) {
        mintAnimalTokenAddress = MintAnimalToken(_mintAnimalTokenAddress);
    }

    // animalTokenId를 입력하면 animalTokenPrice가 나오도록
    mapping(uint256 => uint256) public animalTokenPrices;

    // 판매중인 token을 볼 수 있는 배열
    uint256[] public onSaleAnimalTokenArray;

    // 판매 등록하는 함수 - 팔 tokenId, 가격
    function setForSaleAnimalToken(uint256 _animalTokenId, uint256 _price) public {
        // token 소유자
        address animalTokenOwner = mintAnimalTokenAddress.ownerOf(_animalTokenId);

        require(animalTokenOwner == msg.sender, "Caller is not animal token ownser.");
        require(_price > 0, "Price is zero or lower.");
        require(animalTokenPrices[_animalTokenId] == 0, "This animal token is alreay on sale.");
        // 소유자가 판매 권한을 넘겼는지 확인
        require(mintAnimalTokenAddress.isApprovedForAll(animalTokenOwner, address(this)), "Animal token owner did not approve token.");
        
        animalTokenPrices[_animalTokenId] = _price;

        onSaleAnimalTokenArray.push(_animalTokenId);
    }

    // 구매 함수
    function purchaseAnimalToken(uint256 _animalTokenId) public payable {
        // 가격
        uint256 price = animalTokenPrices[_animalTokenId];
        // 토큰 소유자
        address animalTokenOwner = mintAnimalTokenAddress.ownerOf(_animalTokenId);

        require(price > 0, "Animal token not on sale.");
        require(price <= msg.value, "Caller sent lower than price.");
        require(animalTokenOwner != msg.sender, "Caller is animal token owner.");

        // 거래
        payable(animalTokenOwner).transfer(msg.value);
        // 보내는 사람, 받는 사람, 보내는 대상
        mintAnimalTokenAddress.safeTransferFrom(animalTokenOwner, msg.sender, _animalTokenId);

        // mapping에서 제거
        animalTokenPrices[_animalTokenId] = 0;
        // 배열에서 제거
        for (uint256 i = 0 ; i < onSaleAnimalTokenArray.length ; i++) {
            if (animalTokenPrices[onSaleAnimalTokenArray[i]] == 0) {
                onSaleAnimalTokenArray[i] = onSaleAnimalTokenArray[onSaleAnimalTokenArray.length - 1];
                onSaleAnimalTokenArray.pop();
            }
        }
    }

    // 판매중인 토큰 길이 - 읽기 전용이기 때문에 view
    function getSaleAnimalTokenArrayLength() view public returns (uint256) {
        return onSaleAnimalTokenArray.length;
    }
}