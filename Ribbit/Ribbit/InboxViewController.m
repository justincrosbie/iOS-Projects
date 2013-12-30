//
//  InboxViewController.m
//  Ribbit
//
//  Created by Justin Crosbie on 23/12/2013.
//  Copyright (c) 2013 Justin Crosbie. All rights reserved.
//

#import "InboxViewController.h"
#import "ImageViewController.h"

@interface InboxViewController ()

@end

@implementation InboxViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.moviePlayer = [[MPMoviePlayerController alloc] init];
    
    PFUser *currentUser = [PFUser currentUser];
    if ( !currentUser ) {
        [self performSegueWithIdentifier:@"showSignIn" sender:self];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Messages"];
    [query whereKey:@"recipientIds" equalTo:[[PFUser currentUser] objectId]];
    [query orderByAscending:@"createdAt"];

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if ( error ) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        } else {
            self.messages = objects;
            NSLog(@"Number of messages = %d", [self.messages count]);
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    PFObject *message = [self.messages objectAtIndex:indexPath.row];
    cell.textLabel.text = [message objectForKey:@"senderName"];
    
    NSString *fileType = [message objectForKey:@"fileType"];
    if ( fileType == Nil ) {
       fileType = [message objectForKey:@"filetype"];
    }
    if ( [fileType isEqualToString:@"image"] ) {
        cell.imageView.image = [UIImage imageNamed:@"icon_image"];
    } else {
        cell.imageView.image = [UIImage imageNamed:@"icon_video"];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectedMessage = [self.messages objectAtIndex:indexPath.row];
    NSString *fileType = [self.selectedMessage objectForKey:@"fileType"];
    if ( fileType == Nil ) {
        fileType = [self.selectedMessage objectForKey:@"filetype"];
    }
    if ( [fileType isEqualToString:@"image"] ) {
        [self performSegueWithIdentifier:@"showImage" sender:self];
    } else {
        PFFile *pfFile = [self.selectedMessage objectForKey:@"file"];
        self.moviePlayer.contentURL = [NSURL URLWithString:pfFile.url];
        [self.moviePlayer prepareToPlay];
        
        [self.view addSubview:self.moviePlayer.view];
        [self.moviePlayer setFullscreen:YES animated:YES];
    }
    
    NSMutableArray *recipientIds = [NSMutableArray arrayWithArray:[self.selectedMessage objectForKey:@"recipientIds"]];
    
    if ( [recipientIds count] == 1 ) {
        [self.selectedMessage deleteInBackground];
    } else {
        [recipientIds removeObject:[[PFUser currentUser] objectId]];
        [self.selectedMessage setObject:recipientIds forKey:@"recipientIds"];
        [self.selectedMessage saveInBackground];
    }
}

- (IBAction)signout:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"showSignIn" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ( [segue.identifier isEqualToString:@"showSignIn"] ) {
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    }
    else if ( [segue.identifier isEqualToString:@"showImage"] ) {
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
        ImageViewController *controller = (ImageViewController *)segue.destinationViewController;
        controller.message = self.selectedMessage;
        
    }
}
@end
