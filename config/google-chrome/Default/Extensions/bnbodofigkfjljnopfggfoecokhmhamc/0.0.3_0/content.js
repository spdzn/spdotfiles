/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./src/checks.ts":
/*!***********************!*\
  !*** ./src/checks.ts ***!
  \***********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   checkForACookie: () => (/* binding */ checkForACookie),
/* harmony export */   checkForCC: () => (/* binding */ checkForCC),
/* harmony export */   checkForCmplz: () => (/* binding */ checkForCmplz),
/* harmony export */   checkForCookieBot: () => (/* binding */ checkForCookieBot),
/* harmony export */   checkForCookieYes: () => (/* binding */ checkForCookieYes),
/* harmony export */   checkForDidomi: () => (/* binding */ checkForDidomi),
/* harmony export */   checkForDrCookie: () => (/* binding */ checkForDrCookie),
/* harmony export */   checkForGeneric: () => (/* binding */ checkForGeneric),
/* harmony export */   checkForOneTrust: () => (/* binding */ checkForOneTrust),
/* harmony export */   checkForTranscend: () => (/* binding */ checkForTranscend),
/* harmony export */   checkForTrustArc: () => (/* binding */ checkForTrustArc),
/* harmony export */   checkForTrustee: () => (/* binding */ checkForTrustee),
/* harmony export */   checkForUCGDPR: () => (/* binding */ checkForUCGDPR),
/* harmony export */   checkForUserCentrics: () => (/* binding */ checkForUserCentrics)
/* harmony export */ });
const checkForOneTrust = () => !!document.getElementById('onetrust-consent-sdk');
const checkForTranscend = () => !!document.getElementById('transcend-consent-manager');
const checkForCookieBot = () => !!document.getElementById('CybotCookiebotDialog');
const checkForUserCentrics = () => !!document.getElementById('usercentrics-root') ||
    !!document.getElementById('usercentrics-cmp-ui');
const checkForDidomi = () => !!document.getElementById('didomi-popup') || !!document.getElementById('didomi-host');
const checkForTrustArc = () => !!document.getElementById('truste-consent-track');
const checkForCookieYes = () => !!document.querySelector('.cky-consent-container');
const checkForDrCookie = () => !!document.getElementById('dr_cookie_banner_container');
const checkForUCGDPR = () => !!document.getElementById('uc-gdpr-notification');
const checkForCC = () => !!document.getElementById('cc--main');
const checkForGeneric = () => !!document.getElementById('gdpr-banner-container');
const checkForTrustee = () => !!document.getElementById('truste-consent-track');
const checkForCmplz = () => !!document.getElementById('cmplz-cookiebanner-container');
const checkForACookie = () => !!document.getElementById('a-cookie--message');


/***/ }),

/***/ "./src/providers.ts":
/*!**************************!*\
  !*** ./src/providers.ts ***!
  \**************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   commonCookiePopupChecks: () => (/* binding */ commonCookiePopupChecks)
/* harmony export */ });
/* harmony import */ var _checks__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./checks */ "./src/checks.ts");
/* harmony import */ var _rejectFlows__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./rejectFlows */ "./src/rejectFlows/index.ts");


