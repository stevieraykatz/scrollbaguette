// SPDX-License-Identifier: MIT
// author: @stevieraykatz
pragma solidity 0.8.19;

import {BakeryCommon} from "./BakeryCommon.sol";

library BakeFrance {

  string constant SEG54 = '<path d="m325.134,249.693c.178-.07.39.032.541-.07.218-.075.37-.502.038-.272-.038.228-.188-.11-.157-.216-.133-.071-.257.008-.316-.151-.05.032-.153.437.04.366.242.324-.075.264-.146.343Zm5.914-13.738c-.186,1.25,1.432,1.848.001,2.939.863.826,1.938,2.685-.113,2.733-1.231.617.966,1.297,1.015,2.165-.929.171-.678,1.479-.138,2.119,2.01.622,2.888.059,1.25,2.273-.954.18-1.215,1.112-2.226,1.555-.699.682.171.456-.367,1.028-.659-.053-1.369.296-1.7.627.324-.366-.429-.205-.628-.449-.03.267.164.353-.361.243-.013-.832-1.568-.2-1.456-1.011-1.136-.645-1.285-.302-2.42-.281-4.83-2.911-4.553,3.496-5.763,4.109-2.185,1.539-3.691-1.114-5.555-1.143-1.592-1.283-2.823,1.088-4.952-.56-1.044.459-2.788-1.675-3.395-.943-.357-.846.282-1.19-1.128-1.211,2.196-4.214,1.432-5.649,1.896-10.027.537-1.092,1.848,2.706,1.752,1.964-.859-2.867-2.29-2.817-1.607-4.271.683-.421-.976-.657-.108-1.196.103-.23-1.721-.718-2.177-1.077-.612-1.197-1.8-3.43-.676-3.766-3.357.706.11-.813-2.947-1.116,1.336.019.502-.584-.091-.168-.05-.634-.084-.093-.043.154-.244-.084-.123-.162-.298-.333.156.242.011.319-.215.254-.049.775-.072.161-.291-.374.003-.179.357-.258.208-.299-.092-.043-.955.678-.508-.297-.388.824-1.219-.32-1.591,0-.733-.593-.526-.192-1.14-.465.086-.794-.082.255-.139.342-.776.495-.52-.668-1.241-1.006-1.756-.05,2.051-.338.367-.931-.499.188-.712-.114-.356-.517-.39.5,1.434.158.93.179-.353-.099.02-.38-.404-.147-.147.02-.274.054-.199-.048-.164-.124.761-.533.384-.348-.502.066-1.515.856-1.545.007.68-1.703,2.459-1.046,3.724-1.269.445.375.147-.414.421-.624.361.19,1.251-.182,1.402-.163,1.891,3.014,1.472.295,2.832,1.193.214.324.08-.145.519-.141.69-.608.576.401,1.615.004,1.323.109-.007-.26-.086-.91,1.069-.775-2.593-5.177-.028-3.72,1.585-.955.903.834,1.508,1.295.688-.425,3.272.968,4.231-.173,2.396-.442-.518-.079.163-.332-1.249-1.978,3.977-1.509,4.386-3.368.249-.095.585.234.413-.032-.67-.455.003-1.152-.213-1.872-.12-2.332,3.46-2.551,3.879-.668.919.431,1.526-.443,1.88,1.217.914-.386,1.048.87,1.305.768.378-.052,1.095-.174,1.278.27.562.146-.512,2.123,1.452,1.403,1.331-1.613.698-.184.999.819,1.494.04,1.685,1.794,2.984,1.08.674.877,1.931-.182,2.569.782.128.182.779,1.679.936.778,8.101,1.373,1.44,1.625,2.388,7.514-.614.795-.931.729-1.829.346-.457.542-.593.557.108.724-.414.807-1.746,1.41-1.953,2.088.084.893-1.893,1.452-1.066,2.355.261.462-.885.74-.443,1.055,1.05.131,1.144-2.479,2.599-1.127Z" style="fill:';

  function getFrance(string memory color) public pure returns (string memory france) {
    france = string.concat(SEG54, color, BakeryCommon.SUFFIX);
  }
}