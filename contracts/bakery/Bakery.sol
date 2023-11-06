// SPDX-License-Identifier: MIT
// author: @stevieraykatz
pragma solidity 0.8.19;

/*
for source img, see baguettes/baguetteBase.svg
for region labeling, see  baguettes/baguetteKey.svg
*/

import {Background} from "./Background.sol";
import {BakeryCommon} from "./BakeryCommon.sol";
import {BakeBody} from "./BakeBody.sol";
import {BakeBottom} from "./BakeBottom.sol";
import {BakeCrisp} from "./BakeCrisp.sol";
import {BakeCuts} from "./BakeCuts.sol";
import {BakeLightBody} from "./BakeLightBody.sol";
import {BakeFrance} from "./BakeFrance.sol";

library Bakery {
  string constant HEADER =
    '<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="350px" height="350px" style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd" xmlns:xlink="http://www.w3.org/1999/xlink">';
  string constant FOOTER = "</svg>";

  function getBaguette(
    string memory bg,
    string memory s1,
    string memory s2,
    string memory s3,
    string memory s4,
    string memory s5,
    string memory s6
  ) public pure returns (string memory baguette) {
    string memory background = Background.getBackground(bg, s5);
    string memory crisp = BakeCrisp.getCrisp(s1);
    string memory cuts = BakeCuts.getCuts(s2);
    string memory bottom = BakeBottom.getBottom(s3);
    string memory body = BakeBody.getBody(s4);
    string memory lightBody = BakeLightBody.getLightBody(s5);
    string memory france = BakeFrance.getFrance(s6);

    baguette = string(
      abi.encodePacked(HEADER, background, crisp, cuts, bottom, body, lightBody, france, FOOTER)
    );
  }
}
