//
//  I18n.h
//  Tasky iOS
//
// Created by James Higgs on 14/06/2013.
// Copyright (c) 2013 MadeByMany. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface I18n : NSObject

+(NSString *)localizedStringForKey:(NSString *)key;

@end

#if DEBUG
#define MXMLocalizedString(key) [I18n localizedStringForKey:(key)]
#else
#define MXMLocalizedString(key) NSLocalizedString((key), nil)
#endif

