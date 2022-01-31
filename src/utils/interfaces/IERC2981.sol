// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

import {IERC165} from "./IERC165.sol";

/// @author Solid (https://github.com/ShibuiDAO/solid/blob/main/src/utils/interfaces/IERC165.sol)
/// @author Modified from Ethereum Improvement Proposals #2981 (https://eips.ethereum.org/EIPS/eip-2981)
interface IERC2981 is IERC165 {
	function royaltyInfo(uint256 _tokenId, uint256 _salePrice) external view returns (address receiver, uint256 royaltyAmount);
}
