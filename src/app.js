'use strict';

require('./index.html');
require('./style/normalize.css');
require('./style/nyarticles.scss');

const Elm = require('./Main.elm');
const mountNode = document.getElementById('app');
Elm.Main.embed(mountNode);
