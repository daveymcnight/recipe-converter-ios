//
//  ContactDetailViewController.h
//  ToDo List
//
//  Created by Davey McNight on 6/21/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface ContactDetailViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *projectField;
@property (strong) Contact *parentTask;


@end
