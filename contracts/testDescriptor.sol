// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract TestDescriptor {
	string public testData = 'TEST';

	/**
	 * @notice set the testData
	 * @param _testData data to update the testData variable
	 */
	function setTestData(string memory _testData) external {
		testData = _testData;
	}

	/**
	 * @notice get the testData
	 */
	function getTestData() external view returns (string memory) {
		return testData;
	}
}
