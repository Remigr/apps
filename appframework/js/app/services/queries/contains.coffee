###

ownCloud - App Framework

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


# A query for returning a list with elements that contain the search term
angular.module('OC').factory '_ContainsQuery', ['_Query',
(_Query) ->

	class ContainsQuery extends _Query

		constructor: (@_field, @_value) ->
			name = 'contains'
			super(name, [@_field, @_value])


		exec: (data) ->
			filtered = []
			for entry in data
				if entry[@_field].indexOf(@_value) != -1
					filtered.push(entry)

			return filtered


	return ContainsQuery
]

