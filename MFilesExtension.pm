#======================================================================
# MFiles extension for LemonLDAP::NG
#
# This library is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see L<http://www.gnu.org/licenses/>.
#
# Copyright 2014 Clement OUDOT <coudot AT linagora.com>
#======================================================================
package MFilesExtension;

use strict;
use LWP::UserAgent;
use JSON;

our $VERSION = '1.0.0';

sub getMFilesToken {
    my $portal = shift;
    my ( $user, $password, $vault, $url ) = splice @_;

    # Get a token for the user
    my $ua = LWP::UserAgent->new();

    my $data =
      { "Username" => $user, "password" => $password, "VaultGuid" => $vault };
    my $json = encode_json $data;

    my $response = $ua->post(
        $url,
        'Content'      => $json,
        'Content-Type' => "application/json"
    );

    unless ( $response->is_success ) {
        print STDERR "Unable to get MFiles token for $user, got "
          . $response->status_line;
        return;
    }

    my $json_response = decode_json $response->decoded_content;

    return $json_response->{"Value"};
}

1;

