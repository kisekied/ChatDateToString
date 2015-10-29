//
//  main.m
//  ChatDateToString
//
//  Created by kisekied on 15/10/29.
//  Copyright © 2015年 kisekied. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DateToString.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [DateToString stringWithDate:[NSDate dateWithTimeIntervalSinceNow:- 60 * 60 * (0 + 24 * 1)]]);
    }
    return 0;
}
