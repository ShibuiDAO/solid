// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

/// @dev Used at address "0x7109709ECfa91a80626fF3989D68f67F5b1DD12D" ("address(bytes20(uint160(uint256(keccak256('hevm cheat code')))))").
/// @author Solid (https://github.com/ShibuiDAO/solid/blob/main/src/tests/utils/CheatCodes.sol)
/// @author Based on official documentation (https://book.getfoundry.sh/reference/cheatcodes.html)
/// @author Modified from Playpen by ZeframLou (https://github.com/ZeframLou/playpen/blob/2eb6ff4722e8d8d6ef3a40629e985ce9eb99487e/src/test/utils/VM.sol)
interface CheatCodes {
	/// @dev Set "block.timestamp" (newTimestamp).
	function warp(uint256 time) external;

	/// @dev Set "block.height" (newHeight)
	function roll(uint256 height) external;

    /// @dev Set "block.basefee".
    function fee(uint256 fee) external;

	/// @dev Loads a storage slot from an address.
	function load(address account, bytes32 slot) external returns (bytes32 data);

	/// @dev Stores a value to an address' storage slot.
	function store(
		address account,
		bytes32 slot,
		bytes32 value
	) external;

	/// @dev Signs data, (privateKey, digest) => (r, v, s).
	function sign(uint256 privateKey, bytes32 digest)
		external
		returns (
			uint8 v,
			bytes32 r,
			bytes32 s
		);

	/// @dev Gets address for a given private key, (privateKey) => (address).
	function addr(uint256 privateKey) external returns (address account);

	/// @dev Performs a foreign function call via terminal, (stringInputs) => (result).
	function ffi(string[] calldata stringInputs) external returns (bytes memory result);

	/// @dev Performs the next smart contract call with specified `msg.sender`, (newSender).
	function prank(address account) external;

	/// @dev Performs all the following smart contract calls with specified `msg.sender`, (newSender).
	function startPrank(address account) external;

    /// @dev Sets the *next* call's msg.sender to be the input address, and the tx.origin to be the second input.
    function prank(address account, address origin) external;

    /// @dev Sets all subsequent calls' msg.sender to be the input address until `stopPrank` is called, and the tx.origin to be the second input.
    function startPrank(address account, address origin) external;

	/// @dev Stop smart contract calls using the specified address with prankStart().
	function stopPrank() external;

	/// @dev Sets an address' balance, (who, newBalance).
	function deal(address who, uint256 newBalance) external;

	/// @dev Sets an address' code, (who, newCode).
	function etch(address who, bytes calldata code) external;

    /// @dev Expects an error on next call.
	function expectRevert() external;

	/// @dev Expects an error on next call.
	function expectRevert(bytes calldata reason) external;

    /// @dev Expects an error on next call.
	function expectRevert(bytes4 reason) external;

    /// @dev Record all storage reads and writes.
    function record() external;

    /// @dev Gets all accessed reads and write slot from a recording session, for a given address
    function accesses(address account) external returns (bytes32[] memory reads, bytes32[] memory writes);

	/// @dev Expects the next emitted event. Params check topic 1, topic 2, topic 3 and data are the same.
    /// Call this function, then emit an event, then call a function. Internally after the call, we check if
    /// logs were emitted in the expected order with the expected topics and data (as specified by the booleans).
	function expectEmit(
		bool checkTopic1,
		bool checkTopic2,
		bool checkTopic3,
		bool checkData
	) external;

	/// @dev Mocks a call to an address, returning specified data.
	/// Calldata can either be strict or a partial match, e.g. if you only
	/// pass a Solidity selector to the expected calldata, then the entire Solidity
	/// function will be mocked.
	function mockCall(
		address,
		bytes calldata,
		bytes calldata
	) external;

	/// @dev Clears all mocked calls.
	function clearMockedCalls() external;

	/// @dev Expect a call to an address with the specified calldata.
	/// Calldata can either be strict or a partial match.
	function expectCall(address target, bytes calldata call) external;

    /// @dev Gets the bytecode for a contract in the project given the path to the contract.
    function getCode(string calldata path) external returns (bytes memory bytecode);

    /// @dev Label an address in test traces.
    function label(address addr, string calldata label) external;

    /// @dev When fuzzing, generate new inputs if conditional not met.
    function assume(bool condition) external;
}
