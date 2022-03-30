// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol";

import {IHevm} from "../utils/IHevm.sol";
import {CheatCodes} from "../utils/CheatCodes.sol";

/// @author Solid (https://github.com/ShibuiDAO/solid/blob/main/src/tests/base/BaseTest.sol)
/// @author Modified from Playpen by ZeframLou (https://github.com/ZeframLou/playpen/blob/2eb6ff4722e8d8d6ef3a40629e985ce9eb99487e/src/test/base/BaseTest.sol)
contract BaseTest is DSTest {
    IHevm internal immutable hevm = IHevm(HEVM_ADDRESS);
    CheatCodes internal immutable cheats = CheatCodes(HEVM_ADDRESS);
}
