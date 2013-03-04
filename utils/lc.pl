#!/usr/bin/perl

&main();

sub set_color(){
    my $b = $_[0];
    my $color = $_[1];
    print "\033[".$b."m\033[3".$color."m";
}

sub main {
	### Main function ###
	my($maxwidth) = 0;
	my($mdw) = 0;
	my(%cMTime,%cExt,%hMTime,%oMTime,%oExt);
	my($file,$base,$fmt);
	my(@dirs);
	my($dir) = @ARGV[0];
	
	if($dir){
	  chdir($dir);
	}
	
	opendir(DIR,".");

	while(defined($file=readdir(DIR))){
	  if(-d $file){
	    push @dirs, $file;
		$mwd = (length($file) + 1) if (length($file)>=$mwd); 
	  }
	  
 ### Source filter ###
   	  next unless ($base) = $file =~ /(.+)(\.j|\.java|\.c|\.cpp|\.cc|\.pl|\.st|\.il)$/;
	  ($ext) = $file =~ /^$base\.(.+)/;
	  
#printf "file = $file     base = $base  ext = $ext\n";

	  $maxwidth = length($file) if (length($file)>=$maxwidth);  
	  $cMTime{$base} = (stat $file)[9];
	  $cExt{$base} = $ext;
	  
	  if( -f "$base.o" ) {
		$oMTime{$base} = (stat _)[9];	
	    $oExt{$base} = "o";
	  }
	  
	  if( -f "$base.class" ) {
		$oMTime{$base} = (stat _)[9];	
	    $oExt{$base} = "class";
	  }

	  if( -f "$base.tic" ) {
		$oMTime{$base} = (stat _)[9];	
	    $oExt{$base} = "tic";
	  }
	  
	  if( -f "$base.h" ){
		$hMTime{$base} = (stat _)[9];	
	  }
	}
	
	closedir( DIR ); 

##########################################

	$fmt = "%". ($mwd+2) . "s";
	$n = 0;
	
 ## Directories ##	
	foreach $file ( @dirs ){
	  &set_color( 1, 1 );
	  printf( $fmt, "$file/" );
	  if(++$n > 3) { print "\n"; $n=0; }
	}
	print "\n";
	
 ## Sources ##	
	$fmt = "%". ($maxwidth+2) . "s";	
	foreach $file ( sort keys %cMTime ) {
	
	  &set_color( 1, 7 );
	  printf( $fmt, "$file.$cExt{$file}" );
	  
	  if(defined($oMTime{$file})){
		&set_color( 1, 2 );
		printf( $fmt, "$file.$oExt{$file}" );
	  }
	  
	  if(defined($hMTime{$file})){
		&set_color( 0, 6 );
		printf( $fmt, "$file.h" );
	  }
	  
	  &set_color( 0, 7 );
	  print "\n";
	}
	
	if( -f "Makefile" ) {
	  &set_color( 1, 5 );
	  printf( $fmt, "Makefile\n" );
	}
}
