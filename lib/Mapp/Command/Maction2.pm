package Mapp::Command::Maction2;

use lib qw{../../};
use Mapp -command;

use Data::Printer;

sub abstract {
	
	return "Executes action 2";
}

sub usage_desc {
	
	# return usage description line
	"map maction2 --option1 val1 --option2"
}
 
sub opt_spec {
	
	# specify options here
	return (
		[
			"option1|o=i", 
			"set value of option 1", 
			{
				required => 1,
			}
		],
		[ 
			"option2|O", 
			"sets option 2"
		],
	);
}
 
sub validate_args {
	
	# Validate args here
	my ($self, $opt, $args) = @_;
 
	# Require that the first option should be between 0 and 10
	# and the complete "usage" text describing switches, etc
	my $opt1 = $opt->{option1};
	$self->usage_error("Option 1 must be between 0 and 10") if (($opt1 < 0) or ($opt1 > 10));
}

sub execute {
	
	my ($self, $opts, $args) = @_;
	
	p $opts;
	p $args;
	
}

1;