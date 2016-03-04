//
//  LaguangeSettingTableViewController.m
//  InternationalLanguage
//
//  Created by Wayhouse on 16/1/16.
//  Copyright © 2016年 Wayhouse. All rights reserved.
//

#import "LanguangeSettingTableViewController.h"
#import "InternationalControl.h"

@interface LanguangeSettingTableViewController ()
{
    NSArray *_languagesTitleArray;
    NSArray *_languagesSettingArray;
}


@end


@implementation LanguangeSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _languagesTitleArray    =  @[@"中文",@"English",@"Français"];
    _languagesSettingArray  =  @[@"zh-Hans",@"en",@"fr"];
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _languagesSettingArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.textLabel.text = [_languagesTitleArray objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [InternationalControl setInternationalLanguage:_languagesSettingArray[indexPath.row]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"settigLanguage" object:nil];
    [[NSUserDefaults standardUserDefaults] setObject:_languagesSettingArray[indexPath.row] forKey:@"default_language"];
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
