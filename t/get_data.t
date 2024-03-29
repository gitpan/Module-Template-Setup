# $Id: get_data.t,v 1.6 2004/05/15 14:15:04 jonasbn Exp $

use strict;
use Test::More tests => 2;
use lib qw(blib/lib);
use Module::Template::Setup;

my $modulename = 'This-Is-A-Test-Module';
my $mts = Module::Template::Setup->new(modulename => $modulename);

my $defaults;
ok($defaults = $mts->_get_data());

is((keys %{$defaults}), 9);

