#!/usr/bin/perl -w

# $Id: setup.pl,v 1.9 2004/05/15 14:15:04 jonasbn Exp $

use strict;
use vars qw($VERSION %opts);
use Env qw(HOME);
use lib qw(lib ../lib);
use Getopt::Std;
use Module::Template::Setup;

getopts('dhb:l:', \%opts);

my $modulename = $ARGV[0] || help();

if ($opts{'h'}) {
	help();
}

if ($opts{'d'}) {

	use Data::Dumper;
	print STDERR Dumper \%opts;
	
	print STDERR "\$modulename = $modulename\n" if $modulename;

}

my $mts = Module::Template::Setup->new(
	modulename     => $modulename,
	configfile     => "$HOME/.mts/mts.ini",
	licensename    => $opts{'l'},
);
$mts->setup(
	build   => $opts{'b'},
	debug   => $opts{'d'}?1:0,
);

exit(0);

sub help {

print <<ENDHELP;
setup.pl [options] <modulename>

Options
	-h : help message (this message)
	-b <build target> : build type (defaults to make)
	-l <license type> : license type (defaults to perl)
	-d : debug flag

License types and build targets are explained in the POD for Module::Template::Setup.

ENDHELP

	exit(0);
}

__END__

=head1 NAME

setup.pl - script utilizing Module::Template::Setup to build a module

=head1 SYNOPSIS

=head1 ABSTRACT

=head1 DESCRIPTION

=head1 BUGS

Please report issues via CPAN RT:

  http://rt.cpan.org/NoAuth/Bugs.html?Dist=Module-Template-Setup

or by sending mail to

  bug-Module-Template-Setup@rt.cpan.org

=head1 SEE ALSO

=over 4

=item *

Module::Template::Setup

=back

=head1 AUTHOR

Jonas B. Nielsen (jonasbn) - <E>jonasbn@cpan.orgE<gt>

=head1 COPYRIGHT

Module::Template::Setup is (C) by Jonas B. Nielsen (jonasbn) 2004

Module::Template::Setup is free software and is released under the
Artistic License. 
See <http://www.perl.com/language/misc/Artistic.html> for details.

=cut
