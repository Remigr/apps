###

ownCloud - News

@author Bernhard Posselt
@copyright 2012 Bernhard Posselt nukeawhale@gmail.com

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU AFFERO GENERAL PUBLIC LICENSE
License as published by the Free Software Foundation; either
version 3 of the License, or any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU AFFERO GENERAL PUBLIC LICENSE for more details.

You should have received a copy of the GNU Affero General Public
License along with this library.  If not, see <http://www.gnu.org/licenses/>.

###


angular.module('News').factory 'Persistence', ['_Persistence', 'Request',
(_Persistence, Request) ->
	return new _Persistence(Request)
]


angular.module('News').factory 'Request', ['$http', 'Publisher', 'Router',
($http, Publisher, Router) ->
	return new Request($http, Publisher, Router)
]


angular.module('News').factory 'ActiveFeed', ['_ActiveFeed', (_ActiveFeed) ->
	return new _ActiveFeed()
]


angular.module('News').factory 'ShowAll', ['_ShowAll', (_ShowAll) ->
	return new _ShowAll()
]


angular.module('News').factory 'StarredCount', ['_StarredCount', (_StarredCount) ->
	return new _StarredCount()
]


angular.module('News').factory 'Publisher', 
['_Publisher', 'ActiveFeed', 'ShowAll', 'StarredCount',
(_Publisher, ActiveFeed, ShowAll, StarredCount) ->

	publisher = new _Publisher()
	Publisher.subsribeModelTo(ActiveFeed, 'activeFeed')
	Publisher.subsribeModelTo(ShowAll, 'showAll')
	Publisher.subsribeModelTo(StarredCount, 'starredCount')

	return publisher
]