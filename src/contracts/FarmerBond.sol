pragma solidity ^0.5.0;

contract FarmerBond {
    string public name;
    uint256 public productCount = 0;
    

    mapping(uint256 => ProductDetail) public productDetails;

    struct ProductDetail {
        uint256 productId;
        string productName;
        uint256 productPrice;
        address payable owner;
        bool purchased;
    }

    event ProductRegistered (
        uint256 productId,
        string productName,
        uint256 productPrice,
        address payable owner,
        bool purchased
    );

    event ProductPurchased (
        uint256 productId,
        string productName,
        uint256 productPrice,
        address payable owner,
        bool purchased
    );

    constructor() public {
        name = "Farmer-Warehouse Contract";
    }

    function transfer(address payable _owner) public payable {
      address(_owner).transfer(msg.value);
    }


    function createProduct ( string memory _productName, uint256 _productPrice) public {
        //Require a valid name
        require(bytes(_productName).length > 0);

        //Require a valid price
        require(_productPrice > 0);

        //Increment product count
        productCount++;

        //Create the product
        productDetails[productCount] = ProductDetail(
            productCount,
            _productName,
            _productPrice,
            msg.sender,
            false
        );

        // Trigger an event
        emit ProductRegistered(productCount, _productName, _productPrice, msg.sender, false);
    }

    //function applyLoan () public {}

    //function returnLoan () public {}

    function purchaseProduct(uint256 _productId) public payable {
        //Fetch the product
        ProductDetail memory _product = productDetails[_productId];

        //Fetch the owner
        address payable _seller = _product.owner;

        //Make sure the product has a valid id
        require(_product.productId > 0 && _product.productId <= productCount);

        //Require that there is enough ether in the transaction
        require(msg.value >= _product.productPrice);

        //Require that product has not been purchased already
        require(!_product.purchased);

        //Require that the buyer is not the seller
        require(_seller != msg.sender);

        //Transfer ownership to buyer
        _product.owner = msg.sender;

        //Mark as purchased
        _product.purchased = true;

        //Update the product
        productDetails[_productId] = _product;

        //Pay the seller sending them Ether
        address(_seller).transfer(msg.value);

        //Trigger an event
        emit ProductPurchased(
            productCount,
            _product.productName,
            _product.productPrice,
            msg.sender,
            true
        );
    }


}