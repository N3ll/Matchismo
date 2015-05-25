//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Nelly Chakarova on 06/05/15.
//  Copyright (c) 2015 Nelly Chakarova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

//designated initializer
-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck;

-(void) chooseCardAtIndex:(NSUInteger)index;
-(Card*) cardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly) NSInteger score;
@property (nonatomic) int mode;
@property (nonatomic, readonly) NSMutableString *gameDisplay;

@end
