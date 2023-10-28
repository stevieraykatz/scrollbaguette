// SPDX-License-Identifier: MIT
// author: @stevieraykatz
pragma solidity 0.8.19;

/*
for source img, see baguettes/baguetteBase.svg
for region labeling, see  baguettes/baguetteKey.svg
*/

import {BakeryCommon} from "./BakeryCommon.sol";
import {BakeBody1} from "./BakeBody1.sol";
import {BakeBody2} from "./BakeBody2.sol";
import {BakeBottom} from "./BakeBottom.sol";
import {BakeCrisp} from "./BakeCrisp.sol";
import {BakeCuts} from "./BakeCuts.sol";
import {BakeLightBody} from "./BakeLightBody.sol";
import {BakeSuperCrisp} from "./BakeSuperCrisp.sol";

library Bakery {
  string constant HEADER =
    '<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="350px" height="350px" style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd" xmlns:xlink="http://www.w3.org/1999/xlink">';
  string constant SEG2 =
    '" d="M -0.5,-0.5 C 116.167,-0.5 232.833,-0.5 349.5,-0.5C 349.5,116.167 349.5,232.833 349.5,349.5C 232.833,349.5 116.167,349.5 -0.5,349.5C -0.5,232.833 -0.5,116.167 -0.5,-0.5 Z"/></g>';
  string constant FOOTER = "</svg>";

  /*
    bg => BG = 2;
    s1 => CRISP = 11, 12, 21
    s2 => CUTS = 3, 7, 9, 14, 15, 16, 20
    s3 => BOTTOM = 8, 18, 27, 28, 29
    s4 => BODY = 5, 10, 13, 17, 22, 25
    s5 => LIGHTBODY = 4, 6, 19, 23
    s6 => SUPERCRISP = 24, 26
*/
  function getBaguette(
    string memory bg,
    string memory s1,
    string memory s2,
    string memory s3,
    string memory s4,
    string memory s5,
    string memory s6
  ) public pure returns (string memory baguette) {
    string memory background = string.concat(BakeryCommon.PREFIX, bg, SEG2);
    string memory crisp = BakeCrisp.getCrisp(s1);
    string memory cuts = BakeCuts.getCuts(s2);
    string memory bottom = BakeBottom.getBottom(s3);
    string memory body1 = BakeBody1.getBody1(s4);
    string memory body2 = BakeBody2.getBody2(s4);
    string memory lightBody = BakeLightBody.getLightBody(s5);
    string memory superCrisp = BakeSuperCrisp.getSuperCrisp(s6);

    baguette = string(
      abi.encodePacked(HEADER, background, crisp, cuts, bottom, body1, body2, lightBody, superCrisp, FOOTER)
    );
  }
}
