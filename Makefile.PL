
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Perl-Net-Douban',
  NAME      => 'Perl::Net::Douban',
  AUTHOR    => 'woosley\.xu',
  ABSTRACT  => 'Perl\-Net\-Douban\ based\ on\ Moose\ and\ XML\:\:Atom',
  VERSION   => '0.17',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Scalar::Util" => '0',
    "Any::Moose" => '0.09',
    "XML::Atom" => '0.35',
    "Moose" => '0.81',
  },
);
