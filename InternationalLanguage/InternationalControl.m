//
//  InternationalControl.m
//  InternationalLanguage
//
//  Created by Wayhouse on 16/1/16.
//  Copyright © 2016年 Wayhouse. All rights reserved.
//

#import "InternationalControl.h"

@implementation InternationalControl

static NSBundle *bundle = nil;
+ (NSBundle *) bundle{
    return bundle;
}

+ (void) initInternationalLanguage{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *string;
    NSString * defaultLanguage = [def objectForKey:@"default_language"];
    if (defaultLanguage.length>0) {
        string = defaultLanguage;
    }else{
        //in Chinese TW&HK area we all should use "zh-Hant"
        //在中国的台湾和香港地区, 都要用中文繁体 "zh-Hant"
        NSArray* languages = [def objectForKey:@"AppleLanguages"];
        NSString *current = [languages objectAtIndex:0];
        NSMutableArray * temp = (NSMutableArray*)[current componentsSeparatedByString:@"-"];
        if (![temp.firstObject isEqualToString:@"zh"]&&temp.count>1) {
            string = temp.firstObject;
        }
        if ([temp.firstObject isEqualToString:@"zh"]&&temp.count>1) {
            [temp removeLastObject];
            if (temp.count>1) {
                string = [temp componentsJoinedByString:@"-"];
            }else{
                string = @"zh-Hant";
            }
        }
    }
    [def setValue:string forKey:@"userLanguage"];
    [def synchronize];
    NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:@"lproj"];
    if (path==nil) {
        path = [[NSBundle mainBundle] pathForResource:string ofType:@"lproj"];
    }
    bundle = [NSBundle bundleWithPath:path];
    [self setInternationalLanguage:[self language]];
}

+(NSString *)language{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *language = [def valueForKey:@"userLanguage"];
    return language;
}

+ (void) setInternationalLanguage:(NSString *) language{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj" ];
    bundle = [NSBundle bundleWithPath:path];
    [def setValue:language forKey:@"userLanguage"];
    [def synchronize];
}


+ (NSString *) string:(NSString *) str{
#warning here the table name must as same as the .string file's name - 注意,这里必须和设置的.string文件名一致
    return [[self bundle] localizedStringForKey:str value:nil table:@"InternationalLanguage"];
}

@end
