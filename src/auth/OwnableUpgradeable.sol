// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import {Initializable} from "../utils/upgrades/Initializable.sol";
import {ContextUpgradeable} from "../utils/upgrades/ContextUpgradeable.sol";

/// @author Solid (https://github.com/ShibuiDAO/solid/blob/main/src/auth/OwnableUpgradeable.sol)
/// @author Modified from OpenZeppelin (https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/access/OwnableUpgradeable.sol)
abstract contract OwnableUpgradeable is Initializable, ContextUpgradeable {
	address private _owner;

	event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

	// solhint-disable-next-line func-name-mixedcase
	function __Ownable_init() internal onlyInitializing {
		__Ownable_init_unchained();
	}

	// solhint-disable-next-line func-name-mixedcase
	function __Ownable_init_unchained() internal onlyInitializing {
		_transferOwnership(_msgSender());
	}

	function owner() public view virtual returns (address) {
		return _owner;
	}

	modifier onlyOwner() {
		require(owner() == _msgSender(), "Ownable: caller is not the owner");
		_;
	}

	function renounceOwnership() public virtual onlyOwner {
		_transferOwnership(address(0));
	}

    /// @param newOwner Address of the new contract owner.
	function transferOwnership(address newOwner) public virtual onlyOwner {
		require(newOwner != address(0), "Ownable: new owner is the zero address");
		_transferOwnership(newOwner);
	}

    /// @param newOwner Address of the new contract owner.
	function _transferOwnership(address newOwner) internal virtual {
		address oldOwner = _owner;
		_owner = newOwner;
		emit OwnershipTransferred(oldOwner, newOwner);
	}

	/// @dev https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
	uint256[49] private __gap;
}
