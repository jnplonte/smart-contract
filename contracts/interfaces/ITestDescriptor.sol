// SPDX-License-Identifier: MIT

/// @title Interface for ITestDescriptor

pragma solidity ^0.8.11;

interface ITestDescriptor {
	function setTestData(string memory _testData) external;

	function getTestData() external view returns (string memory);
}
