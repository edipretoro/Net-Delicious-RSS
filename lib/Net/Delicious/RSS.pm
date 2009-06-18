package Net::Delicious::RSS;

use warnings;
use strict;

use XML::RSS::Parser;
use Carp;
use Digest::MD5 qw( md5_hex );

use parent qw( Exporter );

use constant DELICIOUS_FEED => 'http://feeds.delicious.com/v2/rss/';

our @EXPORT = ();
our @EXPORT_OK = qw(
  &get_popular
  &get_userposts
  &get_tagposts
  &get_urlposts
);
our %EXPORT_TAGS = (
    all => [
        qw( &get_popular &get_userposts &get_tagposts &get_urlposts )
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
    my $tag = shift;

    my $feed_uri = _build_tag_uri($tag);
    my $rss_parser = XML::RSS::Parser->new();
    my $feed = $rss_parser->parse_uri( $feed_uri );
    return _get_items_from_feed( $feed );
}

sub _build_tag_uri {
    my $tag = shift;
    
    my $uri = DELICIOUS_FEED . 'popular/';
    $uri .= $tag if $tag;
    
    return $uri;
}

=head2 get_userposts

=cut

sub get_userposts {
    my $user = shift;

    my $feed_uri = _build_user_uri($user);
    my $rss_parser = XML::RSS::Parser->new();
    my $feed = $rss_parser->parse_uri( $feed_uri );
    croak "Problem with $user ($feed_uri): $!" and return unless $feed;

    return _get_items_from_feed( $feed );
}

sub _build_user_uri {
    my $user = shift;

    croak 'No user given!' unless $user;
    
    my $uri = DELICIOUS_FEED . $user;
    return $uri;
}

=head2 get_tagposts

=cut

sub get_tagposts {
    my $tag = shift;

    my $feed_uri = _build_tag_uri($tag);
    my $rss_parser = XML::RSS::Parser->new();
    my $feed = $rss_parser->parse_uri( $feed_uri );
    croak "Problem with $tag ($feed_uri): $!" and return unless $feed;

    return _get_items_from_feed( $feed );
}

sub _build_tag_uri {
    my $tag = shift;

    croak 'No tag given!' unless $tag;
    
    my $uri = DELICIOUS_FEED . 'tag/' . $tag;
    return $uri;
}

=head2 get_urlposts

=cut

sub get_urlposts {
    my $url = shift;

    my $feed_uri = _build_url_uri($url);
    my $rss_parser = XML::RSS::Parser->new();
    my $feed = $rss_parser->parse_uri( $feed_uri );
    croak "Problem with $url ($feed_uri): $!" and return unless $feed;

    return _get_items_from_feed( $feed );
}

sub _build_url_uri {
    my $url = shift;

    croak 'No url given!' unless $url;
    
    my $uri = DELICIOUS_FEED . 'url/' . md5_hex($url);
    return $uri;
}

sub _get_items_from_feed {
    my $feed = shift;

    my $items = [];
    
    foreach my $item ($feed->query('//item')) {
        push @$items, {
            href => $item->query('link')->text_content,
            description => $item->query('title')->text_content,
            user => $item->query('dc:creator')->text_content,
            tags => _get_tags( $item ),
            dt => $item->query('pubDate')->text_content,
        };
    }
    
    return $items;
}

sub _get_tags {
    my $item = shift;
    my @tags;

    foreach my $category ($item->query('category')) {
        push @tags, $category->text_content;
    }

    return join(' ', @tags);
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
