use strict;
use warnings;

use Test::More;

use Plack::Test;
use Plack::App::FakeApache;
use FindBin qw/$Bin/;
use lib "$Bin/lib";

use HTTP::Request::Common;

my $app = Plack::App::FakeApache->new(
    handler    => 'Plack::Handler::Apache2',
    dir_config => {
        psgi_app => 'examples/simple.psgi',
    },
    request_class => 'TestRequest',
)->to_app;

test_psgi
    app    => $app,
    client => sub {
        my $cb = shift;
        my $res = $cb->(GET "/");
        like $res->content, qr/Hello World/;
    };

done_testing;
