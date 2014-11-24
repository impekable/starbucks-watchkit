//
//  ViewController.m
//  watchkit1
//
//  Created by Dylan Rosario on 11/22/14.
//  Copyright (c) 2014 impekable. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     [self getImages:@"http://lists.apple.com/images/stamp.gif"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
    
}

-(void) getImages:(NSString*)iurl{
    
    NSLog(@"GET IMAGE: %@", iurl);
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: iurl]];
    
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.watch1"];
    
    [sharedDefaults setObject:imageData forKey:@"image1"];
    NSLog(@"IMAGE: %@", imageData);
    [sharedDefaults synchronize];   // (!!) This is crucial.
    
    //    dispatch_async(dispatch_get_global_queue(0,0), ^{
    //
    //        if ( imageData == nil )
    //            return;
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            // WARNING: is the cell still using the same data by this point??
    //
    //        });
    //    });
    
}

-(IBAction) getPics{
    [self getImages:@"http://lists.apple.com/images/stamp.gif"];
}

@end
