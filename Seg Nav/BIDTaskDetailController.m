//
//  BIDTaskDetailController.m
//  Seg Nav
//
//  Created by 李 潇磊 on 13-4-26.
//  Copyright (c) 2013年 李 潇磊. All rights reserved.
//

#import "BIDTaskDetailController.h"

@interface BIDTaskDetailController ()

@end

@implementation BIDTaskDetailController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.textView.text = self.selection[@"object"];
    [self.textView becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if ([self.delegate respondsToSelector:@selector(setEditedSelection:)]) {
        // finish editing
        [self.textView endEditing:YES];
        // prepare selection info
        NSIndexPath *indexPath = self.selection[@"indexPath"];
        id object = self.textView.text;
        NSDictionary *editedSelection = @{@"indexPath" : indexPath,
                                          @"object" : object};
        [self.delegate setValue:editedSelection forKey:@"editedSelection"];
        //[self.delegate setEditedSelection:editedSelection];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
