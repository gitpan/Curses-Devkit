package Cdk::Histogram;

@ISA	= qw (Cdk);

#
# This creates a new Histogram object.
#
sub new
{
   my $type		= shift;
   my %params		= @_;
   my $self		= {};
   my $name		= "${type}::new";

   # Retain the type of the object.
   $self->{'Type'}	= $type;
   
   # Set up the parameters passed in.
   my $label = Cdk::checkReq ($name, "Label", $params{'Label'});
   my $height = Cdk::checkReq ($name, "Height", $params{'Height'});
   my $width = Cdk::checkReq ($name, "Width", $params{'Width'});
   my $orient = Cdk::checkReq ($name, "Orient", $params{'Orient'});
   my $xpos = Cdk::checkDef ($name, "Xpos", $params{'Xpos'}, "CENTER");
   my $ypos = Cdk::checkDef ($name, "Ypos", $params{'Ypos'}, "CENTER");
   my $lpos = Cdk::checkDef ($name, "Lpos", $params{'Lpos'}, "LEFT");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");
   my $shadow = Cdk::checkDef ($name, "Shadow", $params{'Shadow'}, "FALSE");

   # Create the thing.
   $self->{'Me'} = Cdk::Histogram::New ($label, $height, $width, $orient,
					$xpos, $ypos, $lpos, $box, $shadow);
   bless  $self;
}

#
# This sets the values of the histogram.
#
sub set
{
   my $self		= shift;
   my %params		= @_;
   my $name		= "$self->{'Type'}::set";

   # Set up the parameters passed in.
   my $low = Cdk::checkReq ($name, "Low", $params{'Low'});
   my $high = Cdk::checkReq ($name, "High", $params{'High'});
   my $value = Cdk::checkReq ($name, "Value", $params{'Value'});
   my $filler = Cdk::checkDef ($name, "Filler", $params{'Filler'}, " ");
   my $statstype = Cdk::checkDef ($name, "Statstype", $params{'Statstype'}, "PERCENT");
   my $spos = Cdk::checkDef ($name, "Statspos", $params{'Statspos'}, "TOP");
   my $sattr = Cdk::checkDef ($name, "Sattrib", $params{'Sattrib'}, "A_BOLD");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "BOX");

   # Store the information in both the object and Perl's stack.
   Cdk::Histogram::Set ($self->{'Me'},
				$low, $high, $value,
				$filler, $statstype, $spos, $sattr, $box);
}

#
# This draws the object.
#
sub draw
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::draw";

   # Set up the parameters passed in.
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "BOX");
   
   # Draw the object.
   Cdk::Histogram::Draw ($self->{'Me'}, $box);
}

#
# This erases the object.
#
sub erase
{
   my $self	= shift;
   Cdk::Histogram::Erase ($self->{'Me'});
}

#
# This function raises the object.
#
sub raise
{
   my $self	= shift;
   Cdk::Histogram::Raise ($self->{'Me'});
}

#
# This function lowers the object.
#
sub lower
{
   my $self	= shift;
   Cdk::Histogram::Lower ($self->{'Me'});
}

#
# This function registers the object.
#
sub register
{
   my $self	= shift;
   Cdk::Histogram::Register ($self->{'Me'});
}

#
# This function unregisters the object.
#
sub unregister
{
   my $self	= shift;
   Cdk::Histogram::Unregister ($self->{'Me'});
}

#
# This function returns the pointer to the window.
#
sub getwin
{
   my $self	= shift;
   Cdk::Histogram::GetWindow ($self->{'Me'});
}

1;
