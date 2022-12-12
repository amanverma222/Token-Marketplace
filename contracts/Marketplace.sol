// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Token.sol";
import "./TokenMint.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract Marketplace is Nft {

    struct Nft{
        bool isAvailable;
        uint tokenAmt;
        address payable currentOwner;
    }

    mapping (uint => Nft) public nftId;

    function listNft(uint _tokenId, uint _Amt) public{
        require(nftId[_tokenId].isAvailable == false, "Nft already listed for sale");

        require(msg.sender == super.ownerOf(_tokenId), "You are not the owner of the NFT");
        nftId[_tokenId] = Nft(
            true, _Amt, payable(msg.sender)
        );
    }

    function buyNft(uint _tokenId) public{
        require(nftId[_tokenId].isAvailable == true, " Nft not listed for sale.");

        _transfer(nftId[_tokenId].currentOwner, msg.sender, _tokenId);

        nftId[_tokenId] = Nft(
            false, 0, payable(msg.sender)
        );
    }
}