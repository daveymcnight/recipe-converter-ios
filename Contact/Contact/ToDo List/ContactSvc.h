//
//  ContactSvc.h
//  ToDo List
//
//  Created by Davey McNight on 6/20/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@protocol ContactSvc <NSObject>

-(Contact *) createContact: (Contact *)task;
-(NSArray *) retrieveAllContacts;
-(Contact *) updateContact: (Contact *)task;
-(Contact *) deleteContact: (Contact *)task;

@end
