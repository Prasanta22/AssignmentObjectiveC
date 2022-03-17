//
//  DetailsViewController.m
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 09/03/22.
//

#import "DetailsViewController.h"
#import "DetailsTableViewCell.h"
#import "KeychainItemWrapper.h"

@interface DetailsViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getDataFrom:@"https://randomuser.me/api/?results=8"];
}

- (void) getDataFrom:(NSString *)url{
    [self.activityIndicatorView startAnimating];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data,
        NSURLResponse * _Nullable response,
        NSError * _Nullable error) {
        NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        self.dataArray= results[@"results"];
        NSLog(@"Data Array: %@", self.dataArray);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.activityIndicatorView stopAnimating];
            [self.tableView reloadData];
        });
        
    }] resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellReuseID = @"DetailsTableViewCell";
    DetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseID];
    NSString *str = [NSString stringWithFormat: @"%@ %@ %@",
                     self.dataArray[indexPath.row][@"name"][@"title"],self.dataArray[indexPath.row][@"name"][@"first"], self.dataArray[indexPath.row][@"name"][@"last"]];
    cell.nameLabel.text = str;
    cell.peopleImageView.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.dataArray[indexPath.row][@"picture"][@"thumbnail"]]]];
    return cell;
}
- (IBAction)logoutButtonAction:(UIButton *)sender {
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"YourAppLogin" accessGroup:nil];
    [keychainItem resetKeychainItem];
    [self.navigationController popViewControllerAnimated:true];
}


@end
