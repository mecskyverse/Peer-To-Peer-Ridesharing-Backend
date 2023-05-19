// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract Customer {
    shareRider[] public shareRiders;
    mapping(uint => Rider) Riders;
    struct Rider {
        address user;
        string origin;
        string destination;
        uint256 distance;
        uint256 fare;
    }
    struct shareRider {
        address[] s_riders;
        string origin;
        string destination;
    }
    uint256 shareRiderIndex;
    uint256 mappingIndex;
    uint256 immutable i_farePrice;

    constructor() {
        shareRiderIndex = 0;
        mappingIndex = 0;
        i_farePrice = 1000 wei;
    }

    function addRider(
        string memory _origin,
        string memory _destination,
        uint256 _dist
    ) public {
        Rider memory newRider = Rider(
            msg.sender,
            _origin,
            _destination,
            _dist,
            _dist * i_farePrice
        );
        // Riders.push(Rider(msg.sender ,_origin, _destination, _dist, _dist*i_farePrice));
        Riders[mappingIndex] = newRider;
        mappingIndex++;
    }

    function availableRides() public view returns (Rider[] memory) {
        uint count = 0;
        for (uint i = 0; i < 100; i++) {
            // loop through possible key values
            if (bytes(Riders[i].origin).length > 0) {
                // check if the key exists
                count++;
            }
        }

        Rider[] memory result = new Rider[](count);
        uint index = 0;
        for (uint i = 0; i < 100; i++) {
            if (bytes(Riders[i].origin).length > 0) {
                // check if the key exists
                result[index] = Riders[i];
                index++;
            }
        }

        return result;
    }

    function showRidesSameLocation(
        string memory _origin,
        string memory _destination
    ) public view returns (Rider[] memory) {
        uint count = 0;
        for (uint i = 0; i < 100; i++) {
            if (
                keccak256(bytes(Riders[i].origin)) ==
                keccak256(bytes(_origin)) &&
                keccak256(bytes(Riders[i].destination)) ==
                keccak256(bytes(_destination))
            ) {
                count++;
            }
        }
        Rider[] memory result = new Rider[](count);
        uint index = 0;
        for (uint i = 0; i < 100; i++) {
            if (
                keccak256(bytes(Riders[i].origin)) ==
                keccak256(bytes(_origin)) &&
                keccak256(bytes(Riders[i].destination)) ==
                keccak256(bytes(_destination))
            ) {
                result[index] = Riders[i];
                index++;
            }
        }
        return result;
    }

    function shareBookRidefromlist(
        address userAddress,
        string memory _origin,
        string memory _destination
    ) public {
        for (uint i = 0; i < 100; i++) {
            if (
                Riders[i].user == userAddress &&
                keccak256(bytes(Riders[i].origin)) ==
                keccak256(bytes(_origin)) &&
                keccak256(bytes(Riders[i].destination)) ==
                keccak256(bytes(_destination))
            ) {
                address[] memory tempArray = new address[](2);
                tempArray[0] = msg.sender;
                tempArray[1] = userAddress;
                shareRiders.push(shareRider(tempArray, _origin, _destination));
                delete Riders[i];
            }
            if (
                Riders[i].user == msg.sender &&
                keccak256(bytes(Riders[i].origin)) ==
                keccak256(bytes(_origin)) &&
                keccak256(bytes(Riders[i].destination)) ==
                keccak256(bytes(_destination))
            ) {
                delete Riders[i];
            }
        }
    }

    // function shareBookRidefromData()
    function showSharedRide() public view returns (shareRider[] memory) {
        return shareRiders;
    }
}
