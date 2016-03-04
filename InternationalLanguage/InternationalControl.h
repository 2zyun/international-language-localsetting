//
//  InternationalControl.h
//  InternationalLanguage
//
//  Created by Wayhouse on 16/1/16.
//  Copyright © 2016年 Wayhouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> 

@interface InternationalControl : NSObject

+ (NSBundle *) bundle;
+ (void) initInternationalLanguage;
+ (NSString *) language;
+ (void) setInternationalLanguage: (NSString *) language;
+ (NSString *) string: (NSString*) str;

@end
