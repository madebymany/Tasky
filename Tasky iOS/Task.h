//
//  Task.h
//  Tasky iOS
//
//  Created by Julian James on 09/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Task : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * details;

@end
