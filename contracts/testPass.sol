// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import '@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/utils/Counters.sol';
import 'hardhat/console.sol';

import { ITestDescriptor } from './interfaces/ITestDescriptor.sol';

contract Test is Ownable, ERC721Enumerable {
	ITestDescriptor public testDescriptor;

	/**
	 * @dev
	 * @param _testDescriptor address for test descriptor
	 */
	constructor(address _testDescriptor) ERC721('Test for Web23', 'TESTWEB23') {
		testDescriptor = ITestDescriptor(_testDescriptor);
	}

	/**
	 * @notice set the testDescriptor
	 * @param _testDescriptor address for test descriptor
	 */
	function setDescriptor(address _testDescriptor) public onlyOwner {
		require(_testDescriptor != address(0), 'INVALID_ADDRESS');
		testDescriptor = ITestDescriptor(_testDescriptor);
	}

	/**
	 * @notice set the testData
	 * @param _testData data to update the testData variable
	 */
	function setTestData(string memory _testData) public {
		testDescriptor.setTestData(_testData);
	}

	/**
	 * @notice get the testData.
	 */
	function getTestData() public view returns (string memory) {
		return testDescriptor.getTestData();
	}
}
