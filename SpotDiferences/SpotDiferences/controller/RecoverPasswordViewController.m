//
//  RecoverPasswordViewController.m
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 10/17/12.
//
//

#import "RecoverPasswordViewController.h"
#import "UikitFramework.h"
#import "InicialViewController.h"
#import "SoundManager.h"

@interface RecoverPasswordViewController ()
@property (weak, nonatomic) IBOutlet UIView *container;
@property (nonatomic,weak) IBOutlet UIImageView *imageview;
@end

@implementation RecoverPasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.imageview.image = [UIImage imageNamed:@"background_clear"];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIImage *bimage = [UIImage imageNamed:@"btn_back"];
    
    
    UIButton *bbutton = [UikitFramework createButtonWithBackgroudImage:@"btn_back" title:@"" positionX:10 positionY:10];
    [bbutton addTarget:self action:@selector(backButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bbutton];
    
    UIButton *homeButton = [UikitFramework createButtonWithBackgroudImage:@"btn_home" title:@"" positionX:self.view.frame.size.width - 10 - bimage.size.width positionY:10];
    [homeButton addTarget:self action:@selector(homeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:homeButton];
    self.container.frame = CGRectMake(50, 110, self.view.frame.size.width - 100, self.view.frame.size.height);
    
    UILabel *label = [UikitFramework createLableWithText:@"PLEASE INSERT YOUR E-MAIL ADDRESS\nTO RECOVER YOUR PASSWORD:" positionX:0 positionY:30 width:self.view.frame.size.width height:100];
    label.textAlignment = UITextAlignmentCenter;
    label.numberOfLines = 0;
    label.font = [UIFont fontWithName:[UikitFramework getFontName] size: 25];
    [self.view addSubview:label];
}

-(void)playInterfaceSound
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *sound = [prefs stringForKey:@"sound"];
    
    if ([sound isEqualToString:@"YES"]) {
        [[SoundManager sharedSoundManager] playInterface];
    }
}


-(void)backButtonTapped:(UIButton*)sender
{
    [self playInterfaceSound];
    [[self navigationController]popViewControllerAnimated:YES];
}

- (IBAction) backToHome {
    NSArray *viewControllers = [[self navigationController] viewControllers];
    for (int c=0; c < [viewControllers count]; c++) {
        id obj = [viewControllers objectAtIndex:c];
        if([obj isKindOfClass:[InicialViewController class]])
            [self.navigationController popToViewController:obj animated:YES];
    }
}

-(void)homeButtonTapped:(UIButton*)sender
{
    [self playInterfaceSound];
    [self backToHome];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setContainer:nil];
    [super viewDidUnload];
}
@end
