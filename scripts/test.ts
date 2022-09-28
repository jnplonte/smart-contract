import { ethers } from 'hardhat';

async function main() {
	// Hardhat always runs the compile task when running scripts with its command
	// line interface.
	//
	// If this script is run directly using `node` you may want to call compile
	// manually to make sure everything is compiled
	// await hre.run('compile');

	const [deployer] = await ethers.getSigners(); // get the account to deploy the contract
	console.log('deploying test contract with the account:', deployer.address);
	console.log('account balance:', (await deployer.getBalance()).toString());

	try {
		const TestDescriptor = await ethers.getContractFactory('TestDescriptor');
		const testDescriptor = await TestDescriptor.deploy();
		await testDescriptor.deployed();
		console.log('test descriptor deployed to:', testDescriptor.address);

		const Test = await ethers.getContractFactory('Test');
		const test = await Test.deploy(testDescriptor.address);
		await test.deployed();
		console.log('test contract deployed to:', test.address);
	} catch (error) {
		throw new Error(`try catch error: ${JSON.stringify(error)}`);
	}
}

main()
	.then(() => process.exit(0))
	.catch((error) => {
		console.error(`test contract error: ${JSON.stringify(error)}`);
		process.exit(1);
	});
