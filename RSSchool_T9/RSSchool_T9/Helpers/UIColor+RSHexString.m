//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 30.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "UIColor+RSHexString.h"

@implementation UIColor (RSHexString)

+(instancetype)initWithHexString:(NSString *)string {
    unsigned rgbValue = 0;
        NSScanner *scanner = [NSScanner scannerWithString:string];
        [scanner setScanLocation:1]; // bypass '#' character
        [scanner scanHexInt:&rgbValue];

        return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
