// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

import {IERC165} from "./interfaces/IERC165.sol";

/// @author Solid (https://github.com/ShibuiDAO/solid/blob/main/src/utils/ERC165.sol)
abstract contract ERC165 is IERC165 {
	/// @dev IERC165 supportsInterface implementation.
	function supportsInterface(bytes4 interfaceId) public pure virtual override returns (bool) {
		return interfaceId == type(IERC165).interfaceId;
	}
}
