// SPDX-License-Identifier: MIT
// author: @stevieraykatz
pragma solidity 0.8.19;

import {BakeryCommon} from "./BakeryCommon.sol";

library Text {

    string constant SEG3 = '<path d="m46.715,68.062c.833,3.771,1.25,9.379,1.25,16.822,0,9.896-.702,17.341-2.105,22.335-1.404,4.996-3.738,7.492-7.002,7.492H12.595V13.779h25.988c2.967,0,5.119,2.215,6.454,6.644,1.335,4.431,2.003,10.838,2.003,19.225,0,5.372-.32,9.732-.958,13.076-.64,3.347-1.575,5.584-2.808,6.715v1.131c1.461,1.226,2.608,3.724,3.441,7.492Zm-11.659-21.77c0-4.994-.719-7.492-2.157-7.492h-9.073v14.985h9.073c1.438,0,2.157-2.496,2.157-7.493Zm.616,36.189c0-5.464-.787-8.199-2.362-8.199h-9.484v16.398h9.484c1.575,0,2.362-2.732,2.362-8.199Z" style="fill:';
    string constant SEG4 = '<path d="m84.871,13.779v54.708c0,12.44-.656,22.335-1.969,29.686-1.313,7.351-3.248,12.605-5.804,15.762-2.557,3.156-5.809,4.735-9.758,4.735-3.972,0-7.236-1.579-9.792-4.735-2.557-3.157-4.485-8.411-5.787-15.762-1.301-7.351-1.952-17.246-1.952-29.686V13.779h11.23v52.587c0,6.315.542,11.004,1.626,14.066,1.084,3.063,2.642,4.594,4.674,4.594,2.008,0,3.561-1.531,4.656-4.594,1.096-3.062,1.644-7.751,1.644-14.066V13.779h11.23Z" style="fill:';
    string constant SEG5 = '<path d="m87.709,114.712V13.779h11.23v100.933h-11.23Z" style="fill:';
    string constant SEG6 = '<path d="m101.857,114.712V13.779h11.23v67.147h20.03v33.786h-31.261Z" style="fill:';
    string constant SEG7 = '<path d="m163.93,18.798c2.043,3.346,3.578,8.718,4.605,16.115,1.027,7.399,1.541,17.175,1.541,29.333s-.514,21.936-1.541,29.333c-1.027,7.399-2.562,12.771-4.605,16.115-2.043,3.347-4.651,5.019-7.824,5.019h-21.673V13.779h21.673c3.173,0,5.781,1.674,7.824,5.019Zm-18.267,26.364v38.168h6.882c1.666,0,2.956-1.555,3.869-4.665.913-3.11,1.37-7.917,1.37-14.419s-.457-11.309-1.37-14.419c-.913-3.11-2.203-4.665-3.869-4.665h-6.882Z" style="fill:';
    string constant SEG8 = '<path d="m172.267,114.712V13.779h11.23v100.933h-11.23Z" style="fill:';
    string constant SEG9 = '<path d="m221.715,13.779v100.933h-12.771l-11.676-51.315h-.273v51.315h-10.58V13.779h12.908l11.539,50.608h.273V13.779h10.58Z" style="fill:';
    string constant SEG10 = '<path d="m262.21,114.854h-7.293v-11.309c-1.21,5.089-2.859,8.884-4.948,11.379-2.088,2.496-4.319,3.746-6.693,3.746-6.665,0-11.579-4.429-14.74-13.288-3.162-8.857-4.742-22.618-4.742-41.278,0-18.565,1.586-32.253,4.76-41.066,3.172-8.811,8.068-13.217,14.688-13.217,6.414,0,11.139,3.583,14.175,10.743,3.036,7.164,4.61,17.578,4.726,31.241h-13.251c-.092-1.318-.349-2.732-.771-4.241-.423-1.506-1.044-2.803-1.866-3.887-.821-1.083-1.838-1.626-3.047-1.626-2.328,0-4.098,1.933-5.308,5.796-1.21,3.865-1.814,9.471-1.814,16.822,0,7.634.622,13.43,1.866,17.388s3.109,5.937,5.598,5.937c1.302,0,2.432-.495,3.39-1.484.959-.989,1.701-2.12,2.226-3.393.525-1.272.822-2.237.891-2.898h-5.752v-20.921h17.907v55.556Z" style="fill:';
    string constant SEG11 = '<path d="m46.321,160.116h-11.539v66.017h-11.23v-66.017h-11.504v-34.917h34.273v34.917Z" style="fill:';
    string constant SEG12 = '<path d="m82.851,125.2v100.933h-11.23v-35.482h-12.806v35.482h-11.23v-100.933h11.23v34.493h12.806v-34.493h11.23Z" style="fill:';
    string constant SEG13 = '<path d="m97.002,162.661h18.695v23.184h-18.695v13.146h19.927v27.142h-31.158v-100.933h30.884v25.586h-19.653v11.875Z" style="fill:';
    string constant SEG14 = '<path d="m142.095,156.299v14.561h18.866v27.848h-18.866v27.425h-11.23v-100.933h31.124v31.1h-19.893Z" style="fill:';
    string constant SEG15 = '<path d="m199.045,125.2v54.708c0,12.439-.656,22.335-1.969,29.687-1.312,7.351-3.248,12.605-5.803,15.762-2.557,3.156-5.811,4.735-9.76,4.735-3.971,0-7.235-1.579-9.792-4.735-2.557-3.156-4.485-8.411-5.787-15.762-1.301-7.352-1.952-17.247-1.952-29.687v-54.708h11.23v52.587c0,6.314.542,11.004,1.626,14.065,1.083,3.063,2.642,4.594,4.673,4.594,2.01,0,3.562-1.53,4.658-4.594,1.096-3.062,1.643-7.751,1.643-14.065v-52.587h11.23Z" style="fill:';
    string constant SEG16 = '<path d="m234.582,160.116h-11.538v66.017h-11.23v-66.017h-11.505v-34.917h34.273v34.917Z" style="fill:';
    string constant SEG17 = '<path d="m270.907,125.2v54.708c0,12.439-.657,22.335-1.969,29.687-1.313,7.351-3.248,12.605-5.804,15.762-2.557,3.156-5.81,4.735-9.759,4.735-3.972,0-7.236-1.579-9.792-4.735-2.557-3.156-4.485-8.411-5.787-15.762-1.301-7.352-1.951-17.247-1.951-29.687v-54.708h11.23v52.587c0,6.314.542,11.004,1.626,14.065,1.084,3.063,2.643,4.594,4.674,4.594,2.009,0,3.562-1.53,4.657-4.594,1.096-3.062,1.644-7.751,1.644-14.065v-52.587h11.23Z" style="fill:';
    string constant SEG18 = '<path d="m309.799,226.133h-12.977l-3.972-25.729h-7.909v25.729h-11.23v-100.933h24.995c3.766,0,6.454,2.898,8.062,8.694,1.609,5.796,2.414,14.631,2.414,26.505,0,8.672-.457,15.267-1.369,19.791-.913,4.524-2.203,7.634-3.869,9.33v1.414l5.854,35.199Zm-13.147-60.786c0-5.56-.8-8.34-2.396-8.34h-9.313v16.681h9.313c1.597,0,2.396-2.778,2.396-8.34Z" style="fill:';
    string constant SEG19 = '<path d="m322.546,162.661h18.694v23.184h-18.694v13.146h19.928v27.142h-31.158v-100.933h30.884v25.586h-19.653v11.875Z" style="fill:';
    string constant SEG20 = '<path d="m46.355,245.879c3.173,8.813,4.759,22.547,4.759,41.207s-1.586,32.396-4.759,41.208c-3.173,8.812-8.08,13.217-14.723,13.217s-11.55-4.404-14.723-13.217c-3.173-8.812-4.759-22.548-4.759-41.208s1.586-32.394,4.759-41.207c3.173-8.811,8.081-13.218,14.723-13.218s11.55,4.407,14.723,13.218Zm-9.364,57.676c1.221-3.816,1.832-9.306,1.832-16.469s-.611-12.651-1.832-16.469c-1.221-3.816-3.008-5.725-5.358-5.725s-4.138,1.908-5.358,5.725c-1.222,3.817-1.832,9.308-1.832,16.469s.61,12.652,1.832,16.469c1.221,3.817,3.007,5.726,5.358,5.726s4.137-1.908,5.358-5.726Z" style="fill:';
    string constant SEG21 = '<path d="m64.354,267.72v14.561h18.866v27.848h-18.866v27.425h-11.23v-100.934h31.124v31.101h-19.893Z" style="fill:';
    string constant SEG22 = '<path d="m109.208,267.72v14.561h18.866v27.848h-18.866v27.425h-11.23v-100.934h31.124v31.101h-19.893Z" style="fill:';
    string constant SEG23 = '<path d="m167.384,337.553h-12.977l-3.972-25.729h-7.909v25.729h-11.23v-100.934h24.995c3.767,0,6.454,2.898,8.063,8.694s2.414,14.631,2.414,26.506c0,8.671-.457,15.267-1.37,19.79-.914,4.524-2.203,7.634-3.869,9.33v1.414l5.855,35.199Zm-13.148-60.786c0-5.56-.799-8.341-2.397-8.341h-9.313v16.682h9.313c1.598,0,2.397-2.779,2.397-8.341Z" style="fill:';
    string constant SEG24 = '<path d="m194.505,325.819h-13.113l-1.438,11.733h-12.326l13.148-100.934h14.414l13.046,100.934h-12.292l-1.438-11.733Zm-6.711-54c-1.005,8.764-2.066,17.953-3.184,27.565h6.676c-1.142-9.705-2.214-18.895-3.218-27.565h-.274Z" style="fill:';
    string constant SEG25 = '<path d="m244.337,236.619v100.934h-12.771l-11.676-51.314h-.273v51.314h-10.58v-100.934h12.908l11.539,50.608h.273v-50.608h10.58Z" style="fill:';
    string constant SEG26 = '<path d="m269.698,269.062c-1.005-2.778-2.409-4.17-4.212-4.17-2.169,0-3.841,1.908-5.016,5.725-1.176,3.817-1.764,9.308-1.764,16.469s.588,12.652,1.764,16.469c1.175,3.817,2.847,5.726,5.016,5.726,1.85,0,3.271-1.484,4.263-4.453.993-2.969,1.559-6.856,1.695-11.662h13.285c-.092,16.397-1.689,28.555-4.794,36.472-3.104,7.916-7.875,11.874-14.312,11.874-6.528,0-11.361-4.429-14.5-13.288-3.139-8.857-4.708-22.569-4.708-41.137s1.569-32.277,4.708-41.137c3.139-8.857,7.972-13.288,14.5-13.288,6.414,0,11.174,3.842,14.278,11.521,3.104,7.682,4.69,19.25,4.759,34.704h-13.25c-.137-3.768-.708-7.044-1.712-9.824Z" style="fill:';
    string constant SEG27 = '<path d="m298.021,274.081h18.694v23.184h-18.694v13.146h19.928v27.142h-31.158v-100.934h30.884v25.587h-19.653v11.875Z" style="fill:';

    function getText1(string memory color) public pure returns (string memory text1) {
        string memory seg3 = string.concat(SEG3, color, BakeryCommon.SUFFIX);
        string memory seg4 = string.concat(SEG4, color, BakeryCommon.SUFFIX);
        string memory seg5 = string.concat(SEG5, color, BakeryCommon.SUFFIX);
        string memory seg6 = string.concat(SEG6, color, BakeryCommon.SUFFIX);
        string memory seg7 = string.concat(SEG7, color, BakeryCommon.SUFFIX);
        string memory seg8 = string.concat(SEG8, color, BakeryCommon.SUFFIX);
        string memory seg9 = string.concat(SEG9, color, BakeryCommon.SUFFIX);
        string memory seg10 = string.concat(SEG10, color, BakeryCommon.SUFFIX);
        string memory seg11 = string.concat(SEG11, color, BakeryCommon.SUFFIX);
        string memory seg12 = string.concat(SEG12, color, BakeryCommon.SUFFIX);

        text1 = string(abi.encodePacked(
            seg3,
            seg4,
            seg5,
            seg6,
            seg7,
            seg8,
            seg9,
            seg10,
            seg11,
            seg12
        ));
    }

    function getText2(string memory color) public pure returns (string memory text2) {
        string memory seg13 = string.concat(SEG13, color, BakeryCommon.SUFFIX);
        string memory seg14 = string.concat(SEG14, color, BakeryCommon.SUFFIX);
        string memory seg15 = string.concat(SEG15, color, BakeryCommon.SUFFIX);
        string memory seg16 = string.concat(SEG16, color, BakeryCommon.SUFFIX);
        string memory seg17 = string.concat(SEG17, color, BakeryCommon.SUFFIX);
        string memory seg18 = string.concat(SEG18, color, BakeryCommon.SUFFIX);
        string memory seg19 = string.concat(SEG19, color, BakeryCommon.SUFFIX);
        string memory seg20 = string.concat(SEG20, color, BakeryCommon.SUFFIX);
        string memory seg21 = string.concat(SEG21, color, BakeryCommon.SUFFIX);
        string memory seg22 = string.concat(SEG22, color, BakeryCommon.SUFFIX);
        text2 = string(abi.encodePacked(
            seg13,
            seg14,
            seg15,
            seg16,
            seg17,
            seg18,
            seg19,
            seg20,
            seg21,
            seg22
        ));
    }

    function getText3(string memory color) public pure returns (string memory text3) {
        string memory seg23 = string.concat(SEG23, color, BakeryCommon.SUFFIX);
        string memory seg24 = string.concat(SEG24, color, BakeryCommon.SUFFIX);
        string memory seg25 = string.concat(SEG25, color, BakeryCommon.SUFFIX);
        string memory seg26 = string.concat(SEG26, color, BakeryCommon.SUFFIX);
        string memory seg27 = string.concat(SEG27, color, BakeryCommon.SUFFIX);
        text3 = string(abi.encodePacked(
            seg23,
            seg24,
            seg25,
            seg26,
            seg27
        ));
    }

    function getText(string memory color) public pure returns (string memory text) {
        string memory text1 = getText1(color);
        string memory text2 = getText2(color);
        string memory text3 = getText3(color);
        text = string(abi.encodePacked(
            text1,
            text2,
            text3
        ));
    }
}