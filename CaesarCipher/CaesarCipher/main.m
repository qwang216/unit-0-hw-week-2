//
//  main.m
//  CaesarCipher
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaesarCipher : NSObject

- (NSString *)encode:(NSString *)string offset:(int)offset;
- (NSString *)decode:(NSString *)string offset:(int)offset;
- (BOOL) codeBreaker: (NSString *)string secondCipher:(NSString *)string2;

@end


@implementation CaesarCipher

- (NSString *)encode:(NSString *)string offset:(int)offset {
    if (offset > 25) {
        NSAssert(offset < 26, @"offset is out of range. 1 - 25");
    }
    NSString *str = [string lowercaseString];
    unsigned long count = [string length];
    unichar result[count];
    unichar buffer[count];
    [str getCharacters:buffer range:NSMakeRange(0, count)];
    
    char allchars[] = "abcdefghijklmnopqrstuvwxyz";

    for (int i = 0; i < count; i++) {
        if (buffer[i] == ' ' || ispunct(buffer[i])) {
            result[i] = buffer[i];
            continue;
        }
        
        char *e = strchr(allchars, buffer[i]);
        int idx= (int)(e - allchars);
        int new_idx = (idx + offset) % strlen(allchars);

        result[i] = allchars[new_idx];
    }

    return [NSString stringWithCharacters:result length:count];
}

- (NSString *)decode:(NSString *)string offset:(int)offset {
    return [self encode:string offset: (26 - offset)];
}

- (BOOL) codeBreaker: (NSString *)string secondCipher:(NSString *)string2 {
    for (int offset1 = 0; offset1 < 26; offset1++) {
        for (int offset2 = 0; offset2 < 26; offset2++) {
            if ([[self encode:string offset:offset1] isEqualToString:[self encode:string2 offset:offset2]]) {
                return YES;
                break;
            }
        }
    }
    return 0;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CaesarCipher *check = [[CaesarCipher alloc] init];
        NSString *oneString = [check encode: @"jason" offset: 4];
        NSString *secondString = [check encode: @"jason" offset: 11];
        NSLog(@"%@", oneString);
        NSLog(@"%@", secondString);
        BOOL areTheyTheSame = [check codeBreaker:oneString secondCipher:secondString];
        
        NSLog(@"%d", areTheyTheSame);
    
        
        
    }
    
}
