//
//  Contact.h
//  ToDo List
//
//  Created by Davey McNight on 6/23/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

;

@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *contacts;
@end

@interface Contact (CoreDataGeneratedAccessors)

- (void)addTasks:(NSSet *)values;
- (void)removeTasks:(NSSet *)values;

@end