const commonCookiePopupChecks = [
    {
        name: 'onetrust',
        check: _checks__WEBPACK_IMPORTED_MODULE_0__.checkForOneTrust,
        rejectOrClose: _rejectFlows__WEBPACK_IMPORTED_MODULE_1__.closeOrRejectOneTrust,
        successful: false,
    },
    {
        name: 'transcend',
        check: _checks__WEBPACK_IMPORTED_MODULE_0__.checkForTranscend,
        rejectOrClose: _rejectFlows__WEBPACK_IMPORTED_MODULE_1__.closeTranscend,
        successful: false,
    },
    {
        name: 'cookieyes',
        check: _checks__WEBPACK_IMPORTED_MODULE_0__.checkForCookieYes,
        rejectOrClose: _rejectFlows__WEBPACK_IMPORTED_MODULE_1__.closeOrRejectCookieYes,
        successful: false,
    },
    {
        name: 'cookiebot',
        check: _checks__WEBPACK_IMPORTED_MODULE_0__.checkForCookieBot,
        rejectOrClose: _rejectFlows__WEBPACK_IMPORTED_MODULE_1__.rejectCookieBot,
        successful: false,
    },
    {
        name: 'usercentrics',
        check: _checks__WEBPACK_IMPORTED_MODULE_0__.checkForUserCentrics,
        rejectOrClose: _rejectFlows__WEBPACK_IMPORTED_MODULE_1__.rejectUserCentrics,
        successful: false,
    },
    {
        name: 'didomi',
        check: _checks__WEBPACK_IMPORTED_MODULE_0__.checkForDidomi,
        rejectOrClose: _rejectFlows__WEBPACK_IMPORTED_MODULE_1__.closeOrRejectDidomi,
        successful: false,
    },
    {
        name: 'trustarc',
        check: _checks__WEBPACK_IMPORTED_MODULE_0__.checkForTrustArc,
        rejectOrClose: _rejectFlows__WEBPACK_IMPORTED_MODULE_1__.closeOrRejectTrustArc,
        successful: false,
    },
    {
        name: 'dr',
        check: _checks__WEBPACK_IMPORTED_MODULE_0__.checkForDrCookie,
        rejectOrClose: _rejectFlows__WEBPACK_IMPORTED_MODULE_1__.closeOrRejectDrCookie,
        successful: false,
    },
    {
        name: 'uc-gdpr',
        check: _checks__WEBPACK_IMPORTED_MODULE_0__.checkForUCGDPR,
        rejectOrClose: _rejectFlows__WEBPACK_IMPORTED_MODULE_1__.rejectOrCloseUCGDPR,
        successful: false,
    },
    {
        name: 'cc',
        check: _checks__WEBPACK_IMPORTED_MODULE_0__.checkForCC,
        rejectOrClose: _rejectFlows__WEBPACK_IMPORTED_MODULE_1__.closeOrRejectCC,
        successful: false,
    },
    {
        name: 'generic',
        check: _checks__WEBPACK_IMPORTED_MODULE_0__.checkForGeneric,
        rejectOrClose: _rejectFlows__WEBPACK_IMPORTED_MODULE_1__.closeOrRejectGeneric,
        successful: false,
    },
    {
        name: 'trustee',
        check: _checks__WEBPACK_IMPORTED_MODULE_0__.checkForTrustee,
        rejectOrClose: _rejectFlows__WEBPACK_IMPORTED_MODULE_1__.closeOrRejectTrustee,
        successful: false,
    },
    {
        name: 'cmplz',
        check: _checks__WEBPACK_IMPORTED_MODULE_0__.checkForCmplz,
        rejectOrClose: _rejectFlows__WEBPACK_IMPORTED_MODULE_1__.closeOrRejectCmplz,
        successful: false,
    },
    {
        name: 'acookie',
        check: _checks__WEBPACK_IMPORTED_MODULE_0__.checkForACookie,
        rejectOrClose: _rejectFlows__WEBPACK_IMPORTED_MODULE_1__.closeOrRejectACookie,
        successful: false,
    },
];


/***/ }),

/***/ "./src/rejectFlows/index.ts":
/*!**********************************!*\
  !*** ./src/rejectFlows/index.ts ***!
  \**********************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   closeOrRejectACookie: () => (/* binding */ closeOrRejectACookie),
/* harmony export */   closeOrRejectCC: () => (/* binding */ closeOrRejectCC),
/* harmony export */   closeOrRejectCmplz: () => (/* binding */ closeOrRejectCmplz),
/* harmony export */   closeOrRejectCookieYes: () => (/* binding */ closeOrRejectCookieYes),
/* harmony export */   closeOrRejectDidomi: () => (/* binding */ closeOrRejectDidomi),
/* harmony export */   closeOrRejectDrCookie: () => (/* binding */ closeOrRejectDrCookie),
/* harmony export */   closeOrRejectGeneric: () => (/* binding */ closeOrRejectGeneric),
/* harmony export */   closeOrRejectOneTrust: () => (/* binding */ closeOrRejectOneTrust),
/* harmony export */   closeOrRejectTrustArc: () => (/* binding */ closeOrRejectTrustArc),
/* harmony export */   closeOrRejectTrustee: () => (/* binding */ closeOrRejectTrustee),
/* harmony export */   closeTranscend: () => (/* binding */ closeTranscend),
/* harmony export */   rejectCookieBot: () => (/* binding */ rejectCookieBot),
/* harmony export */   rejectOrCloseUCGDPR: () => (/* binding */ rejectOrCloseUCGDPR),
/* harmony export */   rejectUserCentrics: () => (/* binding */ rejectUserCentrics)
/* harmony export */ });
/* harmony import */ var _userCentrics__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./userCentrics */ "./src/rejectFlows/userCentrics.ts");

