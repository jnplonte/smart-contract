// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract Web23Descriptor {
	string public testData = 'WEB23';

	/**
	 * @notice set the testData
	 * @param _testData data to update the testData variable
	 */
	function setTestData(string memory _testData) external {
		testData = string(abi.encodePacked(_testData, ' - FROM WEB23'));
	}

	/**
	 * @notice get the testData
	 */
	function getTestData() external view returns (string memory) {
		return testData;
	}
}
