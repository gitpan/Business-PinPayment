#!perl -T

use strict;
use warnings;
use Test::More;

plan tests => 3;

use_ok('Business::PinPayment');

can_ok('Business::PinPayment', qw(new card_token json_response response successful error id status));

$ENV{PERL_LWP_SSL_VERIFY_HOSTNAME} = 0;

# test fail charge
my $fail_charge = Business::PinPayment->new(config => {api_key => 'TestS3cret-ap1key'});

like ($fail_charge->error(), qr/Authorization Required/, 'Invalid API Key');
