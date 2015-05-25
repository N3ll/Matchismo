//
//  PlayingCard.m
//  Matchismo
//
//  Created by Nelly Chakarova on 06/05/15.
//  Copyright (c) 2015 Nelly Chakarova. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard


//-(int)match:(NSArray *)otherCards{
//    int score = 0;
//
//    if ([otherCards count] == 1) {
//        id card = [otherCards firstObject];
//        if([card isKindOfClass:[PlayingCard class]]){
//            PlayingCard *otherCard = (PlayingCard*)card;
//            if (otherCard.rank == self.rank) {
//                score = 4;
//            }else if ([otherCard.suit isEqualToString:self.suit]){
//                score = 1;
//            }
//        }
//    }else{
//
//
//    }
//
//
//    return score;
//}
//
//


-(int)match:(NSArray *)otherCards{
    //starts the case of only 2 cards matching
    if([otherCards isKindOfClass:[NSArray class]] && otherCards.count ==1){
        id card = [otherCards firstObject];
        if([card isKindOfClass:[PlayingCard class]]){
            PlayingCard *otherCard = (PlayingCard*)card;
            if (otherCard.rank == self.rank) {
                return 4;
            }else if ([otherCard.suit isEqualToString:self.suit]){
                return 2;
            }
        }
        return 0;
        //starts the case of n-cards matching
    }else{
        NSMutableArray *temp = [otherCards mutableCopy];
        //adding the self card in order to be able to check recursively in the whole array for matching ranks and suits. But add it only once
        if(![temp containsObject:self]){
            [temp insertObject:self atIndex:temp.count-1];
        }
        
        //if base case for the recursion
        if ([temp count] == 2) {
            id card = [otherCards firstObject];
            id card2 = otherCards[1];
            if([card isKindOfClass:[PlayingCard class]] && [card2 isKindOfClass:[PlayingCard class]]){
                PlayingCard *otherCard = (PlayingCard*)card;
                PlayingCard *otherCard2 = (PlayingCard*)card2;
                if (otherCard.rank == otherCard2.rank) {
                    return 2;
                }else if ([otherCard.suit isEqualToString:otherCard2.suit]){
                    return 1;
                }
            }
            return 0;
            //checking recursively in the array if the cards match (rank and suit) and removing the front element
        }else{
            int score = 0;
            id card = [otherCards firstObject];
            if([card isKindOfClass:[PlayingCard class]]){
                PlayingCard *otherCard = (PlayingCard*)card;
                for(int i =1; i< temp.count; i++){
                    if (((PlayingCard*)temp[i]).rank == otherCard.rank) {
                        score += 2;
                    }else if ([otherCard.suit isEqualToString:((PlayingCard*)temp[i]).suit]){
                        score += 1;
                    }
                }
            }
            
            [temp removeObjectAtIndex:0];
            return score + [self match:temp];
        }
    }
    return 0;
}


+(NSArray*) ranksStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

-(NSString*) contents{
    NSArray *rankStrings = [PlayingCard ranksStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+(NSArray*)validSuits{
    return @[@"♥️",@"♦️",@"♠️",@"♣️"];
}

-(void) setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject: suit]){
        _suit =suit;
    }
}

-(NSString*) suit{
    return _suit ? _suit :@"?";
}
+(NSUInteger)maxRank{
    return [[self ranksStrings] count]-1;
}

-(void)setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank =rank;
    }
}

-(NSString *)description{
    return [NSString stringWithFormat:@"%@%@",self.suit, [PlayingCard ranksStrings][ self.rank]];
}
@end