const closeOrRejectOneTrust = () => {
    const rejectButton = document.getElementById('onetrust-reject-all-handler');
    if (rejectButton) {
        rejectButton.click();
        return true;
    }
    const consentSDK = document.getElementById('onetrust-consent-sdk');
    if (consentSDK) {
        consentSDK.remove();
        return true;
    }
    return false;
};
// transcend is running their popup in a shadow DOM,
// so we cannot reject it and instead opt to remove the element.
const closeTranscend = () => {
    const popUp = document.getElementById('transcend-consent-manager');
    if (!popUp) {
        return false;
    }
    popUp.remove();
    return true;
};
const rejectCookieBot = () => {
    const popUp = document.getElementById('CybotCookiebotDialog');
    if (!popUp) {
        return false;
    }
    const rejectButton = document.getElementById('CybotCookiebotDialogBodyButtonDecline');
    if (rejectButton) {
        rejectButton.click();
        return true;
    }
    return false;
};
// UserCentrics is running their popup in a shadow DOM, that is open
const rejectUserCentrics = () => {
    let rejected = (0,_userCentrics__WEBPACK_IMPORTED_MODULE_0__.rejectUserCentricsPrimaryFlow)();
    if (rejected) {
        return true;
    }
    rejected = (0,_userCentrics__WEBPACK_IMPORTED_MODULE_0__.rejectUserCentricsSecondaryFlow)();
    if (rejected) {
        return true;
    }
    return (0,_userCentrics__WEBPACK_IMPORTED_MODULE_0__.rejectUserCentricsTertiaryFlow)();
};
const rejectOrCloseUCGDPR = () => {
    const popup = document.getElementById('uc-gdpr-notification');
    if (!popup) {
        return false;
    }
    const rejectBtn = document.getElementById('uc-reject-gdpr');
    if (rejectBtn) {
        rejectBtn.click();
        return true;
    }
    popup.remove();
    return true;
};
const closeOrRejectDidomi = () => {
    const popUp = document.getElementById('didomi-popup');
    if (!popUp) {
        //if not in the popup flow, check the footer
        const footer = document.getElementById('didomi-host');
        if (footer) {
            footer.remove();
            return true;
        }
        return false;
    }
    // First check for the reject span with a button role
    const rejectSpan = popUp.querySelector('.didomi-continue-without-agreeing');
    if (rejectSpan) {
        rejectSpan.click();
        return true;
    }
    // Second check for the reject button with a button role
    const rejectButton = popUp.querySelector('#didomi-notice-disagree-button');
    if (rejectButton) {
        rejectButton.click();
        return true;
    }
    return false;
};
const closeOrRejectTrustArc = () => {
    const declineAllBtn = document.getElementById('truste-consent-required');
    if (declineAllBtn) {
        declineAllBtn.click();
        return true;
    }
    const popUp = document.getElementById('truste-consent-track');
    if (popUp) {
        popUp.remove();
        return true;
    }
    return false;
};
const closeOrRejectCookieYes = () => {
    const rejectButton = document.querySelector('[data-cky-tag="reject-button"]');
    if (rejectButton) {
        rejectButton.click();
        return true;
    }
    const banner = document.querySelector('.cky-consent-container');
    if (banner) {
        banner.remove();
        return true;
    }
    return false;
};
const closeOrRejectDrCookie = () => {
    const rejectbtn = document.getElementById('cc-deny-01');
    if (rejectbtn) {
        rejectbtn.click();
        return true;
    }
    return false;
};
const closeOrRejectCC = () => {
    const rejectButton = document.getElementById('c-s-bn');
    if (rejectButton) {
        rejectButton.click();
        return true;
    }
    const popUp = document.getElementById('cc--main');
    if (popUp) {
        popUp.remove();
        return true;
    }
    return false;
};
const closeOrRejectGeneric = () => {
    const rejectBtn = document.querySelector('[data-testid="gdpr-banner-decline-button"]');
    if (rejectBtn) {
        rejectBtn.click();
        return true;
    }
    const popUp = document.getElementById('gdpr-banner-container');
    if (popUp) {
        popUp.remove();
        return true;
    }
    return false;
};
const closeOrRejectTrustee = () => {
    const popUp = document.getElementById('truste-consent-track');
    if (popUp) {
        popUp.remove();
        return true;
    }
    return false;
};
const closeOrRejectCmplz = () => {
    const rejectButton = document.querySelector('.cmplz-deny');
    if (rejectButton) {
        rejectButton.click();
        return true;
    }
    const popUp = document.getElementById('cmplz-cookiebanner-container');
    if (popUp) {
        popUp.remove();
        return true;
    }
    return false;
};
const closeOrRejectACookie = () => {
    const rejectButton = document.getElementById('a-cookie--confirmation-reject');
    if (rejectButton) {
        rejectButton.click();
        return true;
    }
    const popUp = document.querySelector('.a-cookie');
    if (popUp) {
        popUp.remove();
        return true;
    }
    return false;
};


