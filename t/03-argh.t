#!/usr/bin/env perl
#
# Plack::Handler::Apache2 is a great example of a mod_perl2 application. This
# shows how to turn it into a Plack application. We are selfhosting!
#


use strict;
use warnings;

use Test::More;

use Plack::Test;
use Plack::App::FakeApache;

use HTTP::Request::Common;

my $app = Plack::App::FakeApache->new(
    handler    => 'Plack::Handler::Apache2',
    dir_config => {
        psgi_app => 'examples/argh_handler.psgi',
    }
)->to_app;

test_psgi
    app    => $app,
    client => sub {
        my $cb = shift;
        my $res = $cb->(POST '/', [ { I => 'hate'},  {mod_perl => 'It'}, 'sucks']);
        like $res->content, qr/hate/;
    };

use Test::WWW::Mechanize::PSGI;
my $mech = Test::WWW::Mechanize::PSGI->new(app => $app);
$mech->post_ok('/', [qw/abcd goldfish mno goldfish rdr goldfish/]);
use YAML;
diag Dump $mech->content;

done_testing;
