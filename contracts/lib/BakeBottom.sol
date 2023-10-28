// SPDX-License-Identifier: MIT
// author: @stevieraykatz
pragma solidity 0.8.19;

import {BakeryCommon} from "./BakeryCommon.sol";

library BakeBottom {
  string constant SEG8 =
    '" d="M 11.5,122.5 C 12.552,122.351 13.552,122.517 14.5,123C 18.5259,125.93 22.5259,128.763 26.5,131.5C 27.8717,132.512 29.205,133.512 30.5,134.5C 29.1266,134.657 27.7932,134.49 26.5,134C 22.7594,131.268 18.7594,128.934 14.5,127C 12.5614,126.092 11.5614,124.592 11.5,122.5 Z"/></g>';
  string constant SEG18 =
    '" d="M 116.5,177.5 C 119.579,178.304 122.579,179.304 125.5,180.5C 126.807,181.153 128.14,181.82 129.5,182.5C 130.965,181.391 131.965,181.891 132.5,184C 135.855,184.488 138.522,185.988 140.5,188.5C 131.933,185.88 123.933,182.214 116.5,177.5 Z"/></g>';
  string constant SEG27 =
    '" d="M 245.5,235.5 C 249.595,235.808 253.595,236.641 257.5,238C 261.221,240.527 265.221,242.527 269.5,244C 270.381,244.708 271.047,245.542 271.5,246.5C 262.43,243.594 253.764,239.927 245.5,235.5 Z"/></g>';
  string constant SEG28 =
    '" d="M 338.5,246.5 C 334.891,252.305 329.558,254.971 322.5,254.5C 322.703,252.956 323.37,251.622 324.5,250.5C 323.624,249.749 322.624,249.249 321.5,249C 323.154,248.392 324.821,247.892 326.5,247.5C 330.566,247.693 334.566,247.36 338.5,246.5 Z"/></g>';
  string constant SEG29 =
    '" d="M 310.5,249.5 C 311.791,250.473 311.791,251.473 310.5,252.5C 312.045,253.452 313.712,253.785 315.5,253.5C 316.552,253.351 317.552,253.517 318.5,254C 314.774,255.043 315.107,255.543 319.5,255.5C 317.866,256.161 316.033,256.494 314,256.5C 308.169,255.972 302.336,255.472 296.5,255C 292.386,254.885 288.719,253.718 285.5,251.5C 286.222,251.082 286.722,250.416 287,249.5C 287.333,250.167 287.667,250.833 288,251.5C 290.081,250.667 292.248,250.667 294.5,251.5C 295.239,251.631 295.906,251.464 296.5,251C 295.446,249.612 295.28,248.112 296,246.5C 296.637,248.303 297.803,249.636 299.5,250.5C 303.094,249.574 306.76,249.241 310.5,249.5 Z"/></g>';

  // s3 => BOTTOM = 8, 18, 27, 28, 29
  function getBottom(string memory s3) public pure returns (string memory bottom) {
    string memory seg8 = string.concat(BakeryCommon.PREFIX, s3, SEG8);
    string memory seg18 = string.concat(BakeryCommon.PREFIX, s3, SEG18);
    string memory seg27 = string.concat(BakeryCommon.PREFIX, s3, SEG27);
    string memory seg28 = string.concat(BakeryCommon.PREFIX, s3, SEG28);
    string memory seg29 = string.concat(BakeryCommon.PREFIX, s3, SEG29);
    bottom = string(abi.encodePacked(seg8, seg18, seg27, seg28, seg29));
  }
}