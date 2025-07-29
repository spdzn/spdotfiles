/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./src/background.ts":
/*!***************************!*\
  !*** ./src/background.ts ***!
  \***************************/
/***/ (() => {

eval("\n// Listen for extension installation or update\nchrome.runtime.onInstalled.addListener(() => {\n    console.log('Reject Cookies extension installed/updated');\n});\n// Listen for messages from content scripts\nchrome.runtime.onMessage.addListener((message, sender, sendResponse) => {\n    if (message.type === 'cookiePopupFound') {\n        console.log('Cookie popup found on:', sender.tab?.url);\n    }\n    return true;\n});\n\n\n//# sourceURL=webpack://reject-cookies/./src/background.ts?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = {};
/******/ 	__webpack_modules__["./src/background.ts"]();
/******/ 	
/******/ })()
;