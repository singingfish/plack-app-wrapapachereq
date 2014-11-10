package TestRequest;
use FindBin qw/$Bin/;
use lib "$Bin/../../lib"; 
use parent qw/Plack::App::FakeApache::Request/;
1;
