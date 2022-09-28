import { expect } from 'chai';
import { ethers } from 'hardhat';

describe.only('TestDescriptor TEST', async () => {
	let TestDescriptor: any;
	let descriptor: any;

	before(async () => {
		TestDescriptor = await ethers.getContractFactory('TestDescriptor');
		descriptor = await TestDescriptor.deploy();
		descriptor.deployed();
	});

	it('should return testData default value', async () => {
		const testData = await descriptor.getTestData();
		expect(testData).to.equal('TEST');
	});

	it('should change testData value', async () => {
		await descriptor.setTestData('SUPER ABC');

		const testData = await descriptor.getTestData();
		expect(testData).to.equal('SUPER ABC');
	});
});
