//
//  ContactPageViewController.m
//  Contac+
//
//  Created by Daniel Moreno on 6/29/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "ContactPageViewController.h"
#import "CustomCamera.h"
#import "Person.h"

@interface ContactPageViewController (){
    AVAudioRecorder *recorder;
    AVAudioPlayer *player;
}
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UISwitch *singleStatusSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *locationSwitch;
@property (weak, nonatomic) IBOutlet UIButton *saveContact;
@property (weak, nonatomic) IBOutlet UILabel *recordLabel;
@property (weak, nonatomic) IBOutlet UIView *nameView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;



@end

@implementation ContactPageViewController



-(void)viewWillAppear:(BOOL)animated{
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    NSLog(@"LOADED");
    
    if([CLLocationManager locationServicesEnabled]){
        
        NSLog(@"Location Services Enabled");
        [locationManager requestWhenInUseAuthorization];
        //       [locationManager requestAlwaysAuthorization];
        
        if([CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied){
            UIAlertView *permissionError = [[UIAlertView alloc] initWithTitle:@"App Permission Denied"
                                                                      message:@"To re-enable, please go to Settings and turn on Location Service for this app."
                                                                     delegate:nil
                                                            cancelButtonTitle:@"OK"
                                                            otherButtonTitles:nil];
            [permissionError show];
        }
    }
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    NSLog(@"GETTING ADDRESS");
}

- (void) launchCamera{
    CustomCamera *cameraController = [[CustomCamera alloc]init];
    cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    cameraController.delegate = self;
    cameraController.showsCameraControls = NO;
    cameraController.navigationBarHidden = YES;
    cameraController.toolbarHidden = YES;
    UIImageView *overlay = [[UIImageView alloc]
                                      initWithImage:[UIImage imageNamed:@"overlay.png"]];
    overlay.contentMode = UIViewContentModeCenter;
    overlay.clipsToBounds = YES;
    
    cameraController.cameraOverlayView = overlay;
    [self presentViewController:cameraController animated:YES completion:nil];
    NSLog(@"launchCamera");
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    myImage = image;
    myImageView.image = myImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.imageView.image = myImage;
}


- (NSString *) getDate{
    NSDateFormatter *formatter;
    NSString        *dateString;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    
    dateString = [formatter stringFromDate:[NSDate date]];
    
    return dateString;
}

- (IBAction) saveContactAndTakePicture:(id)sender{
    NSString *name = self.nameField.text;
    NSString *phone = self.phoneField.text;
    BOOL status = self.singleStatusSwitch.isOn;
    BOOL location = self.locationSwitch.isOn;

    NSLog(@"%@, %@, %d single, %d location", name, phone, (int) status, (int) location);
    [self launchCamera];
    
    Person *person = [[Person alloc]init];
    person.meetDate = self.getDate;
    person.name = self.nameField.text;
    person.phoneNumber = self.phoneField.text;
    person.single = self.singleStatusSwitch.isOn;
    person.location = self.addressLabel.text;
    person.image = self.imageView.image;
    
    [
    // load table screen view with person added

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.phoneField resignFirstResponder];
    [self.nameField resignFirstResponder];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [locationManager stopUpdatingLocation];
    
    
    // Disable Stop/Play button when application launches
    [self.stopButton setEnabled:NO];
    [self.playButton setEnabled:NO];
    
    // Set the audio file
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"MyAudioMemo.m4a",
                               nil];
    NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
    
    // Setup audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    // Define the recorder setting
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    // Initiate and prepare the recorder
    recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:NULL];
    recorder.delegate = self;
    recorder.meteringEnabled = YES;
    [recorder prepareToRecord];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Location didUpdateToLocation called");
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"didUpdateToLocation: %@", [locations lastObject]);
    CLLocation *currentLocation = [locations lastObject];
    
    if (currentLocation != nil) {
        longitudeLabel = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        latitudeLabel = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        NSLog(@"longitude: %@ and latitude: %@", longitudeLabel, latitudeLabel);
    }
    
    // Reverse Geocoding
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        //     NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            self.addressLabel.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                      placemark.subThoroughfare, placemark.thoroughfare,
                                      placemark.postalCode, placemark.locality,
                                      placemark.administrativeArea,
                                      placemark.country];
            NSLog(@"address is: %@", self.addressLabel.text);
        } else {
            NSLog(@"ERRORZ!! %@", error.debugDescription);
        }
    } ];
    
    //   NSLog(@"UPDATING LOCATION%@", [locations lastObject]);
}


- (IBAction)recordTapped:(id)sender {
    // Stop the audio player before recording
    if (player.playing) {
        [player stop];
    }
    
    if (!recorder.recording) {
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        
        // Start recording
        [recorder record];
        
    }
    
    [self.stopButton setEnabled:YES];
    [self.playButton setEnabled:NO];
}

- (IBAction)stopTapped:(id)sender {
    [recorder stop];
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:NO error:nil];
}

- (IBAction)playTapped:(id)sender {
    if (!recorder.recording){
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:recorder.url error:nil];
        [player setDelegate:self];
        [player play];
    }
}

- (void) audioRecorderDidFinishRecording:(AVAudioRecorder *)avrecorder successfully:(BOOL)flag{
    [self.recordButton setTitle:@"REC" forState:UIControlStateNormal];
    
    [self.stopButton setEnabled:NO];
    [self.playButton setEnabled:YES];
}

@end