/***/ }),

/***/ "./src/rejectFlows/userCentrics.ts":
/*!*****************************************!*\
  !*** ./src/rejectFlows/userCentrics.ts ***!
  \*****************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   rejectUserCentricsPrimaryFlow: () => (/* binding */ rejectUserCentricsPrimaryFlow),
/* harmony export */   rejectUserCentricsSecondaryFlow: () => (/* binding */ rejectUserCentricsSecondaryFlow),
/* harmony export */   rejectUserCentricsTertiaryFlow: () => (/* binding */ rejectUserCentricsTertiaryFlow)
/* harmony export */ });
const rejectUserCentricsPrimaryFlow = () => {
    const shadowDOMHost = document.getElementById('usercentrics-root');
    if (!shadowDOMHost) {
        return false;
    }
    const rejectBtn = shadowDOMHost.shadowRoot?.querySelector('[data-testid="uc-deny-all-button"]');
    if (rejectBtn) {
        rejectBtn.click();
        return true;
    }
    shadowDOMHost.remove();
    return true;
};
const rejectUserCentricsSecondaryFlow = () => {
    const shadowDOMHost = document.getElementById('usercentrics-cmp-ui');
    if (!shadowDOMHost) {
        return false;
    }
    const rejectBtn = shadowDOMHost.shadowRoot?.getElementById('deny');
    if (rejectBtn) {
        rejectBtn.click();
        return true;
    }
    shadowDOMHost.remove();
    return true;
};
const rejectUserCentricsTertiaryFlow = () => {
    const shadowDOMHost = document.getElementById('usercentrics-root');
    if (!shadowDOMHost) {
        return false;
    }
    // go into a menu
    const adjustBtn = document.querySelector('[data-testid="gdpr-banner-decline-button"]');
    if (!adjustBtn) {
        return false;
    }
    adjustBtn.click();
    // click on the reject all button
    const rejectBtn = shadowDOMHost.shadowRoot?.querySelector('[data-testid="uc-deny-all-button"]');
    if (rejectBtn) {
        rejectBtn.click();
        return true;
    }
    return false;
};


/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry needs to be wrapped in an IIFE because it needs to be isolated against other modules in the chunk.
(() => {
/*!************************!*\
  !*** ./src/content.ts ***!
  \************************/
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _providers__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./providers */ "./src/providers.ts");

const MAX_ATTEMPTS = 5;
let currentAttempt = 0;
// Function to find and click reject buttons
const findAndClickRejectButtons = () => {
    if (currentAttempt > MAX_ATTEMPTS) {
        return;
    }
    _providers__WEBPACK_IMPORTED_MODULE_0__.commonCookiePopupChecks.forEach(({ check, rejectOrClose, successful }) => {
        if (check() && !successful) {
            successful = rejectOrClose();
            // assume that there is only one cookie consent provider and we can exit
            return;
        }
    });
    currentAttempt++;
};
// Run the functions when the page loads
document.addEventListener('DOMContentLoaded', () => {
    findAndClickRejectButtons();
});
// Also run periodically to catch dynamically loaded popups
setInterval(() => {
    findAndClickRejectButtons();
}, 501);

})();

/******/ })()
;
//# sourceMappingURL=content.js.map