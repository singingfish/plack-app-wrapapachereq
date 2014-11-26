#!/usr/bin/env perl
use strict;
use warnings;
use FindBin qw/$Bin/;
use lib "$Bin/../t/lib";
use lib "$Bin/../lib";

use Plack::App::FakeApache;

# To test a minimal mod_perl handler 

Plack::App::FakeApache->new(
    handler    => 'ArghHandler2',
    dir_config => {},
	using_cgi_psgi => 1,
)->to_app;
