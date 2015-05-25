//
//  Card.h
//  Matchismo
//
//  Created by Nelly Chakarova on 06/05/15.
//  Copyright (c) 2015 Nelly Chakarova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong, nonatomic) NSString* contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter= isMatched) BOOL matched;

-(int) match:(NSArray*) otherCards;

@end
