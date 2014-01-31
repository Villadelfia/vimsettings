/*************************************************************
 *
 *  MathJax/config/default.js
 *
 *  This configuration file is loaded when you load MathJax
 *  via <script src="MathJax.js?config=villadelfia"></script>
 *
 *  Use it to customize the MathJax settings.  See comments below.
 *
 *  ---------------------------------------------------------------------
 *  
 *  Copyright (c) 2009-2012 Design Science, Inc.
 * 
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

MathJax.Hub.Config({
  config: ["MMLorHTML.js"],
  styleSheets: [],
  styles: {},
  jax: ["input/TeX"],
  extensions: ["tex2jax.js","TeX/AMSmath.js","TeX/AMSsymbols.js"],
  preJax: null,
  postJax: null,
  preRemoveClass: "MathJax_Preview",
  showProcessingMessages: true,
  messageStyle: "normal",
  displayAlign: "center",
  displayIndent: "0em",
  delayStartupUntil: "none",
  skipStartupTypeset: false,
  elements: [],
  positionToHash: false,
  showMathMenu: true,
  showMathMenuMSIE: true,
  menuSettings: {
    zoom: "None",        //  when to do MathZoom
    CTRL: false,         //    require CTRL for MathZoom?
    ALT: false,          //    require Alt or Option?
    CMD: false,          //    require CMD?
    Shift: false,        //    require Shift?
    zscale: "200%",      //  the scaling factor for MathZoom
    font: "Auto",        //  what font HTML-CSS should use
    context: "MathJax",  //  or "Browser" for pass-through to browser menu
    mpContext: false,    //  true means pass menu events to MathPlayer in IE
    mpMouse: false,      //  true means pass mouse events to MathPlayer in IE
    texHints: true       //  include class names for TeXAtom elements
  },
  errorSettings: {
    message: ["[Math Processing Error]"], // HTML snippet structure for message to use
    style: {color: "#CC0000", "font-style":"italic"}  // style for message
  },
  tex2jax: {
    inlineMath: [['$','$']],
    displayMath: [['$$','$$']],
    balanceBraces: true,
    skipTags: ["script","noscript","style","textarea","pre","code"],
    ignoreClass: "tex2jax_ignore",
    processClass: "tex2jax_process",
    processEscapes: false,
    processEnvironments: true,
    processRefs: true,
    preview: "TeX"
  },
  TeX: {
    TagSide: "right",
    TagIndent: ".8em",
    MultLineWidth: "85%",
    Macros: {},
    equationNumbers: {
      autoNumber: "AMS",
    },
  }
});

MathJax.Ajax.loadComplete("[MathJax]/config/default.js");
