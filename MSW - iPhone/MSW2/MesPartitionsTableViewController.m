//
//  MesPartitionsTableViewController.m
//  MSW
//
//  Created by simon on 15/12/2015.
//  Copyright (c) 2015 Score Lab. All rights reserved.
//

#import "MesPartitionsTableViewController.h"
#import "ApiMethod.h"
#import "MusicSheetViewController.h"
#import "SubscriptionCell.h"
#import "GuestMode.h"

@interface MesPartitionsTableViewController ()

@end

@implementation MesPartitionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //check if it is a guest mode
    GuestMode *guest = [[GuestMode alloc] init];
    if ([guest CheckIfTheUserIsAGuest] == true) {
        return;
    }
    [self refreshView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) refreshView{
    NSString *post =[NSString stringWithFormat:@"http://163.5.84.253/api/users/%@/scores/own", Id_global];
    ApiMethod *api = [[ApiMethod alloc]init];
    NSDictionary *dict1 = [api getMethodWithString:post];
    if (code_global != 200)
    {
        [api popup:dict1];
        return;
    }
    _titleMusicSheet = [[NSMutableArray alloc] initWithCapacity:0];
    _idRow = [[NSMutableArray alloc] initWithCapacity:0];
    self.urlMusicSheet = [[NSMutableArray alloc] initWithCapacity:0];
    self.userMusicSheet = [[NSMutableArray alloc] initWithCapacity:0];
    
    for(NSDictionary *item in dict1) {
        [_titleMusicSheet addObject:[item valueForKey:@"title"]];
        [_idRow addObject:[item valueForKey:@"id"]];
        [self.urlMusicSheet addObject:[item valueForKey:@"location_preview"]];
    }
    NSDictionary *dict2;
    dict2 = [dict1 valueForKeyPath:@"by"];
    for(NSDictionary *item2 in dict2){
        [self.userMusicSheet addObject:[item2 valueForKey:@"username"]];
        //another line should be add there if the ID of the user is required
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleMusicSheet.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"SubscriptionCell";
    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell2.textLabel.text = self.titleMusicSheet[indexPath.row];
    return cell2;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"ShowPartition"]){
        MusicSheetViewController *musicSheet = [segue destinationViewController];
        NSIndexPath *myIndexPath = nil;
        myIndexPath = [self.tableView indexPathForSelectedRow];
        musicSheet.musicSheetModal = @[self.titleMusicSheet[myIndexPath.row], self.urlMusicSheet[myIndexPath.row], self.userMusicSheet[myIndexPath.row], self.idRow[myIndexPath.row]];
    }
}

@end
