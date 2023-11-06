// SPDX-License-Identifier: MIT
// author: @stevieraykatz
pragma solidity 0.8.19;

import {BakeryCommon} from "./BakeryCommon.sol";

library BakeBody {

  string constant SEG43 = '<path d="m62.5,100.5h1c.765-.423,1.598-.757,2.5-1,2.337,1.308,4.837,2.308,7.5,3,1.657,3.076,3.49,3.743,5.5,2,1.766.733,3.599,1.067,5.5,1h4c.157,1.373-.01,2.707-.5,4-1.507-1.035-3.007-.868-4.5.5-1.259.923-2.592,1.757-4,2.5.774,1.211,1.607,1.211,2.5,0,.725,1.658,1.892,2.158,3.5,1.5-.457-.414-.791-.914-1-1.5,2.807-1.488,5.641-2.821,8.5-4,2.724.303,5.224,1.136,7.5,2.5-1.333.333-2.667.667-4,1,3.796.924,7.462,1.258,11,1,1.939.908,2.939,2.408,3,4.5-.617.111-1.117.444-1.5,1-3.643-.727-6.476-1.727-8.5-3-2.174.544-4.174.544-6,0-1.333.667-2.667,1.333-4,2-1.183-2.145-2.683-2.145-4.5,0-3.682-.219-7.516-.219-11.5,0-1.603,1.177-2.936,1.011-4-.5.667-.333,1.333-.667,2-1-1.27-.9-2.27-2.066-3-3.5.345,1.882-.155,3.882-1.5,6-1.32-.299-2.82-.466-4.5-.5-1.488-1.717-3.321-2.884-5.5-3.5-.354,2.307-1.354,2.641-3,1-.945.405-1.612,1.072-2,2-.085-1.585-.251-2.918-.5-4-.667.667-1.333,1.333-2,2-1.849-1.093-3.516-2.426-5-4-.333.667-.667,1.333-1,2-1.811-1.327-3.811-2.327-6-3,.667-.667,1.333-1.333,2-2-.438-1.006-1.104-1.006-2,0-.498-1.103-.831-2.103-1-3-1.981.605-2.315,1.605-1,3-.876.751-1.876,1.251-3,1.5,3.816,1.249,3.65,2.415-.5,3.5-1.625-.789-3.125-1.789-4.5-3,.59-1.299,1.59-2.132,3-2.5-1.172-.419-2.172-1.085-3-2,2.416-1.161,4.416-2.828,6-5-.333-.333-.667-.667-1-1,3.899-1.371,7.899-2.538,12-3.5.692.525,1.192,1.192,1.5,2,3.262-1.341,3.762-1.008,1.5,1,1.835.928,2.168,2.094,1,3.5,1.921.36,3.588,1.194,5,2.5,2.695-1.678,5.361-3.344,8-5Z" style="fill:';
  string constant SEG44 = '<path d="m79.5,99.5c5.263-.369,9.596,1.464,13,5.5,5.352,1.009,10.352,3.009,15,6,10.874,4.182,21.874,8.182,33,12,2.333,1.667,4.667,3.333,7,5,11.159,4.193,22.159,8.527,33,13,.881.708,1.547,1.542,2,2.5-2.971.567-5.805,1.567-8.5,3-.671-.752-1.504-1.086-2.5-1-3.286-.429-6.453-.429-9.5,0-3.057-1.295-6.057-3.295-9-6-3.927-.931-8.094-.931-12.5,0-1.697-.399-3.363-.899-5-1.5,1.196-.654,1.196-1.154,0-1.5-4.703.323-9.536.99-14.5,2-.333-.333-.667-.667-1-1-1.948.609-3.782,1.276-5.5,2-4.947-.4-9.947.1-15,1.5,5.21,1.907,6.21,5.074,3,9.5.149,1.82.816,3.32,2,4.5-.333.333-.667.667-1,1,1.135.749,2.135.583,3-.5.338-3.662,1.505-4.329,3.5-2,1.5-1.167,3-2.333,4.5-3.5-.63-1.892-1.63-3.559-3-5,.333-.167.667-.333,1-.5,1.649,2.15,3.482,4.15,5.5,6,.324-2.069,1.158-2.402,2.5-1,.751-.876,1.251-1.876,1.5-3,1.538,1.829,1.038,3.329-1.5,4.5.333.333.667.667,1,1-.971,1.204-1.971,1.704-3,1.5,1.151,1.231,2.317,1.231,3.5,0,.333,1,.667,2,1,3,.36-2.108,1.027-4.108,2-6,.915.828,1.581,1.828,2,3,1.943-1.307,3.777-1.307,5.5,0,1.909,2.762,2.909,5.595,3,8.5-2.252-.05-3.918-1.216-5-3.5-.925,1.141-1.759,1.141-2.5,0-.333,1.667-.667,3.333-1,5-.667-2.667-1.333-2.667-2,0-3.11-1.173-3.277-.673-.5,1.5-.333.333-.667.667-1,1-1.833-.471-3.666-1.304-5.5-2.5-.167.333-.333.667-.5,1,.645,1.232.811,2.565.5,4,.893-1.211,1.726-1.211,2.5,0-1.229.781-2.562,1.281-4,1.5,1.671,1.844,3.671,2.51,6,2-1-.333-2-.667-3-1,1.27-.9,2.27-2.066,3-3.5,1.656,1.522,2.823,1.189,3.5-1,.333,1,.667,2,1,3,.333-.333.667-.667,1-1,1.6,1.366,3.433,2.366,5.5,3-.774,1.211-1.607,1.211-2.5,0-.928,1.835-2.094,2.168-3.5,1l-3,3c.809,1.571,1.143,3.238,1,5-2.921-1.196-5.921-2.196-9-3-28.039-12.983-56.039-26.483-84-40.5-.881-.708-1.547-1.542-2-2.5-1.295-.988-2.628-1.988-4-3-.557-2.449-.557-4.782,0-7,1.501,1.252,3.167,2.252,5,3-.561-1.566.106-2.899,2-4,.781,1.237,1.781,2.237,3,3,1.196-.346,1.196-.846,0-1.5,2-.667,4-.667,6,0,.455,3.742,1.788,4.242,4,1.5-1.315-2.996-3.648-4.496-7-4.5,1.756-.202,3.422-.702,5-1.5-.477-.978-1.143-1.811-2-2.5,3.533-.903,6.867-.57,10,1-2.759,2.484-2.426,3.65,1,3.5-.039-1.859.794-3.192,2.5-4,.728,3.564,2.228,3.898,4.5,1-.086.996.248,1.829,1,2.5-1.91.408-2.91,1.575-3,3.5,2.822,2.296,2.489,5.129-1,8.5,1.399.595,2.732.428,4-.5,1.332,2.163,3.166,3.83,5.5,5,.667-1,.667-2,0-3-1.41-1.287-2.91-2.454-4.5-3.5,3.811-2.599,3.811-4.932,0-7,1.333-.667,1.333-1.333,0-2,.5-.167,1-.333,1.5-.5,1.697.978,2.864,2.144,3.5,3.5-.457.414-.791.914-1,1.5.654,1.615,1.154,3.282,1.5,5,.308-.808.808-1.475,1.5-2,2.345,2.014,4.345,4.347,6,7,1.22,1.211,2.387,1.211,3.5,0,1.284,1.072,1.617,2.405,1,4,.915-.828,1.581-1.828,2-3,3.333,1,3.333,2,0,3-.667,1-.667,2,0,3,.915-2.48,2.415-3.147,4.5-2,1.691-1.756,3.691-2.256,6-1.5v6c1,.667,2,.667,3,0,.561-1.676,1.561-3.009,3-4-2.667-.667-2.667-1.333,0-2-1.333-.667-1.333-1.333,0-2-3.277.201-6.61.368-10,.5-.667-2.333-1.333-4.667-2-7,2.549.061,4.049,1.394,4.5,4,1.017-2.528,2.184-2.528,3.5,0,1.342-1.402,2.176-1.069,2.5,1,.923-1.259,1.757-2.592,2.5-4,1.728,4.117,3.395,4.45,5,1,.333.667.667,1.333,1,2,1.811-1.236,3.644-1.236,5.5,0,.5-.167,1-.333,1.5-.5-1.333-.667-1.333-1.333,0-2-1.172-.419-2.172-1.085-3-2,1.612-.72,3.112-.554,4.5.5.442-2.179,1.442-2.845,3-2,.456-1.244-.044-2.077-1.5-2.5.881-.708,1.547-1.542,2-2.5,2.357-.163,4.69.003,7,.5,2.741,2.249,5.741,2.749,9,1.5-1.306-1.412-2.14-3.079-2.5-5-.414.457-.914.791-1.5,1-3.989-.607-7.989-1.273-12-2-2.379-2.226-4.712-3.559-7-4-.061-2.092-1.061-3.592-3-4.5-3.538.258-7.204-.076-11-1,1.333-.333,2.667-.667,4-1-2.276-1.364-4.776-2.197-7.5-2.5-2.859,1.179-5.693,2.512-8.5,4,.209.586.543,1.086,1,1.5-1.608.658-2.775.158-3.5-1.5-.893,1.211-1.726,1.211-2.5,0,1.408-.743,2.741-1.577,4-2.5,1.493-1.368,2.993-1.535,4.5-.5.49-1.293.657-2.627.5-4h-4c.418-.722,1.084-1.222,2-1.5-1.466-.635-2.8-1.469-4-2.5-1.505,2.631-2.171,2.297-2-1-3.017-.056-3.35-.39-1-1Z" style="fill:';
  string constant SEG45 = '<path d="m149.5,143.5c5.745,1.781,11.412,2.948,17,3.5,1.993,1.999,4.327,3.499,7,4.5,1.333-1,1.333-2,0-3-2.371-.392-3.038-1.392-2-3,.996-.086,1.829.248,2.5,1,2.695-1.433,5.529-2.433,8.5-3,5.98,1.157,11.313,3.657,16,7.5,23.018,8.344,45.684,17.51,68,27.5.03.997-.47,1.664-1.5,2-5.338-3.113-11.005-5.447-17-7l-1,1c-1.944-1.721-4.11-3.054-6.5-4-5.459-1.162-11.126-2.828-17-5-3.53.857-6.863.857-10,0-.692.525-1.192,1.192-1.5,2-1.204-.971-1.704-1.971-1.5-3-1,1.333-2,1.333-3,0-1.083.865-1.249,1.865-.5,3,1.815.744,3.648,1.411,5.5,2-2.06,1.311-4.226,1.311-6.5,0-1.927,1.262-1.76,2.262.5,3-.333.667-.667,1.333-1,2-1.183-1.004-2.516-1.838-4-2.5,1.333-.667,1.333-1.333,0-2,.667-1.333,1.667-2.333,3-3-1.724-.448-2.391-1.282-2-2.5-.692.525-1.192,1.192-1.5,2-2.147-.976-4.314-.809-6.5.5l1,1c-.764,2.069-1.264,4.236-1.5,6.5-.192-2.077-.692-4.077-1.5-6-1.248.54-2.415,1.207-3.5,2-.333-.667-.667-1.333-1-2-2.071,2.916-3.405,2.582-4-1-.417,1.256-1.25,1.923-2.5,2,.27-2.813.77-5.479,1.5-8-1,1.333-2,2.667-3,4,.227-2.074.061-4.074-.5-6-2.912-.568-5.912-.568-9,0-.203-1.89.463-3.39,2-4.5-1.769-1.064-3.436-2.231-5-3.5-2.445.445-4.779.445-7,0-1.196-.346-1.196-.846,0-1.5-1.581-.707-3.081-1.54-4.5-2.5-1.706.808-2.539,2.141-2.5,4-1.052.149-2.052-.017-3-.5.333-1.667.667-3.333,1-5-1.256-.417-1.923-1.25-2-2.5Z" style="fill:';
  string constant SEG46 = '<path d="m176.5,171.5c.438-.065.772.101,1,.5-.825,1.688-1.825,1.855-3,.5-.742,1.85-1.742,2.516-3,2,4.147.667,8.147,1.334,12,2,1.561.748,2.895,1.914,4,3.5-1.863,1.418-2.363,3.251-1.5,5.5,1.193-1.478,1.693-2.812,1.5-4,1.299.59,2.132,1.59,2.5,3,.17-2.215.837-4.215,2-6,.388.928,1.055,1.595,2,2-.027-1.288.973-2.288,3-3,.667,1.333,1.333,1.333,2,0,1.779,1.517,1.279,2.351-1.5,2.5,2.333.333,4.667.667,7,1-.667.333-1.333.667-2,1,1.449,1.117,3.116,1.784,5,2-1.894,1.079-2.227,2.413-1,4-1.284.684-2.451.517-3.5-.5-.626,2.491-1.459,2.491-2.5,0-1.114,1.223-1.281,2.556-.5,4h5c1.397,2.568,2.564,2.401,3.5-.5-.145-.772-.478-1.439-1-2,2.307-.337,4.14.496,5.5,2.5,1.487-.753,1.654-1.586.5-2.5,2.254-1.775,3.921-1.108,5,2-.405.945-1.072,1.612-2,2,1,.333,2,.667,3,1-1.104,1.131-.771,1.965,1,2.5,1.247-1.506,1.247-3.006,0-4.5,2.732-.398,4.565-1.898,5.5-4.5.667,1.333,1.333,1.333,2,0,.163,1.887-.671,3.387-2.5,4.5,1,.333,2,.667,3,1,1.333.667,1.333,1.333,0,2,1,.667,2,.667,3,0l-1-1c2.227-.121,4.06-.954,5.5-2.5,1.362,1.936,3.195,3.269,5.5,4,1.168,1.406.835,2.572-1,3.5,1.146.645,2.146,1.478,3,2.5.563-2.209,1.896-3.709,4-4.5-.088-1.578-.088-3.078,0-4.5.787.742,1.453,1.575,2,2.5-1.211,1.113-1.211,2.28,0,3.5-1.03.054-2.197.388-3.5,1-.495,1.973-.662,3.973-.5,6,4.798.399,8.798,2.399,12,6,2.693-.645,5.193-.645,7.5,0,2.168,1.322,2.001,1.989-.5,2-2.797.467-4.131,2.133-4,5-1.322-.17-2.489.163-3.5,1-.333-1.333-.667-2.667-1-4-.654,1.196-1.154,1.196-1.5,0,1.09-1.109,1.09-2.109,0-3-1.032,1.54-2.365,2.04-4,1.5-1.211-1.113-1.211-2.28,0-3.5-1.507-1.239-2.674-.905-3.5,1l-1-1c-1.648,1.217-3.481,2.05-5.5,2.5.667.333,1.333.667,2,1-1.945-.128-3.778.038-5.5.5-1.377-2.092-3.21-3.758-5.5-5,.193,1.188-.307,2.522-1.5,4-1.293-1.786-1.793-3.453-1.5-5-.927,1.613-1.761,3.279-2.5,5-.451-2.429-1.285-2.596-2.5-.5,2.784,2.08,2.451,2.747-1,2-.522-.561-.855-1.228-1-2,1.115-1.393,1.615-2.893,1.5-4.5-1.816-.829-3.649-1.663-5.5-2.5,1.123-1.044,2.456-1.71,4-2-2.667-.667-2.667-1.333,0-2l-1.5-1.5c-1,1.333-2,2.667-3,4-1.667-1.333-3.333-1.333-5,0-1.378-2.354-2.878-2.354-4.5,0-3.235-.531-6.402-1.198-9.5-2-.414.457-.914.791-1.5,1-4.901-3.15-6.401-2.15-4.5,3,1.581-2.075,3.415-2.075,5.5,0-.209.586-.543,1.086-1,1.5,1.504,1.491,2.337,3.324,2.5,5.5.893-1.211,1.726-1.211,2.5,0-1.189.929-2.522,1.262-4,1-12.34-4.669-24.34-10.169-36-16.5-2.601-.92-5.268-1.587-8-2-4.173-2.981-8.506-5.481-13-7.5-1.978-2.512-4.645-4.012-8-4.5-.535-2.109-1.535-2.609-3-1.5-1.36-.68-2.693-1.347-4-2,.143-1.762-.191-3.429-1-5l3-3c1.406,1.168,2.572.835,3.5-1,.893,1.211,1.726,1.211,2.5,0-2.067-.634-3.9-1.634-5.5-3-.333.333-.667.667-1,1-.333-1-.667-2-1-3-.677,2.189-1.844,2.522-3.5,1-.73,1.434-1.73,2.6-3,3.5,1,.333,2,.667,3,1-2.329.51-4.329-.156-6-2,1.438-.219,2.771-.719,4-1.5-.774-1.211-1.607-1.211-2.5,0,.311-1.435.145-2.768-.5-4,.167-.333.333-.667.5-1,1.834,1.196,3.667,2.029,5.5,2.5.333-.333.667-.667,1-1-2.777-2.173-2.61-2.673.5-1.5.667-2.667,1.333-2.667,2,0,.333-1.667.667-3.333,1-5,.741,1.141,1.575,1.141,2.5,0,1.082,2.284,2.748,3.45,5,3.5-.091-2.905-1.091-5.738-3-8.5,1.322-.17,2.489.163,3.5,1-.164-3.65,1.003-4.483,3.5-2.5-2.868,2.894-3.368,6.061-1.5,9.5.977-2.24,1.477-4.573,1.5-7h4c-.219-1.175.114-2.175,1-3,1.832,1.798,2.165,3.632,1,5.5,1.244.456,2.077-.044,2.5-1.5,3.197,2.876,2.364,4.543-2.5,5,.83,1.635.997,3.302.5,5,1-.333,2-.667,3-1,1.427-3.226,2.927-6.392,4.5-9.5-.951-.718-1.117-1.551-.5-2.5,1.074,1.118,2.24,2.118,3.5,3-1.408.743-2.741,1.577-4,2.5,1.785,1.163,3.785,1.83,6,2-1.859.684-3.526,1.684-5,3,.667.333,1.333.667,2,1-1.365,1.682-2.865,1.849-4.5.5-2.033,1.85-2.033,2.516,0,2,.308.808.808,1.475,1.5,2,1.22-1.211,2.387-1.211,3.5,0,2.59-.95,4.59-2.616,6-5l1,1c.689-.857,1.522-1.523,2.5-2,2.052,1.234,3.719,2.9,5,5-.742.787-1.575,1.453-2.5,2-.667-2.667-1.333-2.667-2,0-.612-2.532-2.112-3.365-4.5-2.5,2.667,1.333,2.667,2.667,0,4,1.435-.311,2.768-.145,4,.5,2.048-1.27,4.048-1.603,6-1,1.683-2.014,3.683-3.68,6-5,.333.167.667.333,1,.5-.876,1.586-1.876,3.086-3,4.5.124.607.457.94,1,1Z" style="fill:';
  string constant SEG47 = '<path d="m325.5,220.5c-1.413,1.491-2.913,2.158-4.5,2-1.803-1.984-2.803-3.984-3-6-1.202,4.293-.035,7.793,3.5,10.5-.544.717-1.211,1.217-2,1.5-.992.172-1.658-.162-2-1-.42-1.594-1.086-3.094-2-4.5.145-.772.478-1.439,1-2-3.258-.003-5.925-1.17-8-3.5,1.354-.706,3.021-.706,5,0,1.196-.346,1.196-.846,0-1.5-1.87-1.366-3.87-2.533-6-3.5-1.303,1.218-2.303.885-3-1-1.542,1.247-3.042,1.247-4.5,0-.333.667-.667,1.333-1,2-1.491-1.504-3.324-2.337-5.5-2.5-1.333-.667-1.333-1.333,0-2-1-.667-2-.667-3,0,.951.718,1.117,1.551.5,2.5-.923-1.259-1.757-2.592-2.5-4-2.737-.569-4.237-2.236-4.5-5-.689.857-1.522,1.523-2.5,2-.925-1.141-1.759-1.141-2.5,0-.928-1.835-2.094-2.168-3.5-1-1.672-2.606-2.006-5.273-1-8,1.052.149,2.052-.017,3-.5-.951-.718-1.117-1.551-.5-2.5.915.828,1.581,1.828,2,3,.333-.333.667-.667,1-1,.7,1.532,1.866,2.532,3.5,3,.168-1.447.834-3.113,2-5,1.196.346,1.196.846,0,1.5,1.124.249,2.124.749,3,1.5-1.524,1.193-3.524,2.526-6,4,1.556,2.201,2.723,2.201,3.5,0,1.011.837,2.178,1.17,3.5,1-.149,1.052.017,2.052.5,3,1.419-.96,2.919-1.793,4.5-2.5-.667-.667-1.333-1.333-2-2,2.429-.159,4.762-.492,7-1,.333.333.667.667,1,1-1.185,1.353-2.519,2.52-4,3.5.789,1.988,1.955,2.321,3.5,1,.034,1.68.201,3.18.5,4.5,1.576.388,2.909-.112,4-1.5,1.141-.925,1.141-1.759,0-2.5.833-.167,1.667-.333,2.5-.5,2.258,1.878,4.425,3.211,6.5,4,.498-1.103.831-2.103,1-3,.762,1.128,1.429,2.295,2,3.5-1.333.667-2.667,1.333-4,2,2.189.677,2.522,1.844,1,3.5,1.223,1.114,2.556,1.281,4,.5-1.473-.71-2.14-1.876-2-3.5,1.052-.149,2.052.017,3,.5-1.134,1.016-.801,1.683,1,2-.951.718-1.117,1.551-.5,2.5l3-3c.645,1.146,1.478,2.146,2.5,3-1.151,1.231-2.317,1.231-3.5,0-.749,1.135-.583,2.135.5,3,2.366-1.484,3.699-.817,4,2Z" style="fill:';
  string constant SEG48 = '<path d="m325.5,206.5c4.265,2.749,8.431,5.749,12.5,9,1.989,3.855,3.823,7.855,5.5,12-1.464,6.391-3.131,12.724-5,19-3.934.86-7.934,1.193-12,1,1.644-.816,2.81-2.15,3.5-4,.333.333.667.667,1,1,.483-.948.649-1.948.5-3,4.445-.001,5.778-2.001,4-6,1.606-2.09,2.106-4.424,1.5-7-.333.667-.667,1.333-1,2-.85-.924-1.85-.924-3,0-1.221-.772-2.221-1.772-3-3-1.459,1.932-2.625,3.932-3.5,6-.549-2.187-1.715-2.854-3.5-2-.985-1.314-2.152-2.314-3.5-3,.789-.283,1.456-.783,2-1.5-3.535-2.707-4.702-6.207-3.5-10.5.197,2.016,1.197,4.016,3,6,1.587.158,3.087-.509,4.5-2,.876.131,1.543-.202,2-1-.502-1.216-.835-2.383-1-3.5.808-.308,1.475-.808,2-1.5-2.445-.192-4.445-1.692-6-4.5,1.556-.72,2.556-1.887,3-3.5Z" style="fill:';

  function getBody(string memory color) public pure returns (string memory body) {
    string memory seg43 = string.concat(SEG43, color, BakeryCommon.SUFFIX);
    string memory seg44 = string.concat(SEG44, color, BakeryCommon.SUFFIX);
    string memory seg45 = string.concat(SEG45, color, BakeryCommon.SUFFIX);
    string memory seg46 = string.concat(SEG46, color, BakeryCommon.SUFFIX);
    string memory seg47 = string.concat(SEG47, color, BakeryCommon.SUFFIX);
    string memory seg48 = string.concat(SEG48, color, BakeryCommon.SUFFIX);
    
    body = string(abi.encodePacked(seg43, seg44, seg45, seg46, seg47, seg48));
  }
}
