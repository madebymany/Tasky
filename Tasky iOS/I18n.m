//
//  I18n.m
//  Tasky iOS
//
//
// Created by James Higgs on 14/06/2013.
// Copyright (c) 2013 MadeByMany. All rights reserved.
//

#import "I18n.h"

@implementation I18n

+(NSString *)localizedStringForKey:(NSString *)key
{
    NSString *translation = [[NSBundle mainBundle] localizedStringForKey:key value:nil table:nil];
    
    if(nil == translation || [translation isEqualToString:key] || [translation isEqualToString:@""])
    {
        return @"XXX NOT TRANSLATED XXX";
    }
    else
    {
        return translation;
    }
}

@end
