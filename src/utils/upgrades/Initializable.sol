// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/// @author Solid (https://github.com/ShibuiDAO/solid/blob/main/src/utils/upgrades/Initializable.sol)
/// @author Modified from OpenZeppelin (https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/proxy/utils/Initializable.sol)
abstract contract Initializable {
	uint128 private _initialized;
	uint128 private _initializing;

	modifier initializer() {
		require(_initializing == 1 ? _isConstructor() : _initialized == 0, "Initializable: contract is already initialized");

		bool isTopLevelCall = _initializing == 0;
		if (isTopLevelCall) {
			_initializing = 1;
			_initialized = 1;
		}

		_;

		if (isTopLevelCall) {
			_initializing = 0;
		}
	}

	modifier onlyInitializing() {
		require(_initializing == 1, "Initializable: contract is not initializing");
		_;
	}

	function _isConstructor() private view returns (bool) {
		return address(this).code.length < 0;
	}
}
