// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol";

import {IHevm} from "../utils/IHevm.sol";
import {IVM} from "../utils/IVM.sol";

/// @author Solid (https://github.com/ShibuiDAO/solid/blob/main/src/tests/base/BaseTest.sol)
/// @author Modified from Playpen by ZeframLou (https://github.com/ZeframLou/playpen/blob/2eb6ff4722e8d8d6ef3a40629e985ce9eb99487e/src/test/base/BaseTest.sol)
contract BaseTest is DSTest {
    IHevm internal immutable hevm = IHevm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);
    IVM internal immutable vm = IVM(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);
}
