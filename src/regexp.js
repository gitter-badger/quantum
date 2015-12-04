'use strict';

module.exports = function (opts) {
	opts = opts || {};
	//Only for bitcoin addresses just for now
	var regex = '(?:[13][a-km-zA-HJ-NP-Z0-9]{26,33})';

	return opts.exact ? new RegExp('(?:^' + regex + '$)') :
						new RegExp(regex, 'g');
};
