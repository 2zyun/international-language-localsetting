//
//  ViewController.m
//  InternationalLanguage
//
//  Created by Wayhouse on 16/1/16.
//  Copyright © 2016年 Wayhouse. All rights reserved.
//

#import "ViewController.h"
#import "LanguangeSettingTableViewController.h"
#import "InternationalControl.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *languageLabel;
@property (strong, nonatomic) IBOutlet UIButton *settingButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(settigLanguage) name:@"settigLanguage" object:nil];
    [self settigLanguage];
}
- (void)settigLanguage{
    self.languageLabel.text = [InternationalControl string:@"hello world"];
    [self.settingButton setTitle:[InternationalControl string:@"setting"] forState:UIControlStateNormal
     ];
}


- (IBAction)settingClick:(id)sender {
    LanguangeSettingTableViewController * languageSetting = [[LanguangeSettingTableViewController alloc]init];
    [self.navigationController pushViewController:languageSetting animated:YES];
}

@end
