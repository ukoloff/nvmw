!function o(e,r,n){function t(s,f){if(!r[s]){if(!e[s]){var u="function"==typeof require&&require;if(!f&&u)return u(s,!0);if(i)return i(s,!0);var c=new Error("Cannot find module '"+s+"'");throw c.code="MODULE_NOT_FOUND",c}var p=r[s]={exports:{}};e[s][0].call(p.exports,function(o){var r=e[s][1][o];return t(r?r:o)},p,p.exports,o,e,r,n)}return r[s].exports}for(var i="function"==typeof require&&require,s=0;s<n.length;s++)t(n[s]);return t}({1:[function(o){var e;e=o(1),WScript.Echo("Hello from "+e.name+" v"+e.version+"!")},{1:2}],2:[function(o,e){e.exports={name:"nvms",version:"0.0.1",description:"Node Version for MS Windows",browser:"src/main",scripts:{start:"node node_modules/coffee418"},repository:{type:"git",url:"https://ukoloff@github.com/ukoloff/nvms.git"},keywords:["node","node.js","windows","misrosoft","jscript","nvm"],author:"Stas Ukolov",license:"ISC",bugs:{url:"https://github.com/ukoloff/nvms/issues"},homepage:"https://github.com/ukoloff/nvms",devDependencies:{coffee418:"0.0.1"}}},{}]},{},[1]);