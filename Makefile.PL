use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

# Linux
WriteMakefile(
    'NAME'	=> 'Cdk',
    'VERSION'	=> '4.8',
    'LIBS'	=> ['-L/usr/local/lib -L/home/glover/cdk -lcdk -lncurses'],
    'DEFINE'	=> '-DNCURSES -DCOLOR',
    'INC'	=> '-I/usr/include/ncurses -I/home/glover/cdk',
    'clean'	=> {FILES => 'Makefile.old'},
);

# Solaris
#WriteMakefile(
#   'NAME'	=> 'Cdk',
#   'VERSION'	=> '4.8',
#   'LIBS'	=> ['-L/usr/ccs/lib -L/home/mikeg/cdk -lcdk -lcurses'],
#   'DEFINE'	=> '-DCOLOR',
#   'INC'	=> '-I/home/mikeg/cdk',	
#   'clean'	=> {FILES => 'Makefile.old'},
#);
