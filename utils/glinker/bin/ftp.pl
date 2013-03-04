#!/usr/bin/perl -w
##################################################
##
## (c) RTS-Ukraine, 2002
##
##  ftp reader:
##     ftp.pl {-p|-g} -d REMOTE_DIR  -s FILE
##      -p - put
##      -g - get
##      -d DIR - working remote directory
##      -s FILE - file to proceed
##
use Net::FTP;
use LWP;

my $IS_PROXY = 0;
#my $HOST = "shadow";
my $PROXY = "192.168.0.40";
#my $LOGIN = "dima";
#my $PASSWD = "dima";

my $HOST = "www.rts-ukraine.com";
my $LOGIN = "rts-ukra";
my $PASSWD = "NA1OST6g";

my $ftp;

sub login() {
	if( $IS_PROXY > 0 ) {
 	  $ftp = Net::FTP->new( $PROXY, Debug => 0 );
	  $ftp->login( $LOGIN."\@".$HOST, $PASSWD );
	} else {
 	    $ftp = Net::FTP->new( $HOST, Debug => 0 );
		$ftp->login( $LOGIN, $PASSWD );
	  }
	return $ftp;
}

sub transfer_dir_files() {
	my ( $src, $dst ) = @_;
	$ftp->cwd( $dst );
	
    opendir( DIR, $src ) || die "can't opendir $src: $!";
    @listdir = readdir( DIR );
    foreach $i ( @listdir ){
	  if( $i eq "." || $i eq ".." || -d $src."/".$i ) {
	    next;
	  }
	  print "> Transferring $i ...\n";
	  $ftp->put( $src."/".$i );
	  print "> done\n";
	}
	close( DIR );
}

sub transfer_files() {
	my ( $dst, @listdir ) = @_;
	$ftp->cwd( $dst );

	foreach $i ( @listdir ){
	  if( $i eq "." || $i eq ".." || -d $i ) {
	    next;
	  }
	  print "> transferring $i ...";
	  $ftp->put( $i );
	  print "ok\n";
	}
}

sub list_dir() {
	my ( $dst ) = @_;
	@lsd = $ftp->ls( $dst );
	print "Dir /$dst/ :".join("\n",@lsd);
	print "\n";		
}

#####################################################
#
#  Reading command line arguments 
#
	my ( $destf, $srcf, $destdir, @srcfiles, $is_list, $is_put, $is_get );
	foreach $item(@ARGV) {
	 for( $item ){
	   if(/-d/){ $destf = 1; next; }
	   if(/-s/){ $destf = 0; $srcf = 1; next; }
	   if(/-l/){ $is_list = 1; $srcf = 0; $destf = 1; next; }
	   if(/-p/){ $is_put = 1; $srcf = 0; $destf = 0; next; }
	   if(/-g/){ $is_get = 1; $srcf = 0; $destf = 0; next; }
	   if( $destf ){
	     $destdir = $item;
	   }
	   if( $srcf ){
		 push( @srcfiles, $item );
	   }
	 }
	}
	
	if( $is_put && $is_get ) {
	  print "> Error: options -g and -p can't defined both !\n";
	  exit( 1 );
	}
	
	if( !$is_put && !$is_get && !$is_list ) {
	  print "> What can I do ???\n> Options -p, -g or -l must be defined !\n";
	  exit( 1 );
	}

  # Login	
	print "> User $LOGIN logged in\n" if &login;
	if( $is_put ){ 
	  &transfer_files( $destdir, @srcfiles );
	  print "> transfer complete\n";
	}
	
  # Getting listing
	if( $is_list ){
	  &list_dir( $destdir );
	}
	
    print "> quit\n";
 	$ftp->quit;
	
