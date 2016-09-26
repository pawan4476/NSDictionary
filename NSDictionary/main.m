//
//  main.m
//  NSDictionary
//
//  Created by Nagam Pawan on 9/24/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *inventary = @{
                                    @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:13],
                                    @"Mercedes-Benz e350" : [NSNumber numberWithInt:22],
                                    @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
                                    @"BMW X6" : [NSNumber numberWithInt:16],
                                    };
        inventary = [NSDictionary dictionaryWithObjectsAndKeys:
                     [NSNumber numberWithInt:13], @"Mercedes-Benz SLK250",
                     [NSNumber numberWithInt:22], @"Mercedes-Benz e350",
                     [NSNumber numberWithInt:19], @"BMW M3 Coupe",
                     [NSNumber numberWithInt:16], @"BMW X6",nil];
        NSArray *models = @[@"Mercedes-Benz SLK250", @"Mercedes-Benz e350", @"BMW M3 Coupe", @"BMW X6"];
        NSArray *stock = @[[NSNumber numberWithInt:13], [NSNumber numberWithInt:22], [NSNumber numberWithInt:19], [NSNumber numberWithInt:16]];
        inventary = [NSDictionary dictionaryWithObject:stock forKey:models];
        NSLog(@"%@", inventary);
        
        //Accessing  Values and Keys :
        NSDictionary *inventary1 = @{
                                    @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:13],
                                    @"Mercedes-Benz e350" : [NSNumber numberWithInt:22],
                                    @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
                                    @"BMW X6" : [NSNumber numberWithInt:16],
                                    };
        NSLog(@"There are %@ X6's in stock", inventary1[@"BMW X6"]);
        NSLog(@"There are %@ E350", [inventary1 objectForKey:@"Mercedes-Benz SLK250"]);
        NSDictionary *inventary2 = @{
                                    @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:0],
                                    @"Mercedes-Benz e350" : [NSNumber numberWithInt:0],
                                    @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
                                    @"BMW X6" : [NSNumber numberWithInt:16],
                                    };
        NSArray *outOfStock = [inventary2 allKeysForObject:[NSNumber numberWithInt:0]];
        NSLog(@"The following cars are currently out of stock: %@", [outOfStock componentsJoinedByString:@" , "]);
        
        //Enumerating Dictionaries :
        NSDictionary *inventary3 = @{
                                     @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:13],
                                     @"Mercedes-Benz e350" : [NSNumber numberWithInt:22],
                                     @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
                                     @"BMW X6" : [NSNumber numberWithInt:16],
                                     };
        NSLog(@"We currently have %ld models available", [inventary3 count]);
        for (id key in inventary3) {
            NSLog(@"There are %@ %@ 's in stock", inventary3[key], key);
        }
        NSLog(@"Models: %@", [inventary3 allKeys]);
        NSLog(@"Stock: %@", [inventary3 allValues]);
        [inventary3 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
            NSLog(@"There are %@ %@ 's in stock", obj, key);
        }];
        
        //Comparing Dictionaries :
        NSDictionary *inventary4 = @{
                                     @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:13],
                                     @"Mercedes-Benz e350" : [NSNumber numberWithInt:22],
                                     @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
                                     @"BMW X6" : [NSNumber numberWithInt:16],
                                     };
        NSDictionary *showroomInventary = @{
                                     @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:13],
                                     @"Mercedes-Benz e350" : [NSNumber numberWithInt:22],
                                     @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
                                     @"BMW X6" : [NSNumber numberWithInt:16],
                                     };
        if ([inventary4 isEqualToDictionary:showroomInventary]) {
            NSLog(@"Why are we storing many cars in our showroom");
        }


        //Sorting Dictionary Keys :
        NSDictionary *price = @{
                                     @"Mercedes-Benz SLK250" : [NSDecimalNumber decimalNumberWithString:@"6500000.00"],
                                     @"Mercedes-Benz e350" : [NSDecimalNumber decimalNumberWithString:@"7500000.00"],
                                     @"BMW M3 Coupe" : [NSDecimalNumber decimalNumberWithString:@"5000000.00"],
                                     @"BMW X6" : [NSDecimalNumber decimalNumberWithString:@"9500000.00"],
                                     };
        NSArray *sortedSArray = [price keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2){
            return [obj2 compare:obj1];
        }];
        NSLog(@"%@", sortedSArray);
        
        //Filtering Dictionary Keys :
        NSDictionary *prices = @{
                                @"Mercedes-Benz SLK250" : [NSDecimalNumber decimalNumberWithString:@"6500000.00"],
                                @"Mercedes-Benz e350" : [NSDecimalNumber decimalNumberWithString:@"7500000.00"],
                                @"BMW M3 Coupe" : [NSDecimalNumber decimalNumberWithString:@"5000000.00"],
                                @"BMW X6" : [NSDecimalNumber decimalNumberWithString:@"9500000.00"],
                                };
        NSDecimalNumber *maxPrice = [NSDecimalNumber decimalNumberWithString:@"7500000.00"];
        NSSet *under50k = [prices keysOfEntriesPassingTest:^BOOL(id key, id obj, BOOL *stop){
            if ([obj compare:maxPrice] == NSOrderedAscending) {
                return YES;
            }
            else{
                return  NO;
            }
        }];
        NSLog(@"%@", under50k);
        
        //NSMutableDictionary :
        NSMutableDictionary *jobs = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    @"Audi TT" : @"John",
                                                                                    @"Audi Quattro (Black)" : @"Mary",
                                                                                    @"Audi Quattro (Silver)" : @"Bill",
                                                                                    @"Audi A7" : @"Bill"
                                                                      }];
        NSLog(@"%@", jobs);
        
        //Adding and Removing Entries :
        NSMutableDictionary *jobs1 = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                     @"Audi TT" : @"John",
                                                                                     @"Audi Quattro (Black)" : @"Mary",
                                                                                     @"Audi Quattro (Silver)" : @"Bill",
                                                                                     @"Audi A7" : @"Bill"
                                                                                    }];
        [jobs1 setObject:@"Mary" forKey:@"Audi TT"];
        [jobs1 removeObjectForKey:@"Audi A7"];
        jobs1[@"Audi R8 GT"] = @"Jack";
        NSLog(@"%@", jobs1);

        //Combining Dictionaries :
        NSMutableDictionary *jobs2 = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                     @"Audi TT" : @"John",
                                                                                     @"Audi Quattro (Black)" : @"Mary",
                                                                                     @"Audi Quattro (Silver)" : @"Bill",
                                                                                     @"Audi A7" : @"Bill"
                                                                                     }];
        NSDictionary *bakerStreetjobs = @{
                                          @"BMW 640i" : @"Dick",
                                          @"BMW X5" : @"Brad"
                                          };
        [jobs2 addEntriesFromDictionary:bakerStreetjobs];
        NSLog(@"%@", jobs2);
        NSMutableDictionary *jobs3 = [[NSMutableDictionary alloc]init];
        [jobs3 addEntriesFromDictionary:@{
                                          @"Audi TT" : @"John",
                                          @"Audi Quattro (Black)" : @"Mary",
                                          @"Audi Quattro (Silver)" : @"Bill",
                                          @"Audi A7" : @"Bill"
                                          }];
        NSLog(@"%@", jobs3);



    }
    return 0;
}
