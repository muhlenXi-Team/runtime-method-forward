//
//  Person.m
//  HelloOCSVA
//
//  Created by muhlenXi on 2020/8/19.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

#import "Person.h"
#import "Dog.h"
#import <objc/runtime.h>

@implementation Person


void sayByebye() {
    NSLog(@"Byebye");
}

#if 0  // 1、方法解析
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if(sel == @selector(sayHello)) {
        class_addMethod([self class], sel, (IMP) sayByebye, "v@");
    }
    return YES;
}
#endif

#if 0 // 2、转发 target
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(sayHello)) {
        return [Dog new];
    }
    return nil;
}
#endif

#if 1 // 3、重签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *sel = NSStringFromSelector(aSelector);
    if([sel isEqualToString:@"sayHello"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL sel = [anInvocation selector];
    if(sel == @selector(sayHello)) {
        [anInvocation invokeWithTarget:[Dog new]];
    }
}
#endif

@end
