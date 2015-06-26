//
//  main.m
//  PersonHomeWork
//
//  Created by Jason Wang on 6/23/15.
//  Copyright (c) 2015 Jason Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

-(void)setCity: (NSString *)city;
-(NSString *)city;

-(void)setPhoneNumber: (NSString *)phoneNumber;
-(NSString *)phontNumber;

-(void)setName: (NSString *)name;
-(NSString *)name;

- (void) changePersonsName:(Person *)aPerson
                    toName:(NSString *)newName;

-(BOOL)checkSameCity:(Person *)aPerson;

-(Person *)haveChild;
-(void)claimChild: (Person *)childToClaim;

@end

@implementation Person {
    NSString *_city;
    NSString *_phoneNumber;
    NSString *_name;
//    Person *_child;
    NSMutableArray *_children;
}

-(void)setCity: (NSString *)city {
    _city = city;
}
-(NSString *)city {
    return _city;
}

-(void)setPhoneNumber: (NSString *)phoneNumber {
    _phoneNumber = phoneNumber;
}
-(NSString *)phontNumber {
    return _phoneNumber;
}

-(void)setName: (NSString *)name {
    _name = name;
}
-(NSString *)name{
    return _name;
}

-(void)changePersonsName:(Person *)aPerson
                  toName:(NSString *)newName {
    [aPerson setName:newName];
}

-(BOOL)checkSameCity:(Person *)aPerson {
    if ([[aPerson city] isEqualToString:[self city]]) {
        return YES;
    } else {
        return NO;
    }
}

-(Person *)haveChild {
    Person *child = [[Person alloc]init];
    [child setCity:[self city]];
    [child setPhoneNumber:[self phontNumber]];
    return child;
}

-(void)claimChild: (Person *)childToClaim {
    [_children
}

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // START CODE HERE
        
        
        Person *carl = [[Person alloc] init];
        Person *mike = [[Person alloc] init];
        
        [carl setName:@"Carl"];
        
        [carl setCity:@"Okinawa"];
        [mike setCity:@"New York"];
        
        BOOL citiesAreSame = [mike checkSameCity:carl];
        NSLog(@"%d", citiesAreSame);
        
        [carl setPhoneNumber:@"867-5309"];
        
        NSString *carlsName = [carl name];
        NSLog(@"%@",carlsName);
        
        [carl setName:@"Stenven"];
        NSLog(@"%@",[carl name]);
        NSLog(@"%@",[carl city]);
        
        [carl setCity:@"New York"];
        NSLog(@"%@", [carl city]);
        
        
        [mike changePersonsName:carl toName:@"Carl"];
        NSLog(@"%@", [carl name]);
        
        citiesAreSame = [mike checkSameCity:carl];
        NSLog(@"%d", citiesAreSame);
        
        Person *mikesBaby = [mike haveChild];
        NSLog(@"%@", [mikesBaby city]);
        [mike changePersonsName:mikesBaby toName:@"ABC"];
        NSLog(@"%@", [mikesBaby name]);
        
        // END CODE HERE
    }
    return 0;
}
