import { expect } from 'chai';
import { ethers } from 'hardhat';

describe.only('Web23Descriptor TEST', async () => {
	let Web23Descriptor: any;
	let descriptor: any;

	before(async () => {
		Web23Descriptor = await ethers.getContractFactory('Web23Descriptor');
		descriptor = await Web23Descriptor.deploy();
		descriptor.deployed();
	});

	it('should return testData default value', async () => {
		const testData = await descriptor.getTestData();
		expect(testData).to.equal('WEB23');
	});

	it('should change testData value', async () => {
		await descriptor.setTestData('SUPER ABC');

		const testData = await descriptor.getTestData();
		expect(testData).to.equal('SUPER ABC - FROM WEB23');
	});
});
