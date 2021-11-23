#!/r/bin/perl
use strict;
use warnings;

# with this script you can add 2 binary numbers and get their sum as binary number
# https://theweeklychallenge.org/blog/perl-weekly-challenge-140/#TASK1

# get input
print "decimal number a: ";
my $a = <STDIN>;
chomp $a;
my $power_n  = 0;
my $a_binary = 0;
$a_binary += decimal_to_binary( $power_n, $a, $a_binary );
printf( "binary number a: %i\n", $a_binary );
printf( "binary number b: %i\n", dec_to_bin($a) );
printf( "binary number b: %i\n", dec_to_bin_end_rec($a) );

# convert dec to bin
sub decimal_to_binary {
    my ( $power, $decimal_number, $binary_quantum ) = @_;

    if ( $decimal_number == 0 ) {
        return 0;
    }

    if ( $decimal_number == 2**$power ) {
        $binary_quantum += 10**$power;
        return $binary_quantum;
    }

    if ( $decimal_number > 2**$power && $decimal_number < 2**( $power + 1 ) ) {
        print "if\n$decimal_number\n$power\n\n";
        $binary_quantum += 10**$power;
        $decimal_number -= 2**($power);
        $power = 0;
        return decimal_to_binary( $power, $decimal_number, $binary_quantum );
    }

    $power++;
    return decimal_to_binary( $power, $decimal_number, $binary_quantum );
}

sub dec_to_bin {
    my ($n) = @_;

    my $acc = '';
    while ( $n >= 1 ) {
        my $rem = $n % 2;
        $n   = int( $n / 2 );
        $acc = $rem . $acc;
    }
    return $acc;
}

sub dec_to_bin_end_rec {
    my ($n) = @_;

    return _dec_to_bin_end_rec( $n, '' ) || 0;
}

sub _dec_to_bin_end_rec {
    my ( $n, $acc ) = @_;

    if ( $n == 0 ) {
        return $acc;
    }

    my $next = int( $n / 2 );
    my $rem  = $n % 2;

    return _dec_to_bin_end_rec( $next, $rem . $acc );
}

sub dec_to_oct {
    my ($n) = @_;

    if ( $n <= 1 ) {
        return $n;
    }

    my $next = int( $n / 16 );
    my $rem  = $n % 16;


    return dec_to_bin($next) . $rem;
}

sub dec_to_bin_rec {
    my ($n) = @_;

    if ( $n <= 1 ) {
        return $n;
    }

    my $next = int( $n / 2 );
    my $rem  = $n % 2;

    return dec_to_bin($next) . $rem;
}

sub _decimal_to_binary {
    my ( $power, $decimal_number, $binary_quantum ) = @_;
    if ( $decimal_number == 0 ) {
        return 0;
    }
    elsif ( $decimal_number == 2**$power ) {
        print "if\n$decimal_number\n$power\n\n";
        $binary_quantum *= 10**$power;
        return $binary_quantum;
    }
    elsif ( $decimal_number <= 2**( $power + 1 ) ) {
        $power++;
        print "elsif\n$decimal_number\n$power\n\n";
        _decimal_to_binary( $power, $decimal_number, $binary_quantum );
    }
    else {
        $binary_quantum += 10**( $power + 1 );
        $decimal_number -= 2**( $power + 1 );
        $power = 0;
        print "else\n$decimal_number\n$power\n\n";
        _decimal_to_binary( $power, $decimal_number, $binary_quantum );
    }
}
