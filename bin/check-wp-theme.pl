#!/usr/bin/env perl

use v5.10;

use autodie;
use strict;
use warnings;

use LWP::UserAgent;
use HTML::Parser;
use JSON;
use URI;

use constant USAGE => <<EOT;
Usage: $0 <base uri> <theme name>
EOT

die USAGE unless @ARGV == 2;

my $base  = URI->new( $ARGV[0] );
my $theme = $ARGV[1];

my $ua  = LWP::UserAgent->new;
my $res = $ua->get($base);
die $res->status_line if $res->is_error;

my $body = $res->content;

my $parser = HTML::Parser->new( api_version => 3 );

my %themes = ();

# Install handler for opening tags
$parser->handler(
  start => sub {
    my ( $tag, $attr ) = @_;
    return unless $tag eq "link";
    return unless $attr->{rel} eq "stylesheet";
    my $link = URI->new( $attr->{href} );
    return unless $link->host eq $base->host;
    return unless $link->path =~ m{/themes/([^/]+)/};
    $themes{$1}++;
  },
  "tag, attr"
);

$parser->parse($body);
$parser->eof;

exit 0 if $themes{$theme};
exit 123;

# vim:ts=2:sw=2:sts=2:et:ft=perl

