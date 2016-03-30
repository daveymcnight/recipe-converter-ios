//
// Created by Davey McNight on 6/20/15.
// Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactSvc.h"

@interface ContactSvcCoreData : NSObject  <ContactSvc>



-(Contact *)createManagedContact;
-(Contact *)saveContact:(Contact *)task;





@end