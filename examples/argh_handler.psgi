#!/usr/bin/env perl
use strict;
use warnings;
use FindBin qw/$Bin/;
use lib "$Bin/../t/lib";
use lib "$Bin/../lib";

use Plack::App::FakeApache;

# To test a minimal mod_perl handler 

Plack::App::FakeApache->new(
    handler    => 'ArghHandler',
    dir_config => {},
)->to_app;
