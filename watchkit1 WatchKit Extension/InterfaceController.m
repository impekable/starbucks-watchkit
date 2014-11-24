//
//  InterfaceController.m
//  watchkit1 WatchKit Extension
//
//  Created by Dylan Rosario on 11/22/14.
//  Copyright (c) 2014 impekable. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

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

-(void) getImages:(NSString*)iurl{
    
    NSLog(@"GET IMAGE: %@", iurl);
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: iurl]];
    
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.watch1"];
    
    [sharedDefaults setObject:imageData forKey:@"image1"];
    NSLog(@"IMAGE: %@", imageData);
    [sharedDefaults synchronize];   // (!!) This is crucial.
    

    
}

-(IBAction) getPics{
    [self getImages:@"http://lists.apple.com/images/stamp.gif"];
}

@end



