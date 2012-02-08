//
//  SampleTableViewController.m
//  HBNiOSTutorial
//
//  Created by Jung on 2/1/12.
//  Copyright (c) 2012 saltfactory@gmail.com. All rights reserved.
//

#import "SampleTableViewController.h"

@implementation SampleTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - 테스트 

#pragma mark - View lifecycle

// TODO: 나중에 구현할 메소드 

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    items = [[NSArray alloc] initWithObjects:@"http://cfile30.uf.tistory.com/image/186A3A384EEAE043315B79", 
             @"http://cfile30.uf.tistory.com/image/186A3A384EEAE043315B79",
             @"http://cfile30.uf.tistory.com/image/186A3A384EEAE043315B79",
             @"http://cfile30.uf.tistory.com/image/186A3A384EEAE043315B79",
             @"http://cfile30.uf.tistory.com/image/186A3A384EEAE043315B79",
             @"http://cfile30.uf.tistory.com/image/186A3A384EEAE043315B79",
             @"http://cfile30.uf.tistory.com/image/186A3A384EEAE043315B79",
             nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [items count];
}

- (void) loadAsyncImageFromURL:(NSURL *)url  imageBlock:(void (^) (UIImage *image))imageBlock errorBlock:(void(^)(void))errorBlock
{
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                   {
                       NSData * data = [[NSData alloc] initWithContentsOfURL:url];
                       UIImage * image = [[UIImage alloc] initWithData:data];
                       dispatch_async( dispatch_get_main_queue(), ^(void){
                           if( image != nil )
                           {
                               imageBlock( image );
                           } else {
                               errorBlock();
                           }
                       });
                   });
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    [self loadAsyncImageFromURL:[NSURL URLWithString:[items objectAtIndex:indexPath.row]] 
                     imageBlock:^(UIImage *image){ 
                         
                         [[cell.contentView viewWithTag:999+indexPath.row] removeFromSuperview];
                         
                         UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
                         imageView.frame = CGRectMake(04.0f, .0f, 44.0f, 44.0f);
                         imageView.tag = 999+indexPath.row;
                         
                         [cell.contentView addSubview:imageView];
                     } 
                     errorBlock:^(void){
                         NSLog(@"%@", @"error!");
                     }];
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
