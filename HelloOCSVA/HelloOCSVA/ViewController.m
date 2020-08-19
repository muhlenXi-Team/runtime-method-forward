//
//  ViewController.m
//  HelloOCSVA
//
//  Created by muhlenXi on 2020/8/19.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    Person *person = [[Person alloc] init];
    [person performSelector:@selector(sayHello)];
}


@end
