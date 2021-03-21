//
//  NSString+YojoExtension.m
//  YojoComplexListView
//
//  Created by Yojo on 2021/3/21.
//  Copyright © 2021 李永健. All rights reserved.
//

#import "NSString+ListExtension.h"

@implementation NSString (ListExtension)

- (BOOL)isBlankString
{
    if(self == nil || self == NULL)
    {
        return YES;
    }
    if([self isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0)
    {
        return YES;
    }
    return NO;
}

@end
