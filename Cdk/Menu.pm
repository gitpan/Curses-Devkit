package Cdk::Menu;

@ISA	= qw (Cdk);

#
# This creates a new Menu object.
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
   my $menulist = Cdk::checkReq ($name, "Menulist", $params{'Menulist'});
   my $menuloc = Cdk::checkReq ($name, "Menuloc", $params{'Menuloc'});
   my $menuPos = Cdk::checkDef ($name, "Menupos", $params{'Menupos'}, "TOP");
   my $titleattr = Cdk::checkDef ($name, "Tattrib", $params{'Tattrib'}, "A_REVERSE");
   my $subtitleattr = Cdk::checkDef ($name, "SubTattrib", $params{'SubTattrib'}, "A_REVERSE");

   # Create the thing.
   $self->{'Me'} = Cdk::Menu::New ($params{'Menulist'},
					$params{'Menuloc'},
					$titleattr, $subtitleattr, $menuPos);
   bless $self;
}

#
# This activates the object
#
sub activate
{
   my $self		= shift;
   my %params		= @_;
   my $name		= "$self->{'Type'}::activate";
   my $itemPicked;

   # Activatate the menu
   if (defined $params{'Input'})
   {
      $itemPicked = Cdk::Menu::Activate ($self->{'Me'}, $params{'Input'});
   }
   else
   {
      $itemPicked = Cdk::Menu::Activate ($self->{'Me'});
   }

   return if !defined $itemPicked;

   $self->{'Info'}	= $itemPicked;

   # Create the menu and submenu item values and return them.
   my $menuItem		= int($itemPicked / 100);
   my $submenuItem	= ($itemPicked % 100) + 1;
   
   # Return the two values.
   return (($menuItem, $submenuItem, $itemPicked));
}

#
# This injects a character into the widget.
#
sub inject
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::inject";

   # Set the values.
   my $character = Cdk::checkReq ($name, "Input", $params{'Input'});

   return (Cdk::Menu::Inject ($self->{'Me'}, $character));
}

#
# This sets the value in the menu widget.
#
sub set
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::set";
 
   # Set the values.
   my $menu = Cdk::checkDef ($name, "Menu", $params{'Menu'}, 0);
   my $submenu = Cdk::checkDef ($name, "Submenu", $params{'Submenu'}, 0);
   my $menuattr = Cdk::checkDef ($name, "Menuattr", $params{'Menuattr'}, "A_REVERSE");
   my $submenuattr = Cdk::checkDef ($name, "Submenuattr", $params{'Submenuattr'}, "A_REVERSE");
 
   # Call the method.
   Cdk::Menu::Set ($self->{'Me'}, $menu, $submenu, $menuattr, $submenuattr);
}

#
# This draws the object.
#
sub draw
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::draw";

   # Draw the object.
   Cdk::Menu::Draw ($self->{'Me'});
}

#
# This erases the object.
#
sub erase
{
   my $self	= shift;
   Cdk::Menu::Erase ($self->{'Me'});
}

#
# This allows us to bind a key to an action.
#
sub bind
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::bind";

   # Set the values.
   my $key = Cdk::checkReq ($name, "Key", $params{'Key'});
   my $function	= Cdk::checkReq ($name, "Function", $params{'Function'});
   Cdk::Menu::Bind ($self->{'Me'}, $params{'Key'}, $params{'Function'});
}

#
# This allows us to set a pre-process function.
#
sub preProcess
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::preProcess";
 
   # Set the values.
   my $function = Cdk::checkReq ($name, "Function", $params{'Function'});
   Cdk::Menu::PreProcess ($self->{'Me'}, $params{'Function'});
}

#
# This allows us to set a post-process function.
#
sub postProcess
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::postProcess";
 
   # Set the values.
   my $function = Cdk::checkReq ($name, "Function", $params{'Function'});
   Cdk::Menu::PostProcess ($self->{'Me'}, $params{'Function'});
}

1;
