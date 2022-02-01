// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import {Initializable} from "./Initializable.sol";

/// @author Solid (https://github.com/ShibuiDAO/solid/blob/main/src/utils/upgrades/ContextUpgradeable.sol)
/// @author Modified from OpenZeppelin (https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/utils/ContextUpgradeable.sol)
abstract contract ContextUpgradeable is Initializable {
	// solhint-disable-next-line func-name-mixedcase, no-empty-blocks
	function __Context_init() internal onlyInitializing {}

	// solhint-disable-next-line func-name-mixedcase, no-empty-blocks
	function __Context_init_unchained() internal onlyInitializing {}

	function _msgSender() internal view virtual returns (address) {
		return msg.sender;
	}

	function _msgData() internal view virtual returns (bytes calldata) {
		return msg.data;
	}

	/// @dev https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
	uint256[50] private __gap;
}
