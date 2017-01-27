use MSneddonContigFilterPerl::MSneddonContigFilterPerlImpl;

use MSneddonContigFilterPerl::MSneddonContigFilterPerlServer;
use Plack::Middleware::CrossOrigin;



my @dispatch;

{
    my $obj = MSneddonContigFilterPerl::MSneddonContigFilterPerlImpl->new;
    push(@dispatch, 'MSneddonContigFilterPerl' => $obj);
}


my $server = MSneddonContigFilterPerl::MSneddonContigFilterPerlServer->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler = Plack::Middleware::CrossOrigin->wrap( $handler, origins => "*", headers => "*");
