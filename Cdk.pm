package Cdk;

require Exporter;
require DynaLoader;
require AutoLoader;

@ISA	= qw(Exporter DynaLoader);

# Force input buffering off.
select (STDIN); $| = 1 ;

# Set the version.
$VERSION = "4.8";

# Set the diag flag off.
$DIAGFLAG = 0;

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw (VERSION checkDef checkReq popupLabel popupDialog);

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.  If a constant is not found then control is passed
    # to the AUTOLOAD in AutoLoader.

    local($constname);
    ($constname = $AUTOLOAD) =~ s/.*:://;

    $val = constant($constname, @_ ? $_[0] : 0);

    if ($! != 0) {
	if ($! =~ /Invalid/) {
	    $AutoLoader::AUTOLOAD = $AUTOLOAD;
	    goto &AutoLoader::AUTOLOAD;
	}
	else {
	    ($pack,$file,$line) = caller;
	    die "Your vendor has not defined Cdk macro $constname, used at $file line $line.";
	}
    }
    eval "sub $AUTOLOAD { $val }";
    goto &$AUTOLOAD;
}

bootstrap Cdk;

#
# This draws a string on the given/or not window.
#
sub drawMesg
{
   my $type		= shift;
   my %params		= @_;
   my $name		= "${type}::new";
   my ($mesg, $xpos, $ypos, $attrib, $window);
   
   # Retain the type of the object.
   $self->{'Type'}      = $type;
   
   # Set up the parameters passed in.
   $mesg	= Cdk::checkReq ($name, "Mesg",   $params{'Mesg'});
   $xpos	= Cdk::checkDef ($name, "Xpos",   $params{'Xpos'},   Cdk::CENTER());
   $ypos	= Cdk::checkDef ($name, "Ypos",   $params{'Ypos'},   Cdk::CENTER());
   $attrib	= Cdk::checkDef ($name, "Attrib", $params{'Attrib'}, Cdk::A_NORMAL());
   $align	= Cdk::checkDef ($name, "Align",  $params{'Align'},  Cdk::HORIZONTAL());

   # If they passed an object, dereference its window and draw on it.
   if ($params{'Object'})
   {
      $window	= $params{'Object'}->getWindow();
   } 
   else
   {
      $window	= Cdk::getCdkWindow();
   }

   # Start drawing.
   Cdk::DrawMesg ($window, $mesg, $xpos, $ypos, $attrib, $align);
}

#
# This checks if a value has been given a value, if not, then it gives it one.
#
sub checkDef
{
   my ($type, $name, $value, $def)	= @_;

   # Check if its defined.
   if (!defined $value)
   {
      Cdk::Diag::Log ("Diag", $type, "Default parameter $name being set to default value <$def>");
      return ($def);
   }
   else
   {
      Cdk::Diag::Log ("Diag", $type, "Default parameter $name being set to value <$def>");
      return ($value);
   }
}

#
# This checks if a value has been given a value. If not it reports an error.
#
sub checkReq
{
   my ($type, $name, $value)	= @_;

   # Check if its defined.
   if (! defined $value)
   {
      # Close the Cdk screen and shut down curses.
      Cdk::end();

      # Report the error.
      Cdk::Diag::Log ("Error", $type, "Required parameter $name has no value.");

      # Get out.
      exit (1);
   }
   else
   {
      # Report the info.
      Cdk::Diag::Log ("Diag", $type, "Required parameter $name being set to <$value>");
      return ($value);
   }
}

#
# This pops up a label.
#
sub popupLabel
{
   my $mesg = shift;
 
   my $popup = new Cdk::Label ("Mesg" => $mesg);
   $popup->draw();
   $popup->wait();
}
 
#
# This pops up a question on the screen.
#
sub popupDialog
{
   my ($mesg, $buttons) = @_;
 
   my $popup = new Cdk::Dialog ('Mesg' => $mesg, 'Buttons' => $buttons);
   return $popup->activate;
}

#
# This function takes a scalar and returns a list with elements in the
# list to the given width.
#
sub scalar2List
{
   my ($scalar, $elementLen) = @_;
   my $tempLine = "";
   my $lineLen = 0;
   my @info = ();
   my $x = 0;

   # Break the scalar into a list.
   $_ = $scalar;
   my @wordList = split;

   # Put each scalar back into an array of $elementLen length or more.
   for ($x=0; $x <= $#wordList; $x++)
   {
      $lineLen += length ($wordList[$x]);
      $tempLine .= "$wordList[$x] ";

      if ($lineLen >= $elementLen)
      {
         push (@info, $tempLine);
         $tempLine = "";
         $lineLen = 0;
      }
   }
   push (@info, $tempLine);
   return @info;
}

# 
# Load the object modules.
#
use Cdk::Label;
use Cdk::Entry;
use Cdk::Mentry;
use Cdk::Dialog;
use Cdk::Histogram;
use Cdk::Scroll;
use Cdk::Menu;
use Cdk::Matrix;
use Cdk::Scale;
use Cdk::Selection;
use Cdk::Marquee;
use Cdk::Viewer;
use Cdk::Graph;
use Cdk::Radio;
use Cdk::Diag;
use Cdk::Template;
use Cdk::Swindow;
use Cdk::Itemlist;
use Cdk::Fselect;
use Cdk::Slider;
use Cdk::Alphalist;
use Cdk::Calendar;

1;
__END__
