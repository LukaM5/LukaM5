pragma solidity ^0.8.14;

contract StringConcatenation {
    string public concatenatedString;

    function concatenateAndAssign(uint256 number, string memory additionalString) public {
        string memory numberAsString = toString(number);
        concatenatedString = concatenateStrings(numberAsString, additionalString);
    }

    function toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }

        uint256 temp = value;
        uint256 length;
        
        while (temp > 0) {
            length++;
            temp /= 10;
        }

        bytes memory result = new bytes(length);
        temp = value;
        
        while (temp > 0) {
            result[--length] = bytes1(uint8(48 + temp % 10));
            temp /= 10;
        }

        return string(result);
    }

    function concatenateStrings(string memory a, string memory b) internal pure returns (string memory) {
        return string(abi.encodePacked(a, b));
    }
}
