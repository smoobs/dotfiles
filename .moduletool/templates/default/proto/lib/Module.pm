package [% module.name %];

use warnings;
use strict;

use Carp;

=head1 NAME

[% module.name %] - [One line description of module's purpose here]

=head1 VERSION

This document describes [% module.name %] version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

  use [% module.name %];
  
=head1 DESCRIPTION

=head1 INTERFACE 

=head2 C<< new >>

=cut

1;
__END__

=head1 CONFIGURATION AND ENVIRONMENT
  
[% module.name %] requires no configuration files or environment variables.

=head1 DEPENDENCIES

None.

=head1 INCOMPATIBILITIES

None reported.

=head1 BUGS AND LIMITATIONS

Please report any bugs or feature requests to
C<bug-[% module.dist FILTER lower %]@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.

=head1 AUTHOR

[% author.name %]  C<< <[% author.email %]> >>

=head1 LICENCE AND COPYRIGHT

Copyright (c) [% meta.year %], [% author.name %]  C<< <[% author.email %]> >>.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.
