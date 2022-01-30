pragma solidity ^0.5.0;

contract Admin {
    string public name;
    uint256 public farmerCount = 0;
    uint256 public warehouseCount = 0;
    uint256 public buyerCount = 0;
    
    mapping(uint256 => FarmerDetail) public farmerDetails;
    mapping(uint256 => WarehouseDetail) public warehouseDetails;
    mapping(uint256 => BuyerDetail) public buyerDetails;

    struct FarmerDetail {
        uint256 farmerId;
        string farmerName;
        uint256 farmerAadharNumber;
        uint256 farmerMobileNumber;
        address payable owner;
        bool farmerAdded;
    }

    struct WarehouseDetail {
        uint256 warehouseId;
        string warehouseName;
        uint256 warehouseRegNumber;
        uint256 warehouseContactNumber;
        uint256 warehouseCapacity;
        address payable owner;
        bool warehouseAdded;
    }

    struct BuyerDetail {
        uint256 buyerId;
        string buyerName;
        uint256 buyerAadharNumber;
        uint256 buyerMobileNumber;
        address payable owner;
        bool buyerAdded;
    }

    event FarmerAdded (
        uint256 farmerId,
        string farmerName,
        uint256 farmerAadharNumber,
        uint256 farmerMobileNumber,
        address payable owner,
        bool farmerAdded
    );

    event WarehouseAdded (
        uint256 warehouseId,
        string warehouseName,
        uint256 warehouseRegNumber,
        uint256 warehouseContactNumber,
        uint256 warehouseCapacity,
        address payable owner,
        bool warehouseAdded
    );

    event BuyerAdded (
        uint256 buyerId,
        string buyerName,
        uint256 buyerAadharNumber,
        uint256 buyerMobileNumber,
        address payable owner,
        bool buyerAdded
    );

    constructor() public {
        name = "Admin Contract";
    }

    function addFarmer(string memory _farmerName, uint256 _farmerAadharNumber, uint256 _farmerMobileNumber) public {
        //Require a valid name
        require(bytes(_farmerName).length > 0);

        //Require a valid price
        require(_farmerAadharNumber == 12);

        //Require a valid contact number
        require(_farmerMobileNumber == 10);

        //Increment product count
        farmerCount++;

        //Create the product
        farmerDetails[farmerCount] = FarmerDetail(
            farmerCount,
            _farmerName,
            _farmerAadharNumber,
            _farmerMobileNumber,
            msg.sender,
            false
        );

        // Trigger an event
        emit FarmerAdded(farmerCount, _farmerName, _farmerAadharNumber, _farmerMobileNumber,msg.sender, false);
    }

    function addWarehouse(string memory _warehouseName, uint256 _warehouseRegNumber, uint256 _warehouseContactNumber, uint256 _warehouseCapacity) public {
        //Require a valid name
        require(bytes(_warehouseName).length > 0);

        //Require a valid price
        require(_warehouseRegNumber == 6);

        //Require a valid contact number
        require(_warehouseContactNumber == 10);

        //Require a min capacity of warehouse
        require(_warehouseCapacity > 100);

        //Increment product count
        warehouseCount++;

        //Create the product
        warehouseDetails[warehouseCount] = WarehouseDetail(
            warehouseCount,
            _warehouseName,
            _warehouseRegNumber,
            _warehouseContactNumber,
            _warehouseCapacity,
            msg.sender,
            false
        );

        // Trigger an event
        emit WarehouseAdded(warehouseCount, _warehouseName, _warehouseRegNumber, _warehouseContactNumber, _warehouseCapacity,msg.sender, false);
    }

    function addBuyer(string memory _buyerName, uint256 _buyerAadharNumber, uint256 _buyerMobileNumber) public {
        //Require a valid name
        require(bytes(_buyerName).length > 0);

        //Require a valid price
        require(_buyerAadharNumber == 16);

        //Require a valid contact number
        require(_buyerMobileNumber == 10);

        //Increment product count
        buyerCount++;

        //Create the product
        buyerDetails[buyerCount] = BuyerDetail(
            buyerCount,
            _buyerName,
            _buyerAadharNumber,
            _buyerMobileNumber,
            msg.sender,
            false
        );

        // Trigger an event
        emit BuyerAdded(buyerCount, _buyerName, _buyerAadharNumber, _buyerMobileNumber,msg.sender, false);
    }

}