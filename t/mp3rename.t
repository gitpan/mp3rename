#! -*-perl-*-

use strict;
use Test::More tests => 7;
use File::Path;

-d "t" && chdir "t";

my $orig = "test_artist_-_test_album_-_04_-_test_track.mp3";
my $x1l = -s $orig;
ok($x1l);

rmtree(["td"], 1, 1);

@ARGV = ("--target=td", $orig);
ok(require "../blib/script/mp3rename");

ok(-d "td");
ok(-d "td/Test_Artist");
ok(-d "td/Test_Artist/Test_Album");
is(-s "td/Test_Artist/Test_Album/04_Test_Track.mp3", $x1l);
rename("td/Test_Artist/Test_Album/04_Test_Track.mp3", $orig);
is(-s $orig, $x1l);

#rmtree(["td"], 1, 1);
