// SPDX-License-Identifier: MIT
// author: @stevieraykatz
pragma solidity 0.8.19;

import {BakeryCommon} from "./BakeryCommon.sol";

library BakeBottom {
  string constant SEG38 = '<path d="m11.5,122.5c1.052-.149,2.052.017,3,.5,4.026,2.93,8.026,5.763,12,8.5,1.372,1.012,2.705,2.012,4,3-1.373.157-2.707-.01-4-.5-3.741-2.732-7.741-5.066-12-7-1.939-.908-2.939-2.408-3-4.5Z" style="fill:';
  string constant SEG39 = '<path d="m116.5,177.5c3.079.804,6.079,1.804,9,3,1.307.653,2.64,1.32,4,2,1.465-1.109,2.465-.609,3,1.5,3.355.488,6.022,1.988,8,4.5-8.567-2.62-16.567-6.286-24-11Z" style="fill:';
  string constant SEG40 = '<path d="m245.5,235.5c4.095.308,8.095,1.141,12,2.5,3.721,2.527,7.721,4.527,12,6,.881.708,1.547,1.542,2,2.5-9.07-2.906-17.736-6.573-26-11Z" style="fill:';
  string constant SEG41 = '<path d="m338.5,246.5c-3.609,5.805-8.942,8.471-16,8,.203-1.544.87-2.878,2-4-.876-.751-1.876-1.251-3-1.5,1.654-.608,3.321-1.108,5-1.5,4.066.193,8.066-.14,12-1Z" style="fill:';
  string constant SEG42 = '<path d="m310.5,249.5c1.291.973,1.291,1.973,0,3,1.545.952,3.212,1.285,5,1,1.052-.149,2.052.017,3,.5-3.726,1.043-3.393,1.543,1,1.5-1.634.661-3.467.994-5.5,1-5.831-.528-11.664-1.028-17.5-1.5-4.114-.115-7.781-1.282-11-3.5.722-.418,1.222-1.084,1.5-2,.333.667.667,1.333,1,2,2.081-.833,4.248-.833,6.5,0,.739.131,1.406-.036,2-.5-1.054-1.388-1.22-2.888-.5-4.5.637,1.803,1.803,3.136,3.5,4,3.594-.926,7.26-1.259,11-1Z" style="fill:';
  
  function getBottom(string memory color) public pure returns (string memory bottom) {
    string memory seg38 = string.concat(SEG38, color, BakeryCommon.SUFFIX);
    string memory seg39 = string.concat(SEG39, color, BakeryCommon.SUFFIX);
    string memory seg40 = string.concat(SEG40, color, BakeryCommon.SUFFIX);
    string memory seg41 = string.concat(SEG41, color, BakeryCommon.SUFFIX);
    string memory seg42 = string.concat(SEG42, color, BakeryCommon.SUFFIX);
    bottom = string(abi.encodePacked(seg38, seg39, seg40, seg41, seg42));
  }
}
