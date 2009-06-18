use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Net::Delicious::RSS',
    AUTHOR              => 'Emmanuel Di Pretoro <edipretoro@gmail.com>',
    VERSION_FROM        => 'lib/Net/Delicious/RSS.pm',
    ABSTRACT_FROM       => 'lib/Net/Delicious/RSS.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Net-Delicious-RSS-*' },
);
