//
//  SelectSizes.m
//  watchkit1
//
//  Created by Dylan Rosario on 11/23/14.
//  Copyright (c) 2014 impekable. All rights reserved.
//

#import "SelectSizes.h"

@implementation SelectSizes

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        
        
        NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.watch1"];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(userDefaultsDidChange:)
                                                     name:NSUserDefaultsDidChangeNotification
                                                   object:nil];
        
    }
    return self;
}


-(void) userDefaultsDidChange:(NSNotification*)message{
    
    
    NSLog(@"NSUSER CHANGED");
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
    
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

-(IBAction) jump{
    NSLog(@"JUMPING");
    [self dismissController
 ];
}

@end
