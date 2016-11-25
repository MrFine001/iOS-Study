

#import "MainViewController.h"


@implementation MainViewController

@synthesize altitude,latitude,longitude,locmanager;


- (IBAction)update {
	
	locmanager = [[CLLocationManager alloc] init]; 
	[locmanager setDelegate:self]; 
	[locmanager setDesiredAccuracy:kCLLocationAccuracyBest];
	
	[locmanager startUpdatingLocation];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[self update];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{ 
	if (wasFound) return; 
	wasFound = YES;
	
	CLLocationCoordinate2D loc = [newLocation coordinate];
	
	latitude.text = [NSString stringWithFormat: @"%f", loc.latitude];
	longitude.text	= [NSString stringWithFormat: @"%f", loc.longitude];
	altitude.text = [NSString stringWithFormat: @"%f", newLocation.altitude];
	
	//	NSString *mapUrl = [NSString stringWithFormat: @"http://maps.google.com/maps?q=%f,%f", loc.latitude, loc.longitude]; 
	//	NSURL *url = [NSURL URLWithString:mapUrl]; 
	//	[[UIApplication sharedApplication] openURL:url]; 
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error { 
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误通知" 
													message:[error description] 
												   delegate:nil cancelButtonTitle:@"OK" 
										  otherButtonTitles:nil];
	[alert show];
	[alert release];	
}


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id)sender {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	[locmanager stopUpdatingLocation];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
	[altitude release];
	[latitude release];
	[longitude release];
	[locmanager release];
    [super dealloc];
}


@end
