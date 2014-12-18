package ArghHandler2;
use CGI::PSGI;
# use CGI;
use YAML;
use Apache2::RequestRec ();
use Apache2::Const qw(OK);

sub handler {
	my ($r) = @_;
	my $c = CGI::PSGI->new($r->plack_request->env);
	# my $c = CGI->new($r);
	my $vars = $c->Vars;
	my $param = { map { $_ => $c->param($_) } $c->param } ;
	$r->print(Dump [ $vars, $param]);
	return OK;
}

1;
