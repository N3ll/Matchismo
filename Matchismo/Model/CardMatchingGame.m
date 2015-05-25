//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Nelly Chakarova on 06/05/15.
//  Copyright (c) 2015 Nelly Chakarova. All rights reserved.
//

#import "CardMatchingGame.h"


@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,readwrite) NSMutableString *gameDisplay;
@property (nonatomic,strong) NSMutableArray *cards;
@end


@implementation CardMatchingGame

-(NSMutableArray*)cards{
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    
    self = [super init];
    
    if(self){
        for(int i=0; i< count; i++){
            Card* card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    self.score = 0;
    self.mode = 1;
    self.gameDisplay = [NSMutableString stringWithString:@"0 cards were chosen"];
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index{
    return (index< [self.cards count]) ? self.cards[index] : nil;
}


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
     self.gameDisplay = [NSMutableString stringWithFormat:@"%@ is chosen -%d",card,COST_TO_CHOOSE];
    if(card.isChosen){
        card.chosen = NO;
         self.gameDisplay = [NSMutableString stringWithFormat:@"%@ is unchosen",card];
    }else{
        
        NSMutableArray *chosenCards = [[NSMutableArray alloc]init];
        
        for(Card *otherCard in self.cards){
            if(otherCard.isChosen && !otherCard.isMatched){
                [chosenCards addObject:otherCard];
            }
        }
        
        
        if(chosenCards.count==self.mode){
            int matchScore = [card match:chosenCards];
            self.gameDisplay= [NSMutableString stringWithFormat:@"%@",card];
            
            if(matchScore){
                self.score += matchScore * MATCH_BONUS;
                
                for (Card *cardMatch in chosenCards) {
                    cardMatch.matched = YES;
                    [self.gameDisplay appendString: [NSString stringWithFormat:@" %@", cardMatch]];
                }
                card.matched = YES;
                [self.gameDisplay appendString: [NSString stringWithFormat:@" matched for %d poitns", matchScore]];
            }else{
                self.score -= MISMATCH_PENALTY;
                for (Card *cardMatch in chosenCards) {
                    cardMatch.matched = NO;
                    cardMatch.chosen = NO;
                    [self.gameDisplay appendString: [NSString stringWithFormat:@" %@", cardMatch]];
                }
                [self.gameDisplay appendString: [NSString stringWithFormat:@" matched for %d poitns", matchScore]];
            }
        }
        self.score -= COST_TO_CHOOSE;
        card.chosen = YES;
    }
}

@end
