package Mapp::Command::Maction1;

use feature qw{say};

use lib qw{../../};
use Mapp -command;

use Data::Printer;
use Mapp::Command::Maction2;

use Try::Tiny;

sub abstract {
	
	return "Executes action 1";
}

sub usage_desc {
	
	# return usage description line
	"map maction1 --option1 val1 --option2"
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
	
	my $app = $self->app;
	my ($cmd, $opts2, @args2) = $app->prepare_command(qw{maction2 -o 8 -O});

	my $valid = 1;	
	try {
		
		$cmd->validate_args($opts2, \@args2);
	}
	catch {
		$valid = 0;
		say "Caught Exception: $_"
	};
	
	$cmd->execute($opts2, \@args2) if $valid;

	p $valid;
}

1;