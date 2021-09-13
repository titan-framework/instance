<?php

$file = 'configure/titan.xml';

if (!file_exists ($file))
{
	header ('HTTP/1.1 500 Internal Server Error');

	die ('Configuration file [configure/titan.xml] not found!');
}

$xml = file_get_contents ($file);

$regTag = '/<core-path>(.*?)<\/core-path>/s';

preg_match_all ($regTag, $xml, $match);

if (!isset ($match [1][0]))
{
	$regTag = '/core-path="(.*?)"/s';

	preg_match_all ($regTag, $xml, $match);

	if (!isset ($match [1][0]))
	{
		header ('HTTP/1.1 500 Internal Server Error');

		die ('Attribute [core-path] must be setted at configuration file [configure/titan.xml].');
	}
}

$corePath = $match [1][0];

if (!file_exists ($corePath .'switch.php'))
{
	header ('HTTP/1.1 500 Internal Server Error');

	die ('Titan core has not found in path ['. $corePath .'] specified at configuration file [configure/titan.xml].');
}

if (file_exists ('composer.json'))
{
	if (file_exists ('vendor/autoload.php'))
		require 'vendor/autoload.php';
	else
	{
		header ('HTTP/1.1 500 Internal Server Error');

		die ('Please, install dependencies using Composer (http://getcomposer.org/): "composer install --no-dev"!');
	}
}

require $corePath .'switch.php';
