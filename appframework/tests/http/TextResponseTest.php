<?php

/**
 * ownCloud - App Framework
 *
 * @author Bernhard Posselt
 * @copyright 2012 Bernhard Posselt nukeawhale@gmail.com
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU AFFERO GENERAL PUBLIC LICENSE
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU AFFERO GENERAL PUBLIC LICENSE for more details.
 *
 * You should have received a copy of the GNU Affero General Public
 * License along with this library.  If not, see <http://www.gnu.org/licenses/>.
 *
 */


namespace OCA\AppFramework\Http;


require_once(__DIR__ . "/../classloader.php");


class TextResponseTest extends \PHPUnit_Framework_TestCase {


	protected function setUp() {
		$this->response = new TextResponse('sometext');
	}


	public function testRender() {
		$this->assertEquals('sometext', $this->response->render());
	}

	public function testContentTypeDefaultsToText(){
		$this->assertContains('Content-type: text/plain', $this->response->getHeaders());
	}


	public function testContentTypeIsSetableViaConstructor(){
		$response = new TextResponse('sometext', 'html');

		$this->assertContains('Content-type: text/html', $response->getHeaders());
	}

}