// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTMarketplace is ERC721, Ownable {
    struct Sale {
        address seller;
        uint256 price;
        bool isForSale;
    }

    mapping(uint256 => Sale) public nftSales;

    event NFTMinted(address indexed owner, uint256 indexed tokenId);
    event NFTListedForSale(
        address indexed seller,
        uint256 indexed tokenId,
        uint256 price
    );
    event NFTPurchased(
        address indexed buyer,
        uint256 indexed tokenId,
        uint256 price
    );

    uint256 public nextTokenId;

    constructor() ERC721("NFTMarketPlace", "NMP") Ownable(msg.sender) {}

    function _baseURI() internal pure override returns (string memory) {
        return
            "https://sapphire-accurate-tortoise-289.mypinata.cloud/ipfs/QmQ18EtpYMnSntmxog5e8dwWsyKMNJanMuWVEcZxWGkDNb";
    }

    /**
     * @dev Mint a new NFT and assign it to the caller.
     */
    function mintNFT() public {
        uint256 tokenId = nextTokenId;
        nextTokenId++;

        _safeMint(msg.sender, tokenId);

        emit NFTMinted(msg.sender, tokenId);
    }

    /**
     * @dev List an NFT for sale.
     * @param tokenId The ID of the NFT to list.
     * @param price The sale price for the NFT.
     */
    function listNFTForSale(uint256 tokenId, uint256 price) public {
        require(
            nftSales[tokenId].isForSale == false,
            "This NFT is already listed for sale"
        );
        require(
            ownerOf(tokenId) == msg.sender,
            "You are not the owner of this NFT"
        );
        require(price > 0, "Price must be greater than zero");

        nftSales[tokenId] = Sale(msg.sender, price, true);

        emit NFTListedForSale(msg.sender, tokenId, price);
    }

    /**
     * @dev Buy an NFT that is listed for sale.
     * @param tokenId The ID of the NFT to purchase.
     */
    function buyNFT(uint256 tokenId) public payable {
        Sale memory sale = nftSales[tokenId];
        require(sale.isForSale, "This NFT is not for sale");
        require(msg.value == sale.price, "Incorrect value sent");

        address seller = sale.seller;

        // Clear the sale
        delete nftSales[tokenId];

        // Transfer funds to the seller
        (bool success, ) = seller.call{value: msg.value}("");
        require(success, "Transfer failed");

        // Transfer NFT to the buyer
        _transfer(seller, msg.sender, tokenId);

        emit NFTPurchased(msg.sender, tokenId, sale.price);
    }

    /**
     * @dev Remove an NFT from sale.
     * @param tokenId The ID of the NFT to delist.
     */
    function delistNFT(uint256 tokenId) public {
        require(
            ownerOf(tokenId) == msg.sender,
            "You are not the owner of this NFT"
        );
        require(nftSales[tokenId].isForSale, "This NFT is not listed for sale");

        delete nftSales[tokenId];
    }

    /**
     * @dev Fetch details of a sale.
     * @param tokenId The ID of the NFT.
     */
    function getSaleDetails(uint256 tokenId) public view returns (Sale memory) {
        return nftSales[tokenId];
    }

    /**
     * @dev Fallback function to receive Ether.
     */
    receive() external payable {
        revert();
    }
}
