package Net::Delicious::RSS;

use warnings;
use strict;

use parent qw( Exporter );

our @EXPORT = ();
our @EXPORT_OK = qw(
);
our %EXPORT_TAGS = (
    all => [
        qw(  )
    ],
);

=head1 NAME

Net::Delicious::RSS - Query and parse RSS feeds from Delicious

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

    use Net::Delicious::RSS qw( get_popular );

    my $feeds = get_popular();
   
    foreach my $feed (@$feeds) {
      
    }


=head1 EXPORT

=over 4

=item get_popular

=item get_userposts

=item get_tagposts

=item get_urlposts

=back

=head1 FUNCTIONS

=head2 get_popular

=cut

sub get_popular {
}

=head2 get_userposts

=cut

sub get_userposts {
}

=head2 get_tagposts

=cut

sub get_tagposts {
}

=head2 get_urlposts

=cut

sub get_urlposts {
}

=head1 AUTHOR

Emmanuel Di Pretoro, C<< <edipretoro at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-net-delicious-rss at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Net-Delicious-RSS>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::Delicious::RSS


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Net-Delicious-RSS>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Net-Delicious-RSS>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Net-Delicious-RSS>

=item * Search CPAN

L<http://search.cpan.org/dist/Net-Delicious-RSS/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Emmanuel Di Pretoro, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Net::Delicious::RSS
